"""setup/aios_profile.py: the per-person install profile turns shared MCP servers on or off and adds new ones."""

import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SETUP = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(SETUP))
import aios_profile  # noqa: E402

SHARED = [{"name": "time", "enabled": True}, {"name": "rea", "enabled": False}]


class ApplyMcpTests(unittest.TestCase):
    def test_enable_disable_and_add(self):
        profile = {"mcp": {"enable": ["rea"], "disable": ["time"],
                           "servers": [{"name": "mine", "transport": "http", "url": "http://127.0.0.1:9/mcp"}]}}
        out = {d["name"]: d for d in aios_profile.apply_mcp(SHARED, profile)}
        self.assertFalse(out["time"]["enabled"])
        self.assertTrue(out["rea"]["enabled"])
        self.assertIn("mine", out)
        self.assertTrue(SHARED[0]["enabled"], "the shared definitions are not mutated")

    def test_no_profile_changes_nothing(self):
        self.assertEqual(aios_profile.apply_mcp(SHARED, {}), SHARED)

    def test_own_server_cannot_shadow_a_shared_one(self):
        with self.assertRaises(ValueError):
            aios_profile.apply_mcp(SHARED, {"mcp": {"servers": [{"name": "time"}]}})

    def test_only_the_shared_directory_is_adjusted(self):
        self.assertTrue(aios_profile.applies_to(aios_profile.SHARED_MCP))
        self.assertFalse(aios_profile.applies_to(tempfile.mkdtemp()))


class SyncIntegrationTests(unittest.TestCase):
    def test_sync_applies_the_profile_to_the_shared_set(self):
        d = Path(tempfile.mkdtemp())
        (d / "install.yaml").write_text(
            "mcp:\n  disable: [time]\n  servers:\n    - {name: mine, transport: http, url: 'http://127.0.0.1:9/mcp'}\n")
        target = d / "mcp.json"
        env = dict(os.environ, AIOS_INSTALL_PROFILE=str(d / "install.yaml"), HOME=str(d))
        r = subprocess.run([sys.executable, str(SETUP / "sync-ide-mcp-servers.py"), str(aios_profile.SHARED_MCP),
                            "--vscode", str(target)], capture_output=True, text=True, env=env)
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
        servers = json.loads(target.read_text())["servers"]
        self.assertIn("mine", servers)
        self.assertNotIn("time", servers)


if __name__ == "__main__":
    unittest.main()
