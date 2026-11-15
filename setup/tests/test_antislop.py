"""aios-ui-verify's antislop.py: Hallmark's sloplint on a non-Hallmark project, without the Hallmark-only gates."""

import importlib.util
import os
import re
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("antislop", ROOT / "ai-config/skills/aios-ui-verify/scripts/antislop.py")
antislop = importlib.util.module_from_spec(spec)
spec.loader.exec_module(antislop)


@unittest.skipUnless(shutil.which("node"), "needs node")
class AntislopTests(unittest.TestCase):
    def project(self, files):
        root = Path(tempfile.mkdtemp())
        for name, text in files.items():
            (root / name).parent.mkdir(parents=True, exist_ok=True)
            (root / name).write_text(text, encoding="utf-8")
        return root

    def gates(self, root):
        return sorted({f["gate"] for f in antislop.run([root])})

    def test_a_shadcn_token_block_and_no_stamp_are_not_findings(self):
        root = self.project({"src/index.css": ":root { --primary: #b3ee55; }\n.dark { --primary: oklch(0.9 0.2 130); }\n"
                                              "a:focus-visible { outline: 2px solid var(--primary); }\n"})
        self.assertNotIn("20", self.gates(root))
        self.assertNotIn("48", self.gates(root))

    def test_transition_all_and_an_unlabelled_svg_stay(self):
        root = self.project({"src/App.tsx": 'export const A = () => <div className="transition-all focus-visible:ring-2">'
                                            '<svg width="10" height="10"><path d="M0 0"/></svg></div>\n'})
        gates = self.gates(root)
        self.assertIn("10a", gates)
        self.assertIn("33", gates)

    def test_tailwind_focus_variant_counts_as_focus_styling(self):
        with_variant = self.project({"src/B.tsx": 'export const B = () => <button className="focus-visible:ring-2">b</button>\n'})
        without = self.project({"src/B.tsx": 'export const B = () => <button className="ring-2">b</button>\n'})
        self.assertNotIn("26a", self.gates(with_variant))
        self.assertIn("26a", self.gates(without))

    def test_exit_codes_and_relative_paths(self):
        root = self.project({"src/App.tsx": 'export const A = () => <div className="transition-all">x</div>\n'})
        self.assertEqual(antislop.main([str(root)]), 1)
        clean = self.project({"src/index.css": ":root { --bg: #fff; }\nbody { background: var(--bg); }\n"
                                               "a:focus-visible { outline: 2px solid; }\n"})
        self.assertEqual(antislop.main([str(clean)]), 0)
        real = antislop.SLOPLINT
        antislop.SLOPLINT = root / "no-sloplint.mjs"
        try:
            self.assertEqual(antislop.main([str(root)]), 2)
        finally:
            antislop.SLOPLINT = real

    def test_writes_nothing_into_the_project(self):
        root = self.project({"src/App.tsx": 'export const A = () => <div className="transition-all">x</div>\n'})
        before = sorted(p.relative_to(root) for p in root.rglob("*"))
        antislop.run([root])
        self.assertEqual(sorted(p.relative_to(root) for p in root.rglob("*")), before)


class AntislopFilterTests(unittest.TestCase):
    def test_a_path_on_another_drive_stays_absolute(self):
        real = antislop.os.path.relpath
        def other_drive(p, *a):
            raise ValueError("path is on mount 'C:', start on mount 'D:'")
        antislop.os.path.relpath = other_drive
        try:
            self.assertEqual(antislop.shorten("/abs/x.tsx"), "/abs/x.tsx")
        finally:
            antislop.os.path.relpath = real
        self.assertEqual(antislop.shorten("src/x.tsx"), "src/x.tsx")

    def test_token_definitions_only(self):
        keep = antislop.keep
        self.assertFalse(keep({"gate": "48", "evidence": "colour literal #fff outside tokens (--card on .dark)"}))
        self.assertTrue(keep({"gate": "48", "evidence": "colour literal [box-shadow:rgba(0,0,0,.1)] in a class …"}))
        self.assertFalse(keep({"gate": "20", "evidence": "no Hallmark stamp"}))
        self.assertTrue(keep({"gate": "26a", "evidence": "no :focus-visible styling anywhere"}, tw_focus=False))
        self.assertFalse(keep({"gate": "26a", "evidence": "no :focus-visible styling anywhere"}, tw_focus=True))


