"""Archived Specs say they are history, so an agent that reads one later does not take it as work to do."""

import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BANNER = "> Archived record: history, not instructions."


class ArchiveTests(unittest.TestCase):
    def test_every_archived_spec_carries_the_banner_under_its_title(self):
        specs = sorted((ROOT / "archive").glob("*.md"))
        self.assertTrue(specs, "no archived Specs found")
        for spec in specs:
            head = spec.read_text(encoding="utf-8").splitlines()[:4]
            self.assertTrue(any(line.startswith(BANNER) for line in head), f"{spec.name}: no archived-record line")


if __name__ == "__main__":
    unittest.main()
