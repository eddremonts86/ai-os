"""setup/ai-os-backup.py: listing and verification degrade cleanly without snapshots."""

import importlib.util
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-backup.py"


class BackupTests(unittest.TestCase):
    def run_script(self, *args, dest):
        env = {**os.environ, "AI_OS_BACKUP_DIR": dest}
        return subprocess.run([sys.executable, str(SCRIPT), *args], capture_output=True, text=True, timeout=60, env=env)

    def test_list_on_empty_destination(self):
        with tempfile.TemporaryDirectory() as d:
            p = self.run_script("--list", dest=os.path.join(d, "none"))
            self.assertEqual((p.returncode, p.stdout), (0, ""))

    def test_verify_without_backups_fails_cleanly(self):
        with tempfile.TemporaryDirectory() as d:
            p = self.run_script("--verify", dest=d)
            self.assertEqual(p.returncode, 1)
            self.assertIn("no backup to verify", p.stdout)
            self.assertNotIn("Traceback", p.stderr)


if __name__ == "__main__":
    unittest.main()
