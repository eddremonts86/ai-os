"""/aios-ui-system-share: the registry items it generates, its guards and its helpers.

The always-on tests never touch the network. `AIOS_SHADCN_TESTS=1` adds a class that runs the pinned shadcn CLI
against a temporary project; without it the CLI behaviours behind the placement rules are not exercised, and a
skipped run is not a pass.
"""

import contextlib
import importlib.util
import io
import json
import os
import re
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SKILL = ROOT / "ai-config/skills/aios-ui-system-share"
spec = importlib.util.spec_from_file_location("registry", SKILL / "scripts/registry.py")
registry = importlib.util.module_from_spec(spec)
spec.loader.exec_module(registry)
tk = registry.tokens

COLORS = {name: f"#{(i * 37 + 20) % 256:02x}{(i * 53 + 30) % 256:02x}{(i * 71 + 40) % 256:02x}"
          for i, name in enumerate(tk.COLOR_VARS)}
DARK = {name: f"#{255 - int(v[1:3], 16):02x}{255 - int(v[3:5], 16):02x}{255 - int(v[5:7], 16):02x}" for name, v in COLORS.items()}
assert len(set(COLORS.values()) | set(DARK.values())) == 2 * len(COLORS), "fixture colours must be distinct"


def sheet(extra_root="", extra_theme="", extra_dark="", imports=""):
    light = "\n".join(f"  {n}: {v};" for n, v in COLORS.items())
    dark = "\n".join(f"  {n}: {v};" for n, v in DARK.items())
    return f"""{imports}
@theme inline {{
  --font-sans: 'Geist Variable', ui-sans-serif, sans-serif;
  --font-mono: ui-monospace, monospace;
  --transition-duration-fast: var(--duration-fast);
  --color-background: var(--background);
  --font-heading: var(--font-sans);
  --spacing-control: var(--control-height);
  {extra_theme}
}}
@theme {{
  --shadow-sm: 0 1px 2px 0 var(--shadow-color);
  --shadow-md: 0 4px 10px -2px var(--shadow-color);
  --shadow-lg: 0 14px 28px -6px var(--shadow-color);
  --ease-out: cubic-bezier(0.2, 0, 0, 1);
  --animate-pop: pop 200ms var(--ease-out) both;
}}
:root {{
{light}
  --radius: 0.5rem;
  --shadow-color: rgb(0 0 0 / 9%);
  --duration-fast: 120ms;
  --duration-base: 200ms;
  --control-height: 2rem;
  {extra_root}
}}
.dark {{
{dark}
  --shadow-color: rgb(0 0 0 / 55%);
  {extra_dark}
}}
@media (prefers-reduced-motion: reduce) {{
  :root {{ --duration-fast: 0ms; --duration-base: 0ms; }}
}}
@media (width < 48rem) {{
  :root {{ --control-height: 2.75rem; }}
}}
"""


def build(css=None, **kw):
    args = dict(name="acme", scope="personal", version="0.1.0", design_path="registry/acme/DESIGN.md")
    args.update(kw)
    return registry.build(css if css is not None else sheet(), **args)


def flat(item):
    """{(where, name): value} of one item, through the module's own reader."""
    return {(w, n): v for w, n, v in registry.item_vars(item)}


