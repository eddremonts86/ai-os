"""install-windows.ps1 installs only the core by default: apps (editors, browsers, chat) are opt-in extras."""

import os
import shutil
import subprocess
import sys
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "install-windows.ps1"
PS = shutil.which("pwsh") or shutil.which("powershell.exe")
APPS = {"vscode", "windsurf", "googlechrome", "firefox", "slack", "discord", "7zip", "notepadplusplus", "keepassxc",
        "postman", "tableplus", "warp", "fzf", "ripgrep", "fd", "mkcert"}


def packages(env=None, excluded="@()"):
    text = SCRIPT.read_text(encoding="utf-8-sig")
    block = text[text.index("# ─── Chocolatey package list"):text.index("function Show-Manifest")]
    clean = {k: v for k, v in os.environ.items() if k not in ("EXTRAS", "AIOS_FULL", "SKIP_MEMORY")}
    out = subprocess.run([PS, "-NoProfile", "-Command", f"$ExcludedPackages = {excluded}\n{block}\n$ChocoPackages -join ','"],
                         capture_output=True, text=True, encoding="utf-8", timeout=60, env={**clean, **(env or {})})
    assert out.returncode == 0, out.stderr
    return set(out.stdout.strip().split(","))


@unittest.skipUnless(sys.platform == "win32" and PS, "needs PowerShell on Windows")
class ChocoSelectionTests(unittest.TestCase):
    def test_default_is_core_plus_the_memory_stack_and_no_apps(self):
        got = packages()
        self.assertEqual(got, {"git", "gh", "nodejs", "python311", "uv", "pwsh", "jq", "yq", "docker-desktop", "ollama", "golang"})
        self.assertFalse(got & APPS)

    def test_skipping_the_memory_stack_drops_its_tools(self):
        self.assertEqual(packages({"SKIP_MEMORY": "1"}), {"git", "gh", "nodejs", "python311", "uv", "pwsh", "jq", "yq"})

    def test_extras_and_full_add_the_apps(self):
        for env in ({"EXTRAS": "1"}, {"AIOS_FULL": "1"}):
            self.assertTrue(APPS <= packages(env), env)

    def test_exclude_still_drops_a_package(self):
        self.assertNotIn("golang", packages(excluded="@('golang')"))
        self.assertNotIn("slack", packages({"EXTRAS": "1"}, "@('slack')"))


class InstallerTextTests(unittest.TestCase):
    def test_without_admin_rights_choco_is_skipped_once_not_failed_per_package(self):
        text = SCRIPT.read_text(encoding="utf-8-sig")
        self.assertIn("not running as Administrator: skipping", text)
        self.assertIn("(already installed)", text)


if __name__ == "__main__":
    unittest.main()
