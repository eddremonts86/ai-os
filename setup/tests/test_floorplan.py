"""Floorplan is an opt-in plugin pinned to one reviewed commit. The pin lives in four files and step 9g of
install-mac.sh must install exactly that commit, never the default branch, and never abort the install.
9g is cut out of the script and run against a local git repo with stub `claude` and `codex`."""

import os
import re
import shutil
import stat
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SETUP = ROOT / "setup"
MAC = (SETUP / "install-mac.sh").read_text(encoding="utf-8")


def pins(text):
    """The 40-character SHAs on lines that mention the pin (FLOORPLAN_SHA, $FloorplanSha)."""
    return {h for line in text.splitlines() if re.search(r"(?i)floorplan_?sha", line) for h in re.findall(r"\b[0-9a-f]{40}\b", line)}


def git(cwd, *args):
    return subprocess.run(["git", *args], cwd=cwd, capture_output=True, text=True, check=True,
                          env={**os.environ, "GIT_AUTHOR_NAME": "t", "GIT_AUTHOR_EMAIL": "t@t", "GIT_COMMITTER_NAME": "t",
                               "GIT_COMMITTER_EMAIL": "t@t"}).stdout.strip()


class PinIsTheSameEverywhere(unittest.TestCase):
    def test_four_files_name_one_forty_character_sha(self):
        found = {}
        for name in ("install-mac.sh", "install-windows.ps1", "verify-windows.ps1"):
            shas = pins((SETUP / name).read_text(encoding="utf-8-sig"))
            self.assertEqual(len(shas), 1, f"{name}: expected one pinned SHA, found {shas}")
            found[name] = next(iter(shas))
        self.assertEqual(len(set(found.values())), 1, found)
        # verify.sh does not carry the SHA: it reads it from install-mac.sh with this sed
        sed = re.search(r"FLOORPLAN_PIN=\"\$\(sed -n '([^']+)' ", (SETUP / "verify.sh").read_text(encoding="utf-8"))
        self.assertIsNotNone(sed)
        if os.name != "nt":  # verify.sh runs on macOS/Linux; Windows runners ship a different sed
            out = subprocess.run(["sed", "-n", sed.group(1), str(SETUP / "install-mac.sh")], capture_output=True, text=True).stdout.strip()
            self.assertEqual(out, found["install-mac.sh"])

    def test_windows_wires_the_same_flag_and_is_opt_in_under_full(self):
        win = (SETUP / "install-windows.ps1").read_text(encoding="utf-8-sig")
        self.assertIn('@("FLOORPLAN", "floorplan")', win)
        self.assertIn("7f. Floorplan", win)
        self.assertIn("Floorplan stay opt-in under --full", win)

    @unittest.skipUnless(shutil.which("pwsh"), "needs PowerShell 7 to parse")
    def test_the_powershell_scripts_parse(self):
        for name in ("install-windows.ps1", "verify-windows.ps1"):
            p = subprocess.run(["pwsh", "-NoProfile", "-Command", f"[void][scriptblock]::Create((Get-Content -Raw '{SETUP / name}'))"],
                               capture_output=True, text=True, timeout=60)
            self.assertEqual(p.returncode, 0, f"{name}: {p.stderr}")