class BuildTests(unittest.TestCase):
    def test_every_exported_value_round_trips(self):
        out = build()
        got = flat(out["items"]["acme-tokens"])
        blocks = tk.parse_css(sheet())
        for name in tk.COLOR_VARS:
            self.assertEqual(got["light", name], COLORS[name], name)
            self.assertEqual(got["dark", name], DARK[name], name)
        self.assertEqual(got["light", "--radius"], "0.5rem")
        for name in ("--font-sans", "--font-mono", "--shadow-sm", "--shadow-md", "--shadow-lg", "--ease-out",
                     "--transition-duration-fast", "--spacing-control"):
            self.assertEqual(got["theme", name], " ".join((blocks["@theme"][name]).split()), name)
        self.assertEqual(got[":root", "--duration-fast"], "120ms")
        self.assertEqual(got[":root", "--shadow-color"], "rgb(0 0 0 / 9%)")
        self.assertEqual(got[".dark", "--shadow-color"], "rgb(0 0 0 / 55%)")

    def test_no_value_in_cssvars_refers_to_its_own_name(self):
        item = build()["items"]["acme-tokens"]
        for group, vars_ in item["cssVars"].items():
            for name, value in vars_.items():
                self.assertNotEqual(value.strip(), f"var(--{name})", f"{group}.{name}")

    def test_single_mode_variables_live_in_css_root_not_in_cssvars(self):
        item = build()["items"]["acme-tokens"]
        for name in ("duration-fast", "duration-base", "shadow-color", "control-height"):
            self.assertNotIn(name, item["cssVars"]["light"])
            self.assertNotIn(name, item["cssVars"]["theme"])
            self.assertIn(f"--{name}", item["css"][":root"])

    def test_theme_is_never_a_css_key(self):
        self.assertNotIn("@theme", build()["items"]["acme-tokens"]["css"])
        self.assertNotIn("@theme inline", build()["items"]["acme-tokens"]["css"])

    def test_media_overrides_of_exported_variables_travel(self):
        css = build()["items"]["acme-tokens"]["css"]
        self.assertEqual(css["@media (prefers-reduced-motion: reduce)"][":root"],
                         {"--duration-fast": "0ms", "--duration-base": "0ms"})
        self.assertEqual(css["@media (width < 48rem)"][":root"], {"--control-height": "2.75rem"})

    def test_item_types_files_and_meta(self):
        items = build()["items"]
        self.assertEqual(sorted(items), ["acme-base", "acme-design-md", "acme-tokens"])  # no font import, no bundle
        self.assertEqual(items["acme-tokens"]["type"], "registry:theme")
        md = items["acme-design-md"]
        self.assertEqual(md["type"], "registry:file")
        self.assertEqual(md["files"], [{"path": "registry/acme/DESIGN.md", "type": "registry:file", "target": "~/DESIGN.md"}])
        base = items["acme-base"]
        self.assertEqual(base["type"], "registry:base")
        self.assertEqual(base["config"], {"style": "base-nova", "iconLibrary": "lucide",
                                          "tailwind": {"baseColor": "neutral"}})
        self.assertEqual(base["cssVars"], items["acme-tokens"]["cssVars"])
        self.assertEqual(base["files"], md["files"])  # a new project gets DESIGN.md with the tokens
        for name in ("acme-tokens", "acme-base"):
            self.assertEqual(items[name]["meta"], {"scope": "personal", "version": "0.1.0", "install": "tokens"})
        self.assertEqual(items["acme-design-md"]["meta"]["install"], "once")

    def test_the_registry_json_lists_every_item_once(self):
        out = build()
        listed = [i["name"] for i in out["registry"]["items"]]
        self.assertEqual(sorted(listed), sorted(out["items"]))
        self.assertEqual(out["registry"]["name"], "acme")

    def test_a_font_item_only_for_a_fontsource_import(self):
        out = build(sheet(imports='@import "@fontsource-variable/geist";'))
        font = out["items"]["acme-font"]
        self.assertEqual(font["type"], "registry:font")
        self.assertEqual(font["font"]["dependency"], "@fontsource-variable/geist")
        self.assertEqual(font["font"]["variable"], "--font-sans")
        self.assertEqual(font["font"]["family"], "'Geist Variable', ui-sans-serif, sans-serif")

    def test_variables_outside_the_export_set_are_reported_but_colour_aliases_are_not(self):
        out = build(sheet(extra_root="--brand-extra: 1px;", extra_theme="--spacing-card: 2rem;"))
        self.assertEqual(sorted(out["skipped"]), ["--animate-pop", "--brand-extra", "--font-heading", "--spacing-card"])

    def test_a_var_pointing_outside_the_export_set_fails(self):
        css = sheet(extra_root="--duration-slow: var(--brand-delay);")
        with self.assertRaises(ValueError) as cm:
            build(css)
        self.assertIn("--brand-delay", str(cm.exception))
        self.assertIn("--duration-slow", str(cm.exception))

    def test_scope_and_name_are_required(self):
        for bad in ({"scope": ""}, {"scope": None}, {"name": ""}, {"name": "Not A Slug"}):
            with self.assertRaises(ValueError, msg=bad):
                build(**bad)

    def test_the_stylesheet_must_define_the_contract(self):
        with self.assertRaises(ValueError):
            build(":root { --background: #fff; }")


class WriteColorsTests(unittest.TestCase):
    MD = '---\nname: Acme\ncolors:\n  background: "#ffffff"\n  background-dark: "#000000"\ntypography:\n  base: x\n---\n\n# Body\n'

    def test_only_the_colors_block_changes(self):
        out = registry.write_colors(self.MD, 'colors:\n  background: "#fefefe"\n  primary: "#123456"')
        self.assertEqual(out, '---\nname: Acme\ncolors:\n  background: "#fefefe"\n  primary: "#123456"\ntypography:\n  base: x\n---\n\n# Body\n')

    def test_crlf_files_keep_their_line_endings(self):
        crlf = self.MD.replace("\n", "\r\n")
        out = registry.write_colors(crlf, 'colors:\n  background: "#fefefe"')
        self.assertNotIn("\r\r", out)
        self.assertEqual(out.count("\r\n"), out.count("\n"))
        self.assertIn('background: "#fefefe"', out)

    def test_refuses_a_file_it_cannot_edit_safely(self):
        block = 'colors:\n  a: "#fff"'
        for text in ("# no frontmatter\n", "---\nname: x\n---\n", '---\ncolors:\n  nested:\n    a: "#fff"\n---\n'):
            with self.assertRaises(ValueError, msg=text):
                registry.write_colors(text, block)


class UpdateDesignTests(unittest.TestCase):
    def test_a_crlf_designmd_stays_crlf_through_the_update_path(self):
        with tempfile.TemporaryDirectory() as d:
            md = Path(d, "DESIGN.md")
            md.write_bytes('---\r\nname: A\r\ncolors:\r\n  background: "#ffffff"\r\n---\r\n\r\nBody\r\n'.encode("utf-8"))
            notes = registry.update_design(md, 'colors:\n  background: "#fefefe"', [])
            raw = md.read_bytes()
            self.assertEqual(notes, [])
            self.assertIn(b'background: "#fefefe"', raw)
            self.assertEqual(raw.count(b"\r\n"), raw.count(b"\n"))

    def test_a_file_it_cannot_edit_is_reported_not_rewritten(self):
        with tempfile.TemporaryDirectory() as d:
            md = Path(d, "DESIGN.md")
            md.write_text("# no frontmatter\n", encoding="utf-8")
            notes = registry.update_design(md, 'colors:\n  a: "#fff"', [])
            self.assertIn("DESIGN.md not updated", notes[0])
            self.assertEqual(md.read_text(encoding="utf-8"), "# no frontmatter\n")


class GuardTests(unittest.TestCase):
    def test_guard(self):
        known = {"personal", "acme"}
        self.assertIsNone(registry.scope_problem("personal", "personal", known))
        for item, consumer, expect in ((None, "personal", "no scope"), ("personal", None, "no scope"),
                                       ("ghost", "ghost", "not a scope"), ("personal", "acme", "personal.*acme")):
            msg = registry.scope_problem(item, consumer, known)
            self.assertIsNotNone(msg, (item, consumer))
            self.assertRegex(msg, expect)

    def test_no_known_scopes_means_unresolved(self):
        self.assertIn("no scopes", registry.scope_problem("personal", "personal", set()))


