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


try:
    import cryptography  # noqa: F401
    HAVE_CRYPTO = True
except ImportError:
    HAVE_CRYPTO = False


@unittest.skipUnless(HAVE_CRYPTO, "cryptography is only in the AI-OS venv")
class OffsiteCryptoTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        spec = importlib.util.spec_from_file_location("ai_os_backup", SCRIPT)
        cls.b = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.b)

    def test_roundtrip_and_header(self):
        key = os.urandom(32)
        blob = self.b.encrypt(b"secret graph bytes", key)
        self.assertTrue(blob.startswith(self.b.MAGIC))
        self.assertNotIn(b"secret graph bytes", blob)
        self.assertEqual(self.b.decrypt(blob, key), b"secret graph bytes")

    def test_wrong_key_and_tampering_are_rejected(self):
        from cryptography.exceptions import InvalidTag
        key = os.urandom(32)
        blob = self.b.encrypt(b"data", key)
        with self.assertRaises(InvalidTag):
            self.b.decrypt(blob, os.urandom(32))
        flipped = blob[:-1] + bytes([blob[-1] ^ 1])
        with self.assertRaises(InvalidTag):
            self.b.decrypt(flipped, key)

    def test_nonce_is_fresh_each_time(self):
        key = os.urandom(32)
        self.assertNotEqual(self.b.encrypt(b"x", key), self.b.encrypt(b"x", key))

    def test_non_backup_file_is_refused(self):
        with self.assertRaises(RuntimeError):
            self.b.decrypt(b"not a backup", os.urandom(32))

    def test_env_key_overrides_keychain(self):
        import base64
        key = os.urandom(32)
        os.environ["AI_OS_BACKUP_KEY"] = base64.b64encode(key).decode()
        try:
            self.assertEqual(self.b.get_key(), key)
        finally:
            del os.environ["AI_OS_BACKUP_KEY"]

    def test_pack_roundtrip_through_offsite_reader(self):
        key = os.urandom(32)
        with tempfile.TemporaryDirectory() as d:
            snap = Path(d) / "2099-01-01-000000"
            snap.mkdir()
            (snap / "manifest.json").write_text('{"graphs": {"ai-os": 1}}')
            blob = self.b.encrypt(self.b.pack(snap), key)
            with self.b.open_offsite(blob, key) as tar:
                self.assertIn("2099-01-01-000000/manifest.json", tar.getnames())


class GithubMirrorTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        spec = importlib.util.spec_from_file_location("ai_os_backup_gh", SCRIPT)
        cls.b = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.b)

    def test_disabled_by_env(self):
        os.environ["AI_OS_GITHUB"] = "0"
        try:
            self.assertIsNone(self.b.github_repo())
            self.assertEqual(self.b.github_files(), [])
        finally:
            del os.environ["AI_OS_GITHUB"]

    def test_repo_override_from_env(self):
        os.environ["AI_OS_GITHUB_BACKUP_REPO"] = "someone/else"
        try:
            self.assertEqual(self.b.github_repo(), "someone/else")
        finally:
            del os.environ["AI_OS_GITHUB_BACKUP_REPO"]

    def test_refuses_a_repo_that_is_not_private(self):
        from unittest import mock
        with mock.patch.object(self.b, "github_repo", return_value="o/r"), \
             mock.patch.object(self.b, "sh", return_value=(0, "false")):
            with self.assertRaises(RuntimeError) as ctx:
                self.b.push_github("ai-os-x.tar.gz.enc", b"ciphertext")
        self.assertIn("not a private repo", str(ctx.exception))

    def test_refuses_a_missing_repo(self):
        from unittest import mock
        with mock.patch.object(self.b, "github_repo", return_value="o/r"), \
             mock.patch.object(self.b, "sh", return_value=(1, "")):
            with self.assertRaises(RuntimeError):
                self.b.push_github("ai-os-x.tar.gz.enc", b"ciphertext")


if __name__ == "__main__":
    unittest.main()