@unittest.skipIf(os.name == "nt" or not shutil.which("node"), "bash launcher; needs node")
class RenderTests(unittest.TestCase):
    def test_render_screenshots_leave_the_project(self):
        # a stand-in launcher that does what sloplint --render does: screenshots in a .hallmark/ beside the file
        root = Path(tempfile.mkdtemp())
        page = root / "site" / "index.html"
        page.parent.mkdir()
        page.write_text("<p>x</p>", encoding="utf-8")
        fake = root / "fake.sh"
        fake.write_text('#!/usr/bin/env bash\nfor a; do case "$a" in /*.html) mkdir -p "$(dirname "$a")/.hallmark/shots"; '
                        'touch "$(dirname "$a")/.hallmark/shots/x.png";; esac; done\necho \'{"findings": []}\'\n', encoding="utf-8")
        real = antislop.LAUNCHER
        antislop.LAUNCHER = fake
        try:
            antislop.run([page], render=True, shots=root / "shots")
        finally:
            antislop.LAUNCHER = real
        self.assertFalse((page.parent / ".hallmark").exists(), "screenshots left in the project")
        self.assertTrue(list((root / "shots").rglob("x.png")))


@unittest.skipIf(os.name == "nt" or not shutil.which("node"), "bash launcher; needs node")
class LauncherTests(unittest.TestCase):
    LAUNCHER = ROOT / "ai-config/skills/aios-ui-verify/scripts/hallmark.sh"

    def run_launcher(self, *args):
        return subprocess.run(["bash", str(self.LAUNCHER), *args], capture_output=True, text=True, timeout=120,
                              env={**os.environ, "HALLMARK_NO_INSTALL": "1"})

    def test_only_the_skill_scripts_it_names(self):
        for bad in ("install", "install-hook", "picture", "../../x", ""):
            self.assertEqual(self.run_launcher(bad).returncode, 2, bad)

    def test_runs_a_hallmark_script(self):
        p = self.run_launcher("theme", "list")
        self.assertEqual(p.returncode, 0, p.stderr)
        self.assertIn("Kiln", p.stdout)


class CommandDriftTests(unittest.TestCase):
    """The aios-ui-* commands built on Hallmark only call scripts and theme.mjs subcommands that exist."""

    def test_every_launcher_call_exists(self):
        theme_usage = (ROOT / "ai-config/skills/hallmark/scripts/theme.mjs").read_text(encoding="utf-8")
        subs = set(re.findall(r"node theme\.mjs (\w+)", theme_usage))
        launcher = (ROOT / "ai-config/skills/aios-ui-verify/scripts/hallmark.sh").read_text(encoding="utf-8")
        allowed = set(re.search(r"^\s*(sloplint \| [^)]*)\)", launcher, re.M).group(1).replace(" ", "").split("|"))
        calls = 0
        for name in ("aios-ui-page", "aios-ui-redesign", "aios-ui-audit", "aios-ui-themes", "aios-ui-photos"):
            text = (ROOT / f"ai-config/skills/{name}/SKILL.md").read_text(encoding="utf-8")
            self.assertIn("disable-model-invocation: true", text, name)
            for script, sub in re.findall(r"\$H (\w+)(?: (\w+))?", text):
                calls += 1
                self.assertIn(script, allowed, f"{name}: $H {script}")
                if script == "theme" and sub:
                    self.assertIn(sub, subs, f"{name}: $H theme {sub}")
            self.assertNotIn("theme index", text, name)
        self.assertGreater(calls, 8, "the regex stopped finding the commands' launcher calls")


if __name__ == "__main__":
    unittest.main()