class LockAndDriftTests(unittest.TestCase):
    def test_a_local_edit_and_an_upstream_change_are_told_apart(self):
        v1 = build()["items"]["acme-tokens"]
        installed = sheet()
        lock = registry.make_lock(v1, installed, address="/x/acme-tokens.json")
        self.assertEqual(lock["version"], "0.1.0")
        self.assertEqual(lock["scope"], "personal")
        # the consumer edits --primary; the producer changes --radius
        edited = installed.replace(COLORS["--primary"], "#010203", 1)
        css_v2 = sheet().replace("--radius: 0.5rem", "--radius: 1rem")
        v2 = build(css_v2, version="0.2.0")["items"]["acme-tokens"]
        drift = registry.drift(lock, edited, v2)
        self.assertEqual([e["name"] for e in drift["local_edits"]], ["--primary"])
        self.assertEqual(drift["local_edits"][0]["lock"], COLORS["--primary"])
        self.assertEqual(drift["local_edits"][0]["now"], "#010203")
        self.assertEqual([(e["where"], e["name"]) for e in drift["upstream"]], [("light", "--radius")])

    def test_nothing_changed_means_no_drift(self):
        item = build()["items"]["acme-tokens"]
        lock = registry.make_lock(item, sheet(), address="a")
        self.assertEqual(registry.drift(lock, sheet(), item), {"local_edits": [], "upstream": []})

    def test_the_lock_survives_json(self):
        item = build()["items"]["acme-tokens"]
        lock = registry.make_lock(item, sheet(), address="a")
        self.assertEqual(json.loads(json.dumps(lock)), lock)


class Calls:
    """A stand-in for subprocess.run that records the commands and answers from a script."""

    def __init__(self, answers=()):
        self.cmds, self.answers = [], list(answers)

    def __call__(self, cmd, **kw):
        self.cmds.append(cmd)
        out = self.answers.pop(0) if self.answers else (0, "", "")
        if isinstance(out, Exception):
            raise out
        return subprocess.CompletedProcess(cmd, out[0], out[1], out[2])


class PublishTests(unittest.TestCase):
    def project(self, d, components=None):
        Path(d, "src").mkdir()
        Path(d, "src/index.css").write_text(sheet(), encoding="utf-8")
        Path(d, "DESIGN.md").write_text("---\nname: Acme\n---\n", encoding="utf-8")
        if components:
            Path(d, "components.json").write_text(json.dumps(components), encoding="utf-8")

    def test_nothing_is_written_when_the_cli_cannot_be_reached(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d)
            with self.assertRaises(SystemExit) as cm:
                registry.publish(d, name="acme", scope="personal", gates=False,
                                 run=Calls([(1, "", "npm error code ENOTFOUND registry.npmjs.org")]))
            self.assertEqual(cm.exception.code, 2)
            self.assertFalse(Path(d, "registry.json").exists())
            self.assertFalse(Path(d, "registry").exists())

    def test_the_scope_must_be_the_projects_own(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d)
            for known, here in (({"personal", "other"}, "other"), ({"personal"}, None), ({"personal"}, "personal")):
                calls = Calls()
                scope = "personal" if here != "personal" else "ghost"
                with self.assertRaises(SystemExit, msg=(known, here, scope)):
                    registry.publish(d, name="acme", scope=scope, run=calls, scopes=lambda p, k=known, h=here: (k, h))
                self.assertEqual(calls.cmds, [])

    def test_style_icons_and_base_colour_come_from_the_projects_components_json(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d, {"style": "new-york", "iconLibrary": "phosphor", "tailwind": {"baseColor": "zinc"}})
            registry.publish(d, name="acme", scope="personal", gates=False, run=Calls())
            base = next(i for i in json.loads(Path(d, "registry.json").read_text(encoding="utf-8"))["items"] if i["name"] == "acme-base")
            self.assertEqual(base["config"], {"style": "new-york", "iconLibrary": "phosphor", "tailwind": {"baseColor": "zinc"}})

    def test_the_registry_is_built_outside_public(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d)
            calls = Calls()
            registry.publish(d, name="acme", scope="personal", gates=False, run=calls)
            self.assertIn(["build", "-o", "registry/dist"], [c[c.index("shadcn@" + registry.SHADCN_VERSION) + 1:] for c in calls.cmds])


