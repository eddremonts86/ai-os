"""setup/ai-os-skills.py: the catalogue stays inside its budget and the routing bank stays valid."""

import importlib.util
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-skills.py"
spec = importlib.util.spec_from_file_location("ai_os_skills", SCRIPT)
sk = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sk)


class SkillsTests(unittest.TestCase):
    def test_no_description_over_the_hard_cap(self):
        too_long = [(s["dir"], len(s["description"])) for s in sk.load() if len(s["description"]) > sk.HARD_MAX]
        self.assertEqual(too_long, [], "trim to <= 350 chars; keep the old text in the body")

    def test_every_skill_has_a_description(self):
        self.assertEqual([s["dir"] for s in sk.load() if not s["description"]], [])

    def test_bank_expects_only_linked_skills_and_stays_above_the_alarm(self):
        import json
        known = {s["dir"] for s in sk.load()}
        entries = json.loads(sk.BANK.read_text(encoding="utf-8"))
        self.assertGreaterEqual(len(entries), 30)
        self.assertEqual(sorted({e for x in entries for e in x["expect"]} - known), [])
        hits = sum(1 for x in entries if any(e in sk.route(x["prompt"]) for e in x["expect"]))
        self.assertGreaterEqual(hits / len(entries), 0.7)

    def test_route_finds_an_obvious_skill(self):
        self.assertIn("coolify-deploy", sk.route("deploy this docker compose app to Coolify and sync the env vars"))

    def test_words_drops_stopwords_and_short_tokens(self):
        self.assertEqual(sk.words("Use the API to be fast"), ["api", "fast"])


if __name__ == "__main__":
    unittest.main()
