"""setup/ai-os-stats.py: every published number matches the repo, and every claim still matches its page."""

import importlib.util
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-stats.py"
spec = importlib.util.spec_from_file_location("ai_os_stats", SCRIPT)
stats_mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(stats_mod)


class StatsTests(unittest.TestCase):
    def setUp(self):
        self.stats = stats_mod.compute()

    def test_counts_are_positive_and_consistent(self):
        s = self.stats
        for key, value in s.items():
            self.assertIsInstance(value, int, key)
            self.assertGreater(value, 0, key)
        self.assertEqual(s["skills_linked"], s["skills_flat"] + s["skills_gstack"] + s["skills_ecc"])
        self.assertEqual(s["skills_curated"], s["skills_linked"] - s["superpowers"])
        self.assertLessEqual(s["mcp_enabled"], s["mcp_total"])

    def test_every_claim_still_finds_its_number(self):
        # A rewritten sentence must not silently drop out of --check.
        missing = [c for f, line, got, want, c in stats_mod.scan(self.stats) if got is None]
        self.assertEqual(missing, [])

    def test_published_numbers_match_repo(self):
        stale = [(f, line, got, want) for f, line, got, want, c in stats_mod.scan(self.stats) if got != want]
        self.assertEqual(stale, [], "run: ai-os stats --write")


if __name__ == "__main__":
    unittest.main()