class CliRunnerTests(unittest.TestCase):
    def test_runs_the_pinned_version_through_the_projects_package_runner(self):
        with tempfile.TemporaryDirectory() as d:
            calls = Calls()
            registry.run_shadcn(["add", "x.json", "-y"], d, run=calls, env={})
            self.assertEqual(calls.cmds[0][-4:], ["shadcn@" + registry.SHADCN_VERSION, "add", "x.json", "-y"])
            self.assertEqual(Path(calls.cmds[0][0]).stem.lower(), "npx")  # a full path ending in npx.CMD on Windows
            Path(d, "pnpm-lock.yaml").write_text("", encoding="utf-8")
            calls = Calls()
            registry.run_shadcn(["add", "x.json"], d, run=calls, env={})
            self.assertEqual((Path(calls.cmds[0][0]).stem.lower(), calls.cmds[0][1]), ("pnpm", "dlx"))

    def test_windows_resolves_the_runner_to_a_full_path_and_output_is_decoded_as_utf8(self):
        from unittest import mock
        with mock.patch.object(registry.shutil, "which", lambda n: "C:/node/" + n + ".cmd"):
            self.assertEqual(registry._runner("npx", True), "C:/node/npx.cmd")
            self.assertEqual(registry._runner("npx", False), "npx")
        seen = {}

        def run(cmd, **kw):
            seen.update(kw)
            return subprocess.CompletedProcess(cmd, 0, "", "")

        with tempfile.TemporaryDirectory() as d:
            registry.run_shadcn(["add", "x"], d, run=run, env={})
        self.assertEqual((seen["encoding"], seen["errors"]), ("utf-8", "replace"))

    def test_the_version_can_be_overridden_by_the_environment(self):
        with tempfile.TemporaryDirectory() as d:
            calls = Calls()
            registry.run_shadcn(["--version"], d, run=calls, env={"AIOS_SHADCN_VERSION": "9.9.9"})
            self.assertIn("shadcn@9.9.9", calls.cmds[0])

    def test_unreachable_exits_2_with_the_version_and_the_reason(self):
        with tempfile.TemporaryDirectory() as d:
            for answer in ((1, "", "npm error code ENOTFOUND registry.npmjs.org"), FileNotFoundError("npx")):
                with self.assertRaises(SystemExit) as cm:
                    registry.run_shadcn(["add", "x"], d, run=Calls([answer]), env={})
                self.assertEqual(cm.exception.code, 2)

    def test_the_message_names_the_cause_not_the_log_pointer(self):
        cases = (("npm error code ENOTFOUND\nnpm error A complete log of this run can be found in /x.log", "not reachable", "ENOTFOUND"),
                 ("npm error code ETARGET\nnpm error notarget No matching version found for shadcn@0.0.1", "does not exist", "No matching version|ETARGET"))
        with tempfile.TemporaryDirectory() as d:
            for text, kind, cause in cases:
                err = io.StringIO()
                with contextlib.redirect_stderr(err), self.assertRaises(SystemExit) as cm:
                    registry.run_shadcn(["add", "x"], d, run=Calls([(1, "", text)]), env={})
                self.assertEqual(cm.exception.code, 2)
                self.assertIn(kind, err.getvalue())
                self.assertRegex(err.getvalue(), cause)
                self.assertNotIn("complete log", err.getvalue())

    def test_a_real_cli_failure_exits_1_and_keeps_the_output(self):
        with tempfile.TemporaryDirectory() as d:
            with self.assertRaises(SystemExit) as cm:
                registry.run_shadcn(["add", "x"], d, run=Calls([(1, "", "Invalid item")]), env={})
            self.assertEqual(cm.exception.code, 1)


@unittest.skipUnless(shutil.which("git"), "git is needed")
class GitGuardTests(unittest.TestCase):
    def git(self, d, *args):
        env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
        subprocess.run(["git", "-c", "user.name=t", "-c", "user.email=t@example.com", *args], cwd=d, env=env,
                       check=True, capture_output=True)

    def test_a_folder_that_is_not_a_repository_is_refused(self):
        with tempfile.TemporaryDirectory() as d:
            self.assertIn("not a git repository", registry.tree_problem(d))

    def test_a_dirty_tree_is_refused_and_a_clean_one_is_not(self):
        with tempfile.TemporaryDirectory() as d:
            self.git(d, "init", "-q")
            Path(d, "a.txt").write_text("a", encoding="utf-8")
            self.assertIn("uncommitted", registry.tree_problem(d))
            self.git(d, "add", "-A")
            self.git(d, "commit", "-qm", "x")
            self.assertIsNone(registry.tree_problem(d))

    def test_a_relative_address_reaches_the_cli_as_an_absolute_path(self):
        with tempfile.TemporaryDirectory() as d:
            self.git(d, "init", "-q")
            Path(d, "keep").write_text("x", encoding="utf-8")
            self.git(d, "add", "-A")
            self.git(d, "commit", "-qm", "x")
            item = Path(d, "elsewhere")
            item.mkdir()
            Path(item, "acme-tokens.json").write_text(json.dumps(build()["items"]["acme-tokens"]), encoding="utf-8")
            Path(d, "src").mkdir()
            Path(d, "src/index.css").write_text(sheet(), encoding="utf-8")
            self.git(d, "add", "-A")
            self.git(d, "commit", "-qm", "css")
            here = os.getcwd()
            try:
                os.chdir(item)
                calls = Calls()
                with contextlib.redirect_stdout(io.StringIO()):  # the fixture's colours fail the contrast check on purpose
                    registry.install("acme-tokens.json", d, run=calls, scopes=lambda p: ({"personal"}, "personal"))
            finally:
                os.chdir(here)
            add = next(c for c in calls.cmds if "add" in c)
            self.assertTrue(Path(add[add.index("add") + 1]).is_absolute())
            lock = json.loads(Path(d, registry.LOCK).read_text(encoding="utf-8"))
            self.assertTrue(Path(lock["address"]).is_absolute())

    def test_install_refuses_before_the_cli_is_called(self):
        with tempfile.TemporaryDirectory() as d:
            calls = Calls()
            with self.assertRaises(SystemExit) as cm:
                registry.install("/x/acme-tokens.json", d, run=calls)
            self.assertNotEqual(cm.exception.code, 0)
            self.assertEqual(calls.cmds, [])


