"""setup/seed-personal-context.py: copies the templates once and never overwrites your own files."""

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
        self.root = Path(self.tmp.name)
        ex = self.root / "context" / "personal.example"
        ex.mkdir(parents=True)
        (ex / "00_profile.md").write_text("template profile\n", encoding="utf-8")
        (ex / "03_preferences.md").write_text("template prefs\n", encoding="utf-8")
        self.personal = self.root / "context" / "personal"
        self.addCleanup(self.tmp.cleanup)

    def test_copies_every_template_into_a_missing_personal_folder(self):
        self.assertEqual(seed_mod.seed(self.root), ["00_profile.md", "03_preferences.md"])
        self.assertEqual((self.personal / "00_profile.md").read_text(encoding="utf-8"), "template profile\n")

    def test_never_overwrites_a_file_you_already_wrote(self):
        self.personal.mkdir(parents=True)
        (self.personal / "00_profile.md").write_text("mine\n", encoding="utf-8")
        self.assertEqual(seed_mod.seed(self.root), ["03_preferences.md"])
        self.assertEqual((self.personal / "00_profile.md").read_text(encoding="utf-8"), "mine\n")

    def test_copies_nested_templates_and_keeps_the_ones_you_have(self):
        nested = self.root / "context" / "personal.example" / "dotfiles" / "ssh"
        nested.mkdir(parents=True)
        (nested / "config").write_text("template ssh\n", encoding="utf-8")
        mine = self.personal / "dotfiles" / "ssh"
        mine.mkdir(parents=True)
        (mine / "config").write_text("my hosts\n", encoding="utf-8")
        copied = seed_mod.seed(self.root)
        self.assertNotIn("dotfiles/ssh/config", copied)
        self.assertEqual((mine / "config").read_text(encoding="utf-8"), "my hosts\n")
        (mine / "config").unlink()
        self.assertEqual(seed_mod.seed(self.root), ["dotfiles/ssh/config"])

    def test_second_run_copies_nothing(self):
        seed_mod.seed(self.root)
        self.assertEqual(seed_mod.seed(self.root), [])

    def test_no_templates_is_not_an_error(self):
        self.assertEqual(seed_mod.seed(self.root / "elsewhere"), [])


if __name__ == "__main__":
    unittest.main()
