"""install-mac.sh honours what the selector writes to install.yaml: exclude: drops packages from the shared lists,
skip: turns default-on parts off, extras:/ui_indexer: turn opt-ins on, and --full / AIOS_FULL=1 ignores all of it.
The functions are taken from the script itself, so these tests break if the script stops doing it."""

import os
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / "setup/install-mac.sh"
ONE_LINERS = ("warn", "profile_flag")  # `name() { ...; }` on one line
FUNCS = ("profile_get", "load_profile_flags", "without_excluded")


@unittest.skipIf(os.name == "nt" or not shutil.which("yq"), "macOS/Linux shell script; needs yq")
class InstallSelectionTests(unittest.TestCase):
    def setUp(self):
        self.dir = Path(tempfile.mkdtemp())
        self.profile = self.dir / "install.yaml"

    def sh(self, body, profile="", env=None):
        self.profile.write_text(profile, encoding="utf-8")
        extract = "; ".join([f"eval \"$(sed -n '/^{f}() {{/p' {SCRIPT})\"" for f in ONE_LINERS]
                            + [f"eval \"$(sed -n '/^{f}() {{/,/^}}/p' {SCRIPT})\"" for f in FUNCS])
        script = (f"LOG_PREFIX=t; {extract}; "
                  f"INSTALL_PROFILE='{self.profile}'; {body}")
        clean = {k: v for k, v in os.environ.items()
                 if not k.startswith(("SKIP_", "AIOS_")) and k not in ("EXTRAS", "UI_INDEXER")}
        return subprocess.run(["bash", "-c", script], capture_output=True, text=True, timeout=30,
                              env={**clean, **(env or {})}, check=True).stdout

    def write(self, name, text):
        p = self.dir / name
        p.write_text(text, encoding="utf-8")
        return p

    def test_exclude_drops_brew_and_cask_lines_by_name_and_keeps_taps_and_comments(self):
        brewfile = self.write("Brewfile", 'tap "a/b"\n# ─── Core ───\nbrew "git"\nbrew "trivy"  # scanner\ncask "docker-desktop"\nbrew "jq"\n')
        out = self.sh(f"without_excluded {brewfile}", "exclude: [trivy, docker-desktop]\n")
        self.assertEqual(out, 'tap "a/b"\n# ─── Core ───\nbrew "git"\nbrew "jq"\n')

    def test_exclude_on_a_plain_list_matches_the_entry_without_its_comment(self):
        pip = self.write("pip.txt", "mcp[cli]   # SDK\nruff\nmypy # types\n")
        self.assertEqual(self.sh(f"without_excluded {pip}", 'exclude: ["mcp[cli]", mypy]\n'), "ruff\n")

    def test_no_profile_or_no_exclude_keeps_everything(self):
        brewfile = self.write("Brewfile", 'brew "git"\nbrew "jq"\n')
        self.assertEqual(self.sh(f"without_excluded {brewfile}", "fonts: true\n"), 'brew "git"\nbrew "jq"\n')

    def test_full_ignores_exclude(self):
        brewfile = self.write("Brewfile", 'brew "git"\nbrew "jq"\n')
        out = self.sh(f"without_excluded {brewfile}", "exclude: [jq]\n", {"AIOS_FULL": "1"})
        self.assertEqual(out, 'brew "git"\nbrew "jq"\n')

    show = ('load_profile_flags; echo "C=${SKIP_CLAUDE_NATIVE:-} O=${SKIP_OPENCODE:-} M=${SKIP_MEMORY:-} '
            'P=${SKIP_MCP:-} Y=${SKIP_PONYTAIL:-} H=${SKIP_MEMORY_HOOK:-}${SKIP_COMPACT_HOOK:-} '
            'X=$EXTRAS U=$UI_INDEXER S=$AIOS_SHELL_THEME F=$AIOS_FONTS T=$AIOS_TERMINAL_THEME"')

    def test_skip_maps_every_part_to_its_switch(self):
        out = self.sh(self.show, "skip: [claude, opencode, memory, mcp, ponytail, hooks]\nextras: true\nui_indexer: true\n")
        self.assertEqual(out.strip(), "C=1 O=1 M=1 P=1 Y=1 H=11 X=1 U=1 S=0 F=0 T=0")

    def test_without_skip_everything_default_on_stays_on(self):
        self.assertEqual(self.sh(self.show, "fonts: true\n").strip(), "C= O= M= P= Y= H= X=0 U=0 S=0 F=1 T=0")

    def test_an_env_var_wins_over_skip(self):
        out = self.sh(self.show, "skip: [memory]\n", {"SKIP_MEMORY": "0"})
        self.assertIn("M=0", out)

    def test_full_turns_extras_and_ui_indexer_on_ignores_skip_and_leaves_the_look_opt_in(self):
        out = self.sh(self.show, "skip: [memory, mcp]\n", {"AIOS_FULL": "1"})
        self.assertEqual(out.strip(), "C= O= M= P= Y= H= X=1 U=1 S=0 F=0 T=0")
        out = self.sh(self.show, "shell_theme: true\n", {"AIOS_FULL": "1"})
        self.assertIn("S=1", out)

    def test_a_second_read_once_yq_is_there_applies_the_opt_ins(self):
        # first read on a new Mac: no yq on PATH, every flag reads as 0; then yq arrives and the script reads again
        body = "PATH=/nonexistent load_profile_flags; " + self.show
        out = self.sh(body, "extras: true\nui_indexer: true\nshell_theme: true\nskip: [memory]\n")
        self.assertEqual(out.strip(), "C= O= M=1 P= Y= H= X=1 U=1 S=1 F=0 T=0")

    def test_an_unknown_skip_entry_is_reported(self):
        out = self.sh(self.show + " 2>&1", "skip: [memroy]\n")
        self.assertIn("unknown entry 'memroy'", out)

    def test_full_and_yes_flags_parse_and_an_unknown_flag_fails(self):
        p = subprocess.run(["bash", str(SCRIPT), "--nope"], capture_output=True, text=True, timeout=30)
        self.assertEqual(p.returncode, 2)
        self.assertIn("unknown option --nope", p.stderr)
        p = subprocess.run(["bash", str(SCRIPT), "--help"], capture_output=True, text=True, timeout=30)
        self.assertEqual(p.returncode, 0)
        self.assertIn("--full", p.stdout)


class WindowsInstallerSelectionTests(unittest.TestCase):
    """install-windows.ps1 reads the same keys (no pwsh on every machine: check the source)."""

    def test_reads_skip_exclude_and_full(self):
        text = (ROOT / "setup/install-windows.ps1").read_text(encoding="utf-8-sig")
        for needle in ("'^(--full|-Full)$'", ".skip // [] | .[]", ".exclude // [] | .[]",
                       "Where-Object { $ExcludedPackages -notcontains $_ }", 'memory = @("SKIP_MEMORY")'):
            self.assertIn(needle, text)


if __name__ == "__main__":
    unittest.main()