class InitTests(unittest.TestCase):
    OK = staticmethod(lambda p: ({"personal"}, "personal"))

    def base_item(self, d, scope="personal"):
        path = Path(d, "acme-base.json")
        path.write_text(json.dumps(build(scope=scope)["items"]["acme-base"]), encoding="utf-8")
        return path

    def test_init_runs_the_pinned_cli_with_the_base_item(self):
        with tempfile.TemporaryDirectory() as d:
            base, calls = self.base_item(d), Calls()
            registry.init_project(base, "fresh", d, run=calls, scopes=self.OK)
            cmd = calls.cmds[0]
            self.assertEqual(cmd[cmd.index("shadcn@" + registry.SHADCN_VERSION) + 1:][:5], ["init", str(base.resolve()), "-t", "vite", "-y"])
            self.assertEqual(cmd[cmd.index("--name") + 1], "fresh")

    def test_init_with_a_relative_folder_passes_an_absolute_cwd(self):
        with tempfile.TemporaryDirectory() as d:
            base, calls, here = self.base_item(d), Calls(), os.getcwd()
            try:
                os.chdir(d)
                registry.init_project("acme-base.json", "fresh", ".", run=calls, scopes=self.OK)
            finally:
                os.chdir(here)
            cmd = calls.cmds[0]
            self.assertTrue(Path(cmd[cmd.index("--cwd") + 1]).is_absolute())

    def test_init_refuses_an_existing_folder_a_bad_name_and_a_scope_mismatch(self):
        with tempfile.TemporaryDirectory() as d:
            base = self.base_item(d)
            Path(d, "taken").mkdir()
            cases = (("taken", self.OK), ("Bad Name", self.OK), ("fresh", lambda p: ({"personal", "acme"}, "acme")))
            for name, scopes in cases:
                calls = Calls()
                with self.assertRaises(SystemExit, msg=name):
                    registry.init_project(base, name, d, run=calls, scopes=scopes)
                self.assertEqual(calls.cmds, [], name)


class StaleDesignNotesTests(unittest.TestCase):
    def test_prose_that_quotes_the_old_value_of_a_changed_token_is_flagged(self):
        up = [{"where": "light", "name": "--radius", "lock": "0.375rem", "new": "0.75rem"},
              {"where": "light", "name": "--primary", "lock": "#111111", "new": "#222222"},
              {"where": "light", "name": "--ease-out", "lock": None, "new": "linear"}]
        notes = registry.stale_design_notes("`--radius` is 0.375rem and primary is #111111.", up)
        self.assertEqual(len(notes), 1)
        self.assertIn("0.375rem", notes[0])


@unittest.skipUnless(shutil.which("git"), "git is needed")
class MainTests(unittest.TestCase):
    def test_update_without_a_lock_file_stops_with_code_3(self):
        with tempfile.TemporaryDirectory() as d:
            env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
            subprocess.run(["git", "init", "-q"], cwd=d, env=env, check=True, capture_output=True)
            with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as cm:
                registry.main(["update", d])
            self.assertEqual(cm.exception.code, 3)

    def test_there_is_no_subcommand_that_skips_the_guards(self):
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as cm:
            registry.main(["build", "x.css", "--design", "d", "--name", "n", "--scope", "s"])
        self.assertEqual(cm.exception.code, 2)


class FakeShadcn:
    """Answers `shadcn view <github address>` from a dict of items and records everything else, like the real CLI."""

    def __init__(self, items, on_init=None):
        self.items, self.cmds, self.on_init = items, [], on_init

    def __call__(self, cmd, **kw):
        self.cmds.append(cmd)
        args = cmd[cmd.index("shadcn@" + registry.SHADCN_VERSION) + 1:]
        if args[0] == "view":
            name = args[1].split("/")[-1].split("#")[0]
            if name in self.items:
                return subprocess.CompletedProcess(cmd, 0, "Using gh credentials.\n" + json.dumps([self.items[name]]), "")
            return subprocess.CompletedProcess(cmd, 1, "", f'Registry item "{name}" was not found.')
        if args[0] == "init" and self.on_init:
            self.on_init(args)
        return subprocess.CompletedProcess(cmd, 0, "", "")

    def args(self, verb):
        return [c[c.index("shadcn@" + registry.SHADCN_VERSION) + 1:] for c in self.cmds
                if c[c.index("shadcn@" + registry.SHADCN_VERSION) + 1] == verb]


class AddressTests(unittest.TestCase):
    def test_github_and_local_addresses_are_told_apart(self):
        kind, v = registry.parse_address("me/design-systems/acme-tokens#v1.0.0")
        self.assertEqual((kind, v["owner"], v["repo"], v["item"], v["ref"]), ("github", "me", "design-systems", "acme-tokens", "v1.0.0"))
        self.assertIsNone(registry.parse_address("me/design-systems/acme-tokens")[1]["ref"])
        for local in ("registry/dist/acme-tokens.json", "C:/x/acme-tokens.json", "./a/b/c.json", "just-a-name"):
            self.assertEqual(registry.parse_address(local)[0], "local", local)

    def test_an_address_cannot_start_with_a_dash_or_climb_out_of_a_folder(self):
        for risky in ("-x/y/z", "--help/y/z", "me/-r/z", "../registry/dist/acme-tokens", "./a/b/c"):
            self.assertEqual(registry.parse_address(risky)[0], "local", risky)

    def test_an_existing_local_path_wins_over_a_github_shape(self):
        with tempfile.TemporaryDirectory() as d:
            here = os.getcwd()
            try:
                os.chdir(d)
                Path("me/repo").mkdir(parents=True)
                Path("me/repo/item").write_text("{}", encoding="utf-8")
                self.assertEqual(registry.parse_address("me/repo/item")[0], "local")
            finally:
                os.chdir(here)

    def test_with_ref_changes_or_adds_the_ref_and_refuses_local_paths(self):
        self.assertEqual(registry.with_ref("me/r/acme-tokens#v1", "v2"), "me/r/acme-tokens#v2")
        self.assertEqual(registry.with_ref("me/r/acme-tokens", "v2"), "me/r/acme-tokens#v2")
        with self.assertRaises(ValueError):
            registry.with_ref("registry/dist/acme-tokens.json", "v2")

    def test_siblings_keep_the_repo_and_the_ref(self):
        self.assertEqual(registry.sibling("me/r/acme-tokens#v1", "-tokens", "-design-md"), "me/r/acme-design-md#v1")
        self.assertEqual(registry.sibling("me/r/acme-base", "-base", "-tokens"), "me/r/acme-tokens")
        self.assertIsNone(registry.sibling("me/r/acme-other#v1", "-tokens", "-font"))
        self.assertEqual(registry.sibling("/x/acme-tokens.json", "-tokens", "-font"), str(Path("/x/acme-font.json")))


