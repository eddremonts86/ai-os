"""setup/ai-os-secrets.py: classification is sane and a value is never printed."""

import importlib.util
import io
import os
import re
import subprocess
import sys
import tempfile
import unittest
from contextlib import redirect_stdout
from pathlib import Path
from unittest import mock

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-secrets.py"
spec = importlib.util.spec_from_file_location("ai_os_secrets", SCRIPT)
sec = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sec)

REAL = "k9Xv2QpLw8ZtRm4YbN7sHd3JfC6gUa1E"  # looks like a random credential


class SecretsTests(unittest.TestCase):
    def test_classify(self):
        self.assertEqual(sec.classify("API_KEY", REAL)[0], "leak")
        self.assertEqual(sec.classify("BETTER_AUTH_SECRET", "dev-secret-change-me-in-production-1234")[0], "info")
        self.assertEqual(sec.classify("DATABASE_URL", "postgres://u:p@localhost:5432/db_name_long")[0], "info")
        self.assertEqual(sec.classify("DEEPSEEK_MODEL", "deepseek-v4-pro-experimental-xyz")[0], "info")
        self.assertEqual(sec.classify("CONDUCTOR_SSH_KEY", "~/.ssh/id_ed25519_conductor")[0], "info")
        self.assertEqual(sec.classify("VITE_SENTRY_DSN", REAL)[0], "info")  # DSNs ship in client bundles
        self.assertEqual(sec.classify("COOLIFY_GITHUB_DEPLOY_KEY_UUID", "abcd1234efgh5678ijkl9012")[0], "info")  # "KEY" in the name, but a UUID

    def test_credential_values_skips_short_prose_and_public_urls(self):
        env = {"A": "short", "B": "two words here are prose-like", "C": "https://example.com/path", "D": REAL, "E": REAL}
        self.assertEqual(sec.credential_values(env), {REAL: ["D", "E"]})

    def test_audit_output_never_contains_the_value(self):
        env = {"MY_API_KEY": REAL}
        fake = [{"repo": "x/y", "visibility": "PUBLIC", "leaks": ["MY_API_KEY"], "details": {"MY_API_KEY": "reason"},
                 "other_matches": [], "tracked_files": []}]
        buf = io.StringIO()
        with mock.patch.object(sec, "read_env", return_value=env), mock.patch.object(sec, "audit", return_value=fake), \
             mock.patch.object(sec, "quick_checks", return_value=[("ok", "x")]), \
             mock.patch("sys.argv", ["ai-os-secrets", "audit"]), redirect_stdout(buf):
            rc = sec.main()
        self.assertEqual(rc, 1)
        self.assertNotIn(REAL, buf.getvalue())
        self.assertIn("MY_API_KEY", buf.getvalue())

    def test_entropy_orders_random_above_repetitive(self):
        self.assertGreater(sec.entropy(REAL), sec.entropy("aaaaaaaaaaaaaaaaaaaaaaaa"))


@unittest.skipIf(sys.platform == "win32", "check-push shells out to grep")
class CheckPushTests(unittest.TestCase):
    def test_flags_a_pushed_value_by_name_and_passes_a_clean_range(self):
        fake = "Zq8Lw3Vn7Xk2Rt9Yb4Mc6Hd1Jf5Ga0Es"
        git = ["git", "-c", "user.email=t@t", "-c", "user.name=t"]
        with tempfile.TemporaryDirectory() as d:
            repo = Path(d)
            env = repo / "env"
            env.write_text(f"FAKE_API_KEY={fake}\n", encoding="utf-8")
            run = lambda *a: subprocess.run([*git, *a], cwd=repo, check=True, capture_output=True)
            run("init", "-q")
            run("commit", "-q", "--allow-empty", "-m", "base")
            (repo / "leak.txt").write_text(f"token = {fake}\n", encoding="utf-8")
            run("add", "leak.txt")
            run("commit", "-q", "-m", "leak")
            run("commit", "-q", "--allow-empty", "-m", "clean")
            old = Path.cwd()
            os.chdir(repo)
            buf = io.StringIO()
            try:
                with mock.patch.object(sec, "ENV", env), redirect_stdout(buf):
                    leaked = sec.check_push(["HEAD~2..HEAD~1"])
                    clean = sec.check_push(["HEAD~1..HEAD"])
            finally:
                os.chdir(old)
            self.assertEqual((leaked, clean), (1, 0))
            self.assertIn("FAKE_API_KEY", buf.getvalue())
            self.assertNotIn(fake, buf.getvalue())


if __name__ == "__main__":
    unittest.main()
