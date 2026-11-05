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


if __name__ == "__main__":
    unittest.main()