@unittest.skipIf(os.name == "nt", "shell script")
class Step9g(unittest.TestCase):
    def setUp(self):
        self.t = Path(tempfile.mkdtemp())
        self.addCleanup(shutil.rmtree, self.t, True)
        self.repo = self.t / "upstream"
        self.repo.mkdir()
        git(self.repo, "init", "-q", "-b", "main")
        (self.repo / "CHECKSUMS.txt").write_text("v1\n")
        git(self.repo, "add", "."), git(self.repo, "commit", "-qm", "reviewed")
        self.pin = git(self.repo, "rev-parse", "HEAD")
        (self.repo / "CHECKSUMS.txt").write_text("v2\n")
        git(self.repo, "commit", "-qam", "later, unreviewed")
        self.head = git(self.repo, "rev-parse", "HEAD")
        self.bin = self.t / "bin"
        self.bin.mkdir()
        self.home = self.t / "home"
        self.home.mkdir()

    def stub(self, name, market_list=""):
        body = (f'#!/bin/sh\necho "$0 $*" >> "{self.t}/calls.log"\n'
                f'case "$*" in\n'
                f'  "plugin marketplace list") printf %s "{market_list}" ;;\n'
                f'  "plugin list") [ -f "{self.t}/{name}.installed" ] && echo "floorplan@floorplan installed" ;;\n'
                f'  "plugin install floorplan@floorplan"|"plugin add floorplan@floorplan") touch "{self.t}/{name}.installed" ;;\n'
                f'esac\nexit 0\n')
        p = self.bin / name
        p.write_text(body)
        p.chmod(p.stat().st_mode | stat.S_IEXEC)

    def run9g(self, sha, claude_market=""):
        self.stub("claude", claude_market)
        self.stub("codex")
        block = subprocess.run(["sed", "-n", "/^# ─── 9g. Floorplan/,/^# ─── 10\\. Warp/p", str(SETUP / "install-mac.sh")],
                               capture_output=True, text=True).stdout.rsplit("\n", 2)[0]
        pin_line = next(l for l in MAC.splitlines() if l.startswith("FLOORPLAN_SHA="))
        script = ("set -euo pipefail\nlog(){ echo \"LOG $*\"; }; ok(){ echo \"OK $*\"; }; warn(){ echo \"WARN $*\"; }\n"
                  f"HOME_DIR='{self.home}'\nCLAUDE_BIN='{self.bin}/claude'\nFLOORPLAN=1\n{pin_line}\n{block}\necho DONE\n")
        env = {**os.environ, "PATH": f"{self.bin}:{os.environ['PATH']}", "FLOORPLAN_REPO": str(self.repo), "FLOORPLAN_SHA": sha}
        return subprocess.run(["bash", "-c", script], capture_output=True, text=True, timeout=60, env=env)

    def calls(self):
        f = self.t / "calls.log"
        return f.read_text() if f.exists() else ""

    def test_installs_the_pinned_commit_not_the_default_branch(self):
        p = self.run9g(self.pin)
        self.assertIn("DONE", p.stdout, p.stderr)
        clone = self.home / ".cache/ai-os/floorplan"
        self.assertEqual(git(clone, "rev-parse", "HEAD"), self.pin)
        self.assertNotEqual(self.pin, self.head)
        self.assertIn(f"plugin marketplace add {clone}", self.calls())
        self.assertIn("plugin install floorplan@floorplan", self.calls())
        self.assertEqual((self.home / ".floorplan/settings.json").read_text().strip(), '{"cloud":{"status":"never"}}')

    def test_a_second_run_changes_nothing(self):
        self.run9g(self.pin)
        before = self.calls().count("plugin install")
        p = self.run9g(self.pin)
        self.assertIn("DONE", p.stdout, p.stderr)
        self.assertEqual(self.calls().count("plugin install"), before)

    def test_a_missing_commit_warns_and_never_installs_or_aborts(self):
        p = self.run9g("0" * 40)
        self.assertIn("DONE", p.stdout, p.stderr)
        self.assertIn("could not check out", p.stdout)
        self.assertNotIn("plugin install", self.calls())

    def test_a_floorplan_marketplace_from_another_source_blocks_the_install(self):
        p = self.run9g(self.pin, claude_market="Configured marketplaces:\n\n  ❯ floorplan\n    Source: GitHub (x/floorplan)\n")
        self.assertIn("DONE", p.stdout, p.stderr)
        self.assertIn("pin is not enforced", p.stdout)
        self.assertNotIn("claude plugin install", self.calls().replace(str(self.bin) + "/", ""))


if __name__ == "__main__":
    unittest.main()
