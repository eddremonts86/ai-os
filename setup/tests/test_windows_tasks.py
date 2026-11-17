"""memory/windows/ai-os-tasks.ps1: the Windows stand-in for memory/launchd/, and the installer step that runs it."""

import shutil
import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / "memory" / "windows" / "ai-os-tasks.ps1"
PS = shutil.which("powershell.exe")


def ps(*args):
    return subprocess.run([PS, "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", str(SCRIPT), *args],
                          capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=120)


class WindowsTasksTests(unittest.TestCase):
    def test_installer_registers_the_tasks_in_the_memory_step(self):
        text = (ROOT / "setup" / "install-windows.ps1").read_text(encoding="utf-8-sig")
        self.assertTrue(SCRIPT.exists())
        self.assertIn(r"memory\windows\ai-os-tasks.ps1", text)
        # inside the SKIP_MEMORY branch: the tasks run the memory stack's indexers and backups
        self.assertLess(text.index("7b.4"), text.index(r"memory\windows\ai-os-tasks.ps1"))
        self.assertLess(text.index(r"memory\windows\ai-os-tasks.ps1"), text.index("SKIP_MEMORY=1, skipping memory stack"))

    @unittest.skipUnless(sys.platform == "win32" and PS, "needs Windows PowerShell")
    def test_dry_run_names_the_jobs_and_registers_nothing(self):
        p = ps("install", "-DryRun")
        self.assertEqual(p.returncode, 0, p.stderr)
        self.assertIn("AI-OS backup: would register (daily at 13:00)", p.stdout)
        self.assertIn("AI-OS reindex: would register (daily at 00:00, 04:00", p.stdout)
        self.assertRegex(p.stdout, r"AI-OS reindex: .*and at logon\)")  # a PC that sleeps overnight misses the night runs

    @unittest.skipUnless(sys.platform == "win32" and PS, "needs Windows PowerShell")
    def test_unknown_job_is_refused(self):
        for args in (("install", "-Only", "nope"), ("run", "nope")):
            p = ps(*args)
            self.assertNotEqual(p.returncode, 0, args)
            self.assertTrue("unknown job" in p.stderr or "usage:" in p.stderr, p.stderr)


if __name__ == "__main__":
    unittest.main()
