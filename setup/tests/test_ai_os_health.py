"""Tests for setup/ai-os-health.py that need no running services.

unittest, not pytest: CI runs `python3 -m unittest discover -s setup/tests`,
which silently skips bare pytest-style functions.
"""

import importlib.util
import json
import subprocess
import sys
import unittest
from pathlib import Path
from unittest import mock

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-health.py"
spec = importlib.util.spec_from_file_location("ai_os_health", SCRIPT)
health = importlib.util.module_from_spec(spec)
spec.loader.exec_module(health)


class HealthTests(unittest.TestCase):
    def test_sse_json_reads_plain_and_event_stream_bodies(self):
        self.assertEqual(health.sse_json('{"id": 1}'), {"id": 1})
        self.assertEqual(health.sse_json('event: message\ndata: {"id": 2}\n\n'), {"id": 2})

    def test_check_ids_are_unique(self):
        ids = [c[0] for c in health.CHECKS]
        self.assertEqual(len(ids), len(set(ids)))

    def test_tokens_check_never_prints_secret(self):
        secret = "sk-test-do-not-print-0123456789"
        env = {"COOLIFY_API_URL": "http://127.0.0.1:9", "COOLIFY_API_TOKEN": secret}
        with mock.patch.object(health, "load_env", return_value=env), \
             mock.patch.object(health, "run", return_value=(0, "")):
            status, detail = health.check_tokens()
        self.assertEqual(status, health.FAIL)
        self.assertNotIn(secret, detail)

    def test_crashing_check_is_reported_as_fail(self):
        with mock.patch.object(health, "CHECKS", [("boom", "Boom", lambda: 1 / 0)]), \
             mock.patch.object(sys, "argv", ["ai-os-health", "--json"]), \
             mock.patch("sys.stdout"):
            self.assertEqual(health.main(), 1)

    def test_json_output_for_local_only_check(self):
        out = subprocess.run([sys.executable, str(SCRIPT), "--json", "--only", "disk"],
                             capture_output=True, text=True, timeout=60)
        data = json.loads(out.stdout)
        self.assertEqual([c["id"] for c in data["checks"]], ["disk"])
        self.assertIn(data["checks"][0]["status"], ("ok", "warn", "fail"))


FAKE_SERVER = (
    "import json, sys\n"
    "req = json.loads(sys.stdin.readline())\n"
    "print(json.dumps({'jsonrpc': '2.0', 'id': req['id'], 'result': {'serverInfo': {'name': 'fake'}}}), flush=True)\n"
    "sys.stdin.readline()\n"
)


class WindowsPortabilityTests(unittest.TestCase):
    """Each of these crashed or misreported on Windows before."""

    def test_reindex_check_does_not_need_launchd_off_macos(self):
        with mock.patch.object(health.sys, "platform", "win32"), \
             mock.patch.object(health, "run", side_effect=AssertionError("must not call launchctl")):
            status, detail = health.check_reindex()
        self.assertEqual(status, health.WARN)
        self.assertIn("macOS only", detail)

    def test_stdio_handshake_reads_the_reply_without_select(self):
        # select() on a pipe raises WinError 10038 on Windows; the reader thread works everywhere.
        ok, detail = health.mcp_stdio_handshake(sys.executable, ["-c", FAKE_SERVER], timeout=20)
        self.assertTrue(ok, detail)
        self.assertIn("fake", detail)

    def test_stdio_handshake_reports_why_a_server_exited(self):
        script = "import sys; sys.stderr.write('launcher blocked the command\\nEvent code: X1\\n'); sys.exit(1)"
        ok, detail = health.mcp_stdio_handshake(sys.executable, ["-c", script], timeout=20)
        self.assertFalse(ok)
        self.assertIn("launcher blocked the command", detail)
        self.assertNotIn("no initialize reply", detail)

    def test_run_decodes_utf8_output_whatever_the_locale(self):
        rc, out = health.run([sys.executable, "-c", "import sys; sys.stdout.buffer.write('\\u2705 ok'.encode())"])
        self.assertEqual(rc, 0)
        self.assertEqual(out, "✅ ok")


if __name__ == "__main__":
    unittest.main()