class GitHubItemTests(unittest.TestCase):
    def test_view_output_is_parsed_after_the_cli_banner(self):
        fake = FakeShadcn({"acme-tokens": build()["items"]["acme-tokens"]})
        with tempfile.TemporaryDirectory() as d:
            item = registry.fetch_item("me/r/acme-tokens#v1", d, fake)
        self.assertEqual(item["meta"]["scope"], "personal")
        self.assertEqual(fake.args("view"), [["view", "me/r/acme-tokens#v1"]])

    def test_a_missing_item_stops_with_the_cli_message(self):
        with tempfile.TemporaryDirectory() as d, contextlib.redirect_stderr(io.StringIO()) as err, \
                self.assertRaises(SystemExit) as cm:
            registry.fetch_item("me/r/nope#v1", d, FakeShadcn({}))
        self.assertEqual(cm.exception.code, 1)
        self.assertIn("nope", err.getvalue())

    def test_item_exists_does_not_exit_on_a_missing_item(self):
        with tempfile.TemporaryDirectory() as d:
            fake = FakeShadcn({"acme-tokens": {}})
            self.assertTrue(registry.item_exists("me/r/acme-tokens", d, fake))
            self.assertFalse(registry.item_exists("me/r/acme-font", d, fake))


@unittest.skipUnless(shutil.which("git"), "git is needed")
class GitHubFlowTests(unittest.TestCase):
    OK = staticmethod(lambda p: ({"personal"}, "personal"))
    ADDR = "me/design-systems/acme-tokens#v1"

    def project(self, d, design=False):
        env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
        Path(d, "src").mkdir()
        Path(d, "src/index.css").write_text(sheet(), encoding="utf-8")
        if design:
            Path(d, "DESIGN.md").write_text("---\nname: A\ncolors:\n  background: \"#ffffff\"\n---\n", encoding="utf-8")
        for args in (["init", "-q"], ["add", "-A"], ["-c", "user.name=t", "-c", "user.email=t@example.com", "commit", "-qm", "x"]):
            subprocess.run(["git", *args], cwd=d, env=env, check=True, capture_output=True)

    def items(self, version="0.1.0", css=None):
        out = build(css, version=version)["items"]
        return {"acme-tokens": out["acme-tokens"], "acme-design-md": out["acme-design-md"]}

    def quiet(self):
        return contextlib.redirect_stdout(io.StringIO())

    def test_install_adds_the_tokens_and_design_md_by_their_github_addresses(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d)
            fake = FakeShadcn(self.items())
            with self.quiet():
                registry.install(self.ADDR, d, run=fake, scopes=self.OK)
            self.assertEqual([a[1] for a in fake.args("add")], [self.ADDR, "me/design-systems/acme-design-md#v1"])
            lock = json.loads(Path(d, registry.LOCK).read_text(encoding="utf-8"))
            self.assertEqual((lock["address"], lock["name"], lock["version"]), (self.ADDR, "acme-tokens", "0.1.0"))

    def test_install_leaves_an_existing_design_md_alone(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d, design=True)
            fake = FakeShadcn(self.items())
            with self.quiet():
                registry.install(self.ADDR, d, run=fake, scopes=self.OK)
            self.assertEqual([a[1] for a in fake.args("add")], [self.ADDR])

    def test_install_refuses_a_scope_mismatch_before_adding_anything(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d)
            fake = FakeShadcn(self.items())
            with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as cm:
                registry.install(self.ADDR, d, run=fake, scopes=lambda p: ({"personal", "acme"}, "acme"))
            self.assertEqual(cm.exception.code, 3)
            self.assertEqual(fake.args("add"), [])

    def lock_project(self, d, ref="v1"):
        self.project(d)
        item = self.items()["acme-tokens"]
        Path(d, registry.LOCK).write_text(json.dumps(registry.make_lock(item, sheet(), f"me/design-systems/acme-tokens#{ref}")),
                                          encoding="utf-8")
        env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
        subprocess.run(["git", "add", "-A"], cwd=d, env=env, check=True, capture_output=True)
        subprocess.run(["git", "-c", "user.name=t", "-c", "user.email=t@example.com", "commit", "-qm", "lock"], cwd=d, env=env,
                       check=True, capture_output=True)

    def test_update_with_a_ref_previews_then_moves_the_lock_to_the_new_ref(self):
        v2 = self.items("0.2.0", sheet().replace("--radius: 0.5rem", "--radius: 1rem"))
        with tempfile.TemporaryDirectory() as d:
            self.lock_project(d)
            fake = FakeShadcn(v2)
            out = io.StringIO()
            with contextlib.redirect_stdout(out), contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as cm:
                registry.update(d, yes=False, run=fake, scopes=self.OK, ref="v2")
            self.assertEqual(cm.exception.code, 3)
            self.assertIn("--radius", out.getvalue())
            self.assertEqual(fake.args("add"), [])  # nothing applied without --yes
            with self.quiet():
                registry.update(d, yes=True, run=fake, scopes=self.OK, ref="v2")
            self.assertEqual(fake.args("add"), [["add", "me/design-systems/acme-tokens#v2", "-o", "-y"]])
            lock = json.loads(Path(d, registry.LOCK).read_text(encoding="utf-8"))
            self.assertEqual((lock["address"], lock["version"]), ("me/design-systems/acme-tokens#v2", "0.2.0"))

    def test_update_without_a_ref_reads_the_recorded_address(self):
        with tempfile.TemporaryDirectory() as d:
            self.lock_project(d)
            fake = FakeShadcn(self.items())
            with self.quiet():
                registry.update(d, yes=True, run=fake, scopes=self.OK)
            self.assertEqual(fake.args("view"), [["view", "me/design-systems/acme-tokens#v1"]])

    def test_a_ref_on_a_local_address_is_refused(self):
        with tempfile.TemporaryDirectory() as d:
            self.project(d)
            item = self.items()["acme-tokens"]
            local = Path(d, "built", "acme-tokens.json")
            local.parent.mkdir()
            local.write_text(json.dumps(item), encoding="utf-8")
            Path(d, registry.LOCK).write_text(json.dumps(registry.make_lock(item, sheet(), str(local))), encoding="utf-8")
            env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
            subprocess.run(["git", "add", "-A"], cwd=d, env=env, check=True, capture_output=True)
            subprocess.run(["git", "-c", "user.name=t", "-c", "user.email=t@example.com", "commit", "-qm", "l"], cwd=d, env=env,
                           check=True, capture_output=True)
            with contextlib.redirect_stderr(io.StringIO()) as err, self.assertRaises(SystemExit) as cm:
                registry.update(d, yes=True, run=Calls(), scopes=self.OK, ref="v2")
            self.assertEqual(cm.exception.code, 3)
            self.assertIn("GitHub", err.getvalue())

    def test_init_from_a_github_base_item_writes_the_lock_for_the_tokens_item(self):
        with tempfile.TemporaryDirectory() as d:
            base = build()["items"]["acme-base"]
            items = {**self.items(), "acme-base": base}

            def make_project(args):
                name = args[args.index("--name") + 1]
                Path(d, name, "src").mkdir(parents=True)
                Path(d, name, "src/index.css").write_text(sheet(), encoding="utf-8")

            fake = FakeShadcn(items, on_init=make_project)
            with self.quiet():
                registry.init_project("me/design-systems/acme-base#v1", "fresh", d, run=fake, scopes=self.OK)
            init = fake.args("init")[0]
            self.assertEqual(init[1], "me/design-systems/acme-base#v1")
            lock = json.loads(Path(d, "fresh", registry.LOCK).read_text(encoding="utf-8"))
            self.assertEqual((lock["address"], lock["name"]), ("me/design-systems/acme-tokens#v1", "acme-tokens"))


