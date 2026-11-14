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
class PersonalContextBackupTests(unittest.TestCase):
    def test_snapshot_carries_the_git_ignored_personal_context(self):
        import tarfile
        spec = importlib.util.spec_from_file_location("ai_os_backup_ctx", SCRIPT)
        b = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(b)
        # take() pushes off-site unless this is set: without it a test would write to the real iCloud/GitHub copies.
        os.environ["AI_OS_OFFSITE"] = "0"
        self.addCleanup(os.environ.pop, "AI_OS_OFFSITE", None)
        with tempfile.TemporaryDirectory() as d:
            root, dest = Path(d) / "root", Path(d) / "dest"
            (root / "context" / "personal" / "me").mkdir(parents=True)
            (root / "context" / "personal" / "me" / "profile.md").write_text("# me\n", encoding="utf-8")
            b.ROOT, b.DEST = root, dest
            b.snapshot_graph = lambda out: (out / "falkordb-dump.rdb").write_bytes(b"x") or {}
            b.HOME = Path(d) / "home"
            b.take()
            snap = sorted(p for p in dest.iterdir() if p.is_dir())[-1]
            with tarfile.open(snap / "personal-context.tar.gz") as tar:
                self.assertIn("personal/me/profile.md", tar.getnames())


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
        self.assertIn("private repo", str(ctx.exception))

    def test_no_repo_unless_configured(self):
        # Nobody's backups go to a repo they did not name — not even <their login>/ai-os-backups.
        from unittest import mock
        with tempfile.TemporaryDirectory() as d, mock.patch.object(self.b, "CONFIG", Path(d) / "backup.json"), \
             mock.patch.dict(os.environ, {}, clear=False):
            os.environ.pop("AI_OS_GITHUB_BACKUP_REPO", None)
            self.assertIsNone(self.b.github_repo())
            self.b.save_config(github_repo="me/my-backups")
            self.assertEqual(self.b.github_repo(), "me/my-backups")
            self.b.save_config(github_repo="")
            self.assertIsNone(self.b.github_repo())

    def test_each_machine_keeps_its_own_branch(self):
        # Machines sharing a repo must never overwrite each other: the branch is named once and saved.
        from unittest import mock
        with tempfile.TemporaryDirectory() as d, mock.patch.object(self.b, "CONFIG", Path(d) / "backup.json"), \
             mock.patch.dict(os.environ, {}, clear=False):
            os.environ.pop("AI_OS_BACKUP_BRANCH", None)
            with mock.patch.object(self.b, "machine_name", return_value="mac-one"):
                self.assertEqual(self.b.machine_branch(), "mac-one")
            with mock.patch.object(self.b, "machine_name", return_value="renamed"):
                self.assertEqual(self.b.machine_branch(), "mac-one")  # a hostname change does not move it
            self.assertEqual(self.b.offsite_dir().name, "mac-one")
            os.environ["AI_OS_BACKUP_BRANCH"] = "pc-two"
            self.assertEqual(self.b.machine_branch(), "pc-two")  # restore another machine's copy

    def test_machine_name_is_a_safe_branch_name(self):
        from unittest import mock
        with mock.patch.object(self.b.sys, "platform", "darwin"), \
             mock.patch.object(self.b, "sh", return_value=(0, "Edd's MacBook Pro")):
            self.assertEqual(self.b.machine_name(), "edd-s-macbook-pro")

    def test_push_only_rewrites_this_machines_branch(self):
        from unittest import mock
        calls = []
        with tempfile.TemporaryDirectory() as d, mock.patch.object(self.b, "GH_WORK", Path(d)), \
             mock.patch.object(self.b, "github_repo", return_value="me/ai-os-backups"), \
             mock.patch.object(self.b, "check_repo", return_value=None), \
             mock.patch.object(self.b, "machine_branch", return_value="mac-one"), \
             mock.patch.object(self.b, "git", side_effect=lambda *a, **k: calls.append(a) or "x"):
            url = self.b.push_github("ai-os-x.tar.gz.enc", b"ciphertext")
        pushes = [c for c in calls if c[0] == "push"]
        self.assertEqual(pushes, [("push", "--force", "origin", "main:refs/heads/mac-one")])
        self.assertTrue(url.endswith("/tree/mac-one"))

    def test_refuses_a_repo_with_other_content(self):
        # The mirror force-pushes one parentless commit; pointing it at a project would erase it.
        from unittest import mock
        replies = {"repo": (0, "true"), "api": (0, "README.md\nsrc\npackage.json")}
        with mock.patch.object(self.b, "sh", side_effect=lambda *a, **k: replies[a[1]]):
            self.assertIn("would erase", self.b.check_repo("me/project"))
        replies["api"] = (0, "README.md\nai-os-2026-01-01-000000.tar.gz.enc")
        with mock.patch.object(self.b, "sh", side_effect=lambda *a, **k: replies[a[1]]):
            self.assertIsNone(self.b.check_repo("me/ai-os-backups"))
        replies["api"] = (1, "")  # an empty repo has no contents endpoint
        with mock.patch.object(self.b, "sh", side_effect=lambda *a, **k: replies[a[1]]):
            self.assertIsNone(self.b.check_repo("me/fresh"))

    def test_repo_name_is_validated_before_any_call(self):
        self.assertIn("OWNER/NAME", self.b.check_repo("not a repo; rm -rf"))


    def test_refuses_a_missing_repo(self):
        from unittest import mock
        with mock.patch.object(self.b, "github_repo", return_value="o/r"), \
             mock.patch.object(self.b, "sh", return_value=(1, "")):
            with self.assertRaises(RuntimeError):
                self.b.push_github("ai-os-x.tar.gz.enc", b"ciphertext")



class ScheduleConfigTests(unittest.TestCase):
    def test_disable_and_icloud_off_are_saved_and_reported(self):
        with tempfile.TemporaryDirectory() as d:
            cfg = os.path.join(d, "backup.json")
            env = {**os.environ, "AI_OS_BACKUP_CONFIG": cfg, "AI_OS_BACKUP_DIR": os.path.join(d, "snaps")}
            env.pop("AI_OS_GITHUB_BACKUP_REPO", None)
            env.pop("AI_OS_OFFSITE_DIR", None)
            run = lambda *a: subprocess.run([sys.executable, str(SCRIPT), *a], capture_output=True, text=True, timeout=60, env=env)
            self.assertEqual(run("--icloud", "off").returncode, 0)
            out = run("--status").stdout
            self.assertIn("iCloud:    off", out)
            self.assertIn("GitHub:    off", out)
            self.assertIn('"icloud": false', Path(cfg).read_text())
            # With nothing off-site, the daily --verify-offsite must not report a failure.
            self.assertEqual(run("--verify-offsite").returncode, 0)

    @unittest.skipIf(sys.platform == "win32", "the launchd installer is a macOS bash script")
    def test_installer_skips_when_disabled(self):
        with tempfile.TemporaryDirectory() as d:
            cfg = Path(d) / "backup.json"
            cfg.write_text('{"schedule": false}')
            installer = SCRIPT.parents[1] / "memory" / "launchd" / "install-backup.sh"
            p = subprocess.run(["bash", str(installer)], capture_output=True, text=True, timeout=60,
                               env={**os.environ, "AI_OS_BACKUP_CONFIG": str(cfg)})
            self.assertEqual(p.returncode, 0)
            self.assertIn("not installing", p.stdout)

if __name__ == "__main__":
    unittest.main()
