"""The README lists every command a person can type, so none gets lost (2026-11-15)."""

import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
README = (ROOT / "README.md").read_text(encoding="utf-8")


class ReadmeCommandsTests(unittest.TestCase):
    def test_every_ai_os_subcommand_is_in_the_readme(self):
        dispatcher = (ROOT / "ai-os").read_text(encoding="utf-8")
        subs = set(re.findall(r"^  ([a-z]+)\)$", dispatcher, re.M))
        self.assertGreater(len(subs), 10)
        missing = sorted(s for s in subs if f"ai-os {s}" not in README)
        self.assertEqual(missing, [], "add these to the README's `ai-os` command table")

    def test_every_aios_skill_and_shared_command_is_in_the_readme(self):
        names = [d.name for d in (ROOT / "ai-config/skills").iterdir() if d.name.startswith("aios-") and (d / "SKILL.md").is_file()]
        names += [f.stem for f in (ROOT / "ai-config/commands").glob("*.md") if f.stem != "README"]
        self.assertGreater(len(names), 25)
        missing = sorted(n for n in names if f"/{n}`" not in README and f"(`/{n}`)" not in README)
        self.assertEqual(missing, [], "add these to the README's Slash commands section")


if __name__ == "__main__":
    unittest.main()
