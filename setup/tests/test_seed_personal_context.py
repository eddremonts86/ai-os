"""setup/seed-personal-context.py: writes the personal stubs once and never overwrites your own files."""

import importlib.util
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "seed-personal-context.py"
spec = importlib.util.spec_from_file_location("seed_personal_context", SCRIPT)
seed_mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(seed_mod)


class SeedTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.personal = self.root / "context" / "personal"

    def test_creates_every_stub_in_a_fresh_install(self):
        self.assertEqual(sorted(seed_mod.seed(self.root)), sorted(seed_mod.TEMPLATES))
        self.assertTrue((self.personal / "work" / "scopes.yaml").is_file())

    def test_never_overwrites_a_file_you_already_wrote(self):
        (self.personal / "me").mkdir(parents=True)
        (self.personal / "me" / "profile.md").write_text("mine\n", encoding="utf-8")
        self.assertNotIn("me/profile.md", seed_mod.seed(self.root))
        self.assertEqual((self.personal / "me" / "profile.md").read_text(encoding="utf-8"), "mine\n")

    def test_second_run_creates_nothing(self):
        seed_mod.seed(self.root)
        self.assertEqual(seed_mod.seed(self.root), [])

    def test_the_starter_scopes_file_is_valid_for_ai_os_scope(self):
        seed_mod.seed(self.root)
        try:
            import yaml
        except ImportError:
            self.skipTest("PyYAML is only in the AI-OS venv")
        cfg = yaml.safe_load((self.personal / "work" / "scopes.yaml").read_text(encoding="utf-8"))
        self.assertEqual(cfg["default"], "personal")
        self.assertIn("personal", cfg["scopes"])


if __name__ == "__main__":
    unittest.main()