class MainRefTests(unittest.TestCase):
    @unittest.skipUnless(shutil.which("git"), "git is needed")
    def test_update_accepts_a_ref_argument(self):
        with tempfile.TemporaryDirectory() as d:
            env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
            subprocess.run(["git", "init", "-q"], cwd=d, env=env, check=True, capture_output=True)
            with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as cm:
                registry.main(["update", d, "--ref", "v2"])
            self.assertEqual(cm.exception.code, 3)  # reaches the lock-file check, so the argument parsed


@unittest.skipUnless(os.environ.get("AIOS_SHADCN_TESTS") == "1" and os.environ.get("AIOS_SHADCN_GITHUB_ITEM"),
                     "set AIOS_SHADCN_TESTS=1 and AIOS_SHADCN_GITHUB_ITEM=owner/repo/<name>-tokens#ref (needs gh auth)")
class RealGitHubTests(unittest.TestCase):
    """The installed tokens of a real GitHub registry arrive, with DESIGN.md, and the lock points at the address."""

    def test_install_from_github_passes_the_contract_check(self):
        tmp = Path(tempfile.mkdtemp(prefix="aios-gh-"))
        try:
            registry.run_shadcn(["init", "-t", "vite", "-b", "base", "-p", "nova", "-y", "--name", "consumer", "--cwd", str(tmp)], str(tmp))
            proj = tmp / "consumer"
            env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
            for args in (["init", "-q"], ["add", "-A"], ["-c", "user.name=t", "-c", "user.email=t@example.com", "commit", "-qm", "base"]):
                subprocess.run(["git", *args], cwd=proj, env=env, capture_output=True)
            address = os.environ["AIOS_SHADCN_GITHUB_ITEM"]
            scope = registry.fetch_item(address, str(proj), subprocess.run)["meta"]["scope"]
            with contextlib.redirect_stdout(io.StringIO()):
                code = registry.install(address, proj, scopes=lambda p: ({scope}, scope))
            self.assertEqual(code, 0)
            self.assertEqual(json.loads((proj / registry.LOCK).read_text(encoding="utf-8"))["address"], address)
            self.assertEqual(tk.check(proj), [])
        finally:
            shutil.rmtree(tmp, ignore_errors=True)

    def test_init_from_the_github_base_item_writes_the_lock_for_the_tokens_item(self):
        tokens_addr = os.environ["AIOS_SHADCN_GITHUB_ITEM"]
        base = registry.sibling(tokens_addr, "-tokens", "-base")
        tmp = Path(tempfile.mkdtemp(prefix="aios-ghinit-"))
        try:
            scope = registry.fetch_item(base, str(tmp), subprocess.run)["meta"]["scope"]
            with contextlib.redirect_stdout(io.StringIO()):
                registry.init_project(base, "fresh", tmp, scopes=lambda p: ({scope}, scope))
            self.assertEqual(json.loads((tmp / "fresh" / registry.LOCK).read_text(encoding="utf-8"))["address"], tokens_addr)
            self.assertTrue((tmp / "fresh" / "DESIGN.md").is_file())
        finally:
            shutil.rmtree(tmp, ignore_errors=True)


class SourceTests(unittest.TestCase):
    def test_the_script_has_no_shell_calls(self):
        text = (SKILL / "scripts/registry.py").read_text(encoding="utf-8")
        self.assertNotIn("shell=True", text)
        self.assertNotRegex(text, r"os\.system|\bbash\b|/bin/sh")

    def test_git_calls_do_not_inherit_git_variables(self):
        text = (SKILL / "scripts/registry.py").read_text(encoding="utf-8")
        self.assertIn('startswith("GIT_")', text)

    def test_the_pinned_version_is_a_plain_semver(self):
        self.assertRegex(registry.SHADCN_VERSION, r"^\d+\.\d+\.\d+$")


