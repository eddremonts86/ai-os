"""setup/hooks/claude-session-memory.py must never block or clutter a session start."""

import os
import subprocess
import sys
import unittest
from pathlib import Path

HOOK = Path(__file__).resolve().parents[1] / "hooks" / "claude-session-memory.py"


def run_hook(stdin, url="http://127.0.0.1:9/mcp/"):
    env = {**os.environ, "AIOS_GRAPHITI_URL": url}
    return subprocess.run([sys.executable, str(HOOK)], input=stdin, capture_output=True, text=True, timeout=30, env=env)


class SessionMemoryHookTests(unittest.TestCase):
    def test_graphiti_down_is_silent_success(self):
        p = run_hook('{"cwd": "/tmp"}')
        self.assertEqual((p.returncode, p.stdout), (0, ""))

    def test_garbage_input_is_silent_success(self):
        p = run_hook("not json")
        self.assertEqual((p.returncode, p.stdout), (0, ""))


if __name__ == "__main__":
    unittest.main()
