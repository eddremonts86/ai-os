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
        p.write_text(text, encoding="utf-8")


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

    def test_user_file_quoting_the_marker_is_kept(self):
        mine = self.home / ".claude/agents/notes.md"
        mine.parent.mkdir(parents=True, exist_ok=True)
        mine.write_text(f"---\nname: notes\n---\nI read about the '{ra.MARKER}' line.\n")
        ra.sync(self.home, self.agents)
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

    def test_exact_layout_per_cli(self):
        ra.sync(self.home, self.agents)
        body = 'Say "hi" and use {braces}.\n'
        claude = (self.home / ".claude/agents/helper.md").read_text()
        self.assertTrue(claude.startswith(f"---\n# {ra.MARKER}\nname: helper\ndescription: Helps with things.\n"))
        self.assertTrue(claude.endswith(f"---\n\n{body}"))
        self.assertEqual((self.home / ".gemini/agents/helper.md").read_text().split("---")[1],
                         claude.replace("model: sonnet\n", "").split("---")[1])
        oc = yaml.safe_load((self.home / ".config/opencode/agents/helper.md").read_text().split("---")[1])
        self.assertEqual(oc["description"], "Helps with things.")
        codex = tomllib.loads((self.home / ".codex/agents/helper.toml").read_text())
        self.assertEqual((codex["description"], codex["developer_instructions"]), ("Helps with things.", body))

    def test_codex_extras_bool_list_and_unicode(self):
        src = AGENT.replace("codex: {model_reasoning_effort: high}",
                            "codex: {flag: true, disabled: false, tags: [a, b]}").replace("Helps with", "Revisión de")
        make(self.tmp, {"u/helper.md": src})
        agents = ra.load_agents([self.tmp / "u"])
        ra.sync(self.home, agents)
        codex = tomllib.loads((self.home / ".codex/agents/helper.toml").read_text())
        self.assertEqual((codex["flag"], codex["disabled"], codex["tags"]), (True, False, ["a", "b"]))
        self.assertIn("description: Revisión de things.", (self.home / ".claude/agents/helper.md").read_text(encoding="utf-8"))

    def test_name_must_match_the_pattern_even_when_it_equals_the_file_name(self):
        for stem, name in (("Bad_Name", "Bad_Name"), ("123", "123")):
            folder = self.tmp / f"n-{stem}"
            make(self.tmp, {f"n-{stem}/{stem}.md": f"---\nname: {name}\ndescription: x\n---\nbody\n"})
            with self.assertRaises(ValueError):
                ra.load_agents([folder])

    def test_user_file_for_one_agent_does_not_stop_the_others(self):
        make(self.tmp, {"shared/aaa.md": AGENT.replace("name: helper", "name: aaa")})
        agents = ra.load_agents([self.tmp / "shared"])
        mine = self.home / ".claude/agents/aaa.md"
        mine.parent.mkdir(parents=True, exist_ok=True)
        mine.write_text("my own\n")
        ra.sync(self.home, agents)
        self.assertTrue((self.home / ".claude/agents/helper.md").exists())
        make(self.tmp, {"shared/helper.md": AGENT.replace("Helps with", "Now helps with")})
        agents = ra.load_agents([self.tmp / "shared"])
        actions = {(act, p.name) for act, p, cli in ra.sync(self.home, agents) if cli == "claude"}
        self.assertIn(("write", "helper.md"), actions)
        self.assertIn(("skip-user-file", "aaa.md"), actions)

    def test_stale_file_is_reported_as_remove(self):
        ra.sync(self.home, self.agents)
        actions = {act for act, _, _ in ra.sync(self.home, {}, check=True)}
        self.assertEqual(actions, {"remove"})

    def test_marker_on_a_later_line_is_a_user_file(self):
        mine = self.home / ".claude/agents/helper.md"
        mine.parent.mkdir(parents=True, exist_ok=True)
        mine.write_text(f"---\nname: helper\n# {ra.MARKER}\n---\nmine\n")
        ra.sync(self.home, self.agents)
        self.assertTrue(mine.read_text().endswith("mine\n"))

    def test_main_writes_then_check_passes_then_detects_drift(self):
        import contextlib
        import io
        home = self.tmp / "mainhome"
        (home / ".claude").mkdir(parents=True)
        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            self.assertEqual(ra.main(["--home", str(home)]), 0)
            self.assertEqual(ra.main(["--home", str(home), "--check"]), 0)
        n = len(ra.load_agents())
        self.assertIn(f"{n} agent(s) -> claude; {n} change(s)", out.getvalue())
        self.assertIn(f"{n} agent(s) -> claude; 0 change(s)", out.getvalue())
        (home / ".claude/agents/docs-writer.md").unlink()
        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            self.assertEqual(ra.main(["--home", str(home), "--check"]), 1)
        self.assertIn("write", out.getvalue())
        self.assertNotIn("  ok", out.getvalue())

    def test_a_missing_cli_does_not_skip_the_ones_after_it(self):
        home = self.tmp / "nogemini"
        for probe in (".claude", ".config/opencode", ".codex"):
            (home / probe).mkdir(parents=True)
        clis = {cli for _, _, cli in ra.sync(home, self.agents)}
        self.assertEqual(clis, {"claude", "opencode", "codex"})

    def test_main_counts_a_pending_removal_and_fails_on_bad_sources(self):
        import contextlib
        import io
        from unittest import mock
        home = self.tmp / "stalehome"
        (home / ".claude").mkdir(parents=True)
        with contextlib.redirect_stdout(io.StringIO()):
            ra.main(["--home", str(home)])
            (home / ".claude/agents/gone.md").write_text(f"---\n# {ra.MARKER}\nname: gone\n---\nx\n")
            self.assertEqual(ra.main(["--home", str(home), "--check"]), 1)
        with mock.patch.object(ra, "load_agents", side_effect=ValueError("bad")), \
                contextlib.redirect_stderr(io.StringIO()):
            self.assertEqual(ra.main(["--home", str(home)]), 2)

    def test_sources_are_shared_then_personal(self):
        self.assertEqual(ra.SOURCES, [ra.ROOT / "ai-config" / "agents", ra.ROOT / "context" / "personal" / "agents"])

    def test_shipped_agents_are_valid(self):
        agents = ra.load_agents([ra.ROOT / "ai-config" / "agents"])
        self.assertIn("docs-writer", agents)


if __name__ == "__main__":
    unittest.main()