@unittest.skipUnless(os.environ.get("AIOS_SHADCN_TESTS") == "1", "set AIOS_SHADCN_TESTS=1 (needs network and node)")
class RealCliTests(unittest.TestCase):
    """What the placement rules rest on, against the pinned CLI in a temporary Vite + shadcn project."""

    @classmethod
    def setUpClass(cls):
        cls.tmp = Path(tempfile.mkdtemp(prefix="aios-share-"))
        cls.producer = cls.tmp / "producer"
        cls.consumer = cls.tmp / "consumer"
        cls.producer.mkdir()
        (cls.producer / "src").mkdir()
        (cls.producer / "src/index.css").write_text(sheet(), encoding="utf-8")
        (cls.producer / "DESIGN.md").write_text("---\nname: Acme\n" + tk.frontmatter(tk.parse_css(sheet())) + "\n---\n\n# Acme\n",
                                                encoding="utf-8")
        registry.run_shadcn(["init", "-t", "vite", "-b", "base", "-p", "nova", "-y", "--name", "consumer", "--cwd", str(cls.tmp)],
                            str(cls.tmp))
        cls.published = registry.publish(str(cls.producer), name="acme", scope="personal", version="0.1.0",
                                         gates=False)

    @classmethod
    def tearDownClass(cls):
        shutil.rmtree(cls.tmp, ignore_errors=True)

    def test_the_cli_validates_and_builds_the_registry(self):
        built = self.producer / "registry/dist"
        for name in ("acme-tokens", "acme-design-md", "acme-base"):
            self.assertTrue((built / f"{name}.json").is_file(), name)

    def test_installing_the_tokens_item_lands_every_value_without_self_references(self):
        self.git_baseline()
        registry.run_shadcn(["add", str(self.producer / "registry/dist/acme-tokens.json"), "-y"], str(self.consumer))
        css = (self.consumer / "src/index.css").read_text(encoding="utf-8")
        blocks = tk.parse_css(css)
        for name in tk.COLOR_VARS:
            self.assertEqual(blocks[":root"][name], COLORS[name], name)
        self.assertEqual(blocks[":root"]["--duration-fast"], "120ms")
        self.assertNotRegex(css, r"--duration-fast:\s*var\(--duration-fast\)")
        self.assertNotRegex(css, r"--control-height:\s*var\(--control-height\)")

    def test_init_from_the_base_item_writes_the_style_the_tokens_and_design_md(self):
        registry.init_project(self.producer / "registry/dist/acme-base.json", "fresh", self.tmp,
                              scopes=lambda path: ({"personal"}, "personal"))
        fresh = self.tmp / "fresh"
        components = json.loads((fresh / "components.json").read_text(encoding="utf-8"))
        self.assertEqual((components["style"], components["iconLibrary"], components["tailwind"]["baseColor"]),
                         ("base-nova", "lucide", "neutral"))
        blocks = tk.parse_css((fresh / "src/index.css").read_text(encoding="utf-8"))
        self.assertEqual(blocks[":root"]["--primary"], COLORS["--primary"])
        self.assertTrue((fresh / "DESIGN.md").is_file())
        self.assertEqual(json.loads((fresh / registry.LOCK).read_text(encoding="utf-8"))["name"], "acme-tokens")

    def test_update_reports_then_overwrites_a_local_edit_and_keeps_designmd_lines(self):
        ok = lambda path: ({"personal"}, "personal")
        registry.init_project(self.producer / "registry/dist/acme-base.json", "upd", self.tmp, scopes=ok)
        proj = self.tmp / "upd"
        css_path, md_path = proj / "src/index.css", proj / "DESIGN.md"
        css_path.write_text(css_path.read_text(encoding="utf-8").replace(COLORS["--primary"], "#010203", 1), encoding="utf-8")
        md_path.write_text(md_path.read_text(encoding="utf-8") + "\nLocal note kept across updates.\n", encoding="utf-8")
        self.git_baseline(proj)
        # the producer changes --radius and --primary, and publishes 0.2.0 again
        new_css = sheet().replace("--radius: 0.5rem", "--radius: 1rem").replace(COLORS["--primary"], "#a0b0c0", 1)
        (self.producer / "src/index.css").write_text(new_css, encoding="utf-8")
        registry.publish(str(self.producer), name="acme", scope="personal", version="0.2.0", gates=False)
        out = io.StringIO()
        with contextlib.redirect_stdout(out), self.assertRaises(SystemExit) as cm:
            registry.update(proj, yes=False, scopes=ok)
        self.assertEqual(cm.exception.code, 3)
        self.assertIn("local edit, will be overwritten: --primary", out.getvalue())
        self.assertIn("--radius", out.getvalue())
        self.assertIn("0.5rem", css_path.read_text(encoding="utf-8"))  # nothing applied without --yes
        with contextlib.redirect_stdout(io.StringIO()):
            registry.update(proj, yes=True, scopes=ok)  # exit status follows the fixture's contrast check, not asserted
        blocks = tk.parse_css(css_path.read_text(encoding="utf-8"))
        self.assertEqual(blocks[":root"]["--radius"], "1rem")
        self.assertEqual(blocks[":root"]["--primary"], "#a0b0c0")
        self.assertIn("Local note kept across updates.", md_path.read_text(encoding="utf-8"))
        self.assertEqual(json.loads((proj / registry.LOCK).read_text(encoding="utf-8"))["version"], "0.2.0")

    def git_baseline(self, path=None):
        env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
        for args in (["init", "-q"], ["add", "-A"], ["-c", "user.name=t", "-c", "user.email=t@example.com", "commit", "-qm", "base"]):
            subprocess.run(["git", *args], cwd=path or self.consumer, env=env, capture_output=True)


if __name__ == "__main__":
    unittest.main()
