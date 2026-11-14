"""setup/render-agents.py: one agent source becomes each CLI's own format, never clobbering the user's own files."""

import importlib.util
import tempfile
import tomllib
import unittest
from pathlib import Path

import yaml

SCRIPT = Path(__file__).resolve().parents[1] / "render-agents.py"
spec = importlib.util.spec_from_file_location("render_agents", SCRIPT)
ra = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ra)

AGENT = """---
name: helper
description: >-
  Helps with
  things.
clis:
  claude: {model: sonnet}
  codex: {model_reasoning_effort: high}
---
Say "hi" and use {braces}.
"""


def make(tmp, files):
    for rel, text in files.items():
        p = Path(tmp) / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(text)


class RenderTests(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())
        make(self.tmp, {"shared/helper.md": AGENT})
        self.agents = ra.load_agents([self.tmp / "shared", self.tmp / "personal"])
        self.home = self.tmp / "home"
        for probe in (".claude", ".gemini", ".config/opencode", ".codex"):
            (self.home / probe).mkdir(parents=True)

    def test_each_cli_gets_its_format(self):
        ra.sync(self.home, self.agents)
        claude = (self.home / ".claude/agents/helper.md").read_text()
        front = yaml.safe_load(claude.split("---")[1])
        self.assertEqual(front, {"name": "helper", "description": "Helps with things.", "model": "sonnet"})
        oc = yaml.safe_load((self.home / ".config/opencode/agents/helper.md").read_text().split("---")[1])
        self.assertEqual(oc["mode"], "subagent")
        self.assertNotIn("name", oc)
        codex = tomllib.loads((self.home / ".codex/agents/helper.toml").read_text())
        self.assertEqual(codex["name"], "helper")
        self.assertEqual(codex["model_reasoning_effort"], "high")
        self.assertIn('Say "hi" and use {braces}.', codex["developer_instructions"])
        self.assertTrue((self.home / ".gemini/agents/helper.md").exists())

    def test_second_run_changes_nothing(self):
        ra.sync(self.home, self.agents)
        self.assertTrue(all(act == "ok" for act, _, _ in ra.sync(self.home, self.agents)))

    def test_user_file_is_never_overwritten_and_stale_generated_file_is_removed(self):
        mine = self.home / ".claude/agents/helper.md"
        mine.parent.mkdir(parents=True, exist_ok=True)
        mine.write_text("my own agent\n")
        ra.sync(self.home, self.agents)
        self.assertEqual(mine.read_text(), "my own agent\n")
        ra.sync(self.home, {})
        self.assertFalse((self.home / ".codex/agents/helper.toml").exists())
        self.assertTrue(mine.exists())

    def test_missing_cli_is_skipped(self):
        home = self.tmp / "bare"
        (home / ".claude").mkdir(parents=True)
        clis = {cli for _, _, cli in ra.sync(home, self.agents)}
        self.assertEqual(clis, {"claude"})

    def test_personal_agent_replaces_shared_one(self):
        make(self.tmp, {"personal/helper.md": AGENT.replace("Helps with", "Mine:")})
        agents = ra.load_agents([self.tmp / "shared", self.tmp / "personal"])
        self.assertTrue(agents["helper"]["description"].startswith("Mine:"))

    def test_invalid_sources_are_rejected(self):
        for bad in ("---\nname: Other\ndescription: x\n---\nbody\n", "---\nname: helper\n---\nbody\n",
                    "---\nname: helper\ndescription: x\nclis: {cursor: {}}\n---\nbody\n", "no frontmatter\n"):
            make(self.tmp, {"bad/helper.md": bad})
            with self.assertRaises(ValueError):
                ra.load_agents([self.tmp / "bad"])

    def test_shipped_agents_are_valid(self):
        agents = ra.load_agents([ra.ROOT / "ai-config" / "agents"])
        self.assertIn("docs-writer", agents)


if __name__ == "__main__":
    unittest.main()
