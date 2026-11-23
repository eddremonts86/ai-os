"""The vendored ui-sdk skill keeps the limits AI-OS put on it (vetted 2026-11-23, see its VENDORED_FROM.md)."""

import re
import unittest
from pathlib import Path

SKILL = Path(__file__).resolve().parents[2] / "ai-config" / "skills" / "ui-sdk"


def text(*parts):
    return SKILL.joinpath(*parts).read_text(encoding="utf-8")


class VendoredUiSdkTests(unittest.TestCase):
    def test_no_unpinned_remote_script_or_stylesheet(self):
        for path in SKILL.rglob("*.md"):
            for url in re.findall(r"https://ui-sdk\.dev/web(?:\.js|\.css)\b", path.read_text(encoding="utf-8")):
                # the moving URLs may be named in prose that forbids them, never loaded from a tag
                self.assertNotRegex(path.read_text(encoding="utf-8"), r"(?:src|href)=\"" + re.escape(url), path.name)

    def test_a_constant_allow_is_only_ever_marked_as_a_test_mock(self):
        for path in SKILL.rglob("*.md"):
            for line in path.read_text(encoding="utf-8").splitlines():
                if "allow: () => true" in line:
                    self.assertRegex(line, r"test mock|never in app code|annotated", f"{path.name}: {line.strip()}")

    def test_the_licence_the_provenance_and_the_limits_are_there(self):
        self.assertIn("Apache License", text("LICENSE"))
        self.assertRegex(text("VENDORED_FROM.md"), r"926dab872d1f2aa23df4bd9b5cf21c879c9abac9")
        skill = text("SKILL.md")
        for needle in ("## AI-OS limits", "Modified by AI-OS", "references/ai-os-notes.md"):
            self.assertIn(needle, skill)
        self.assertTrue((SKILL / "references" / "ai-os-notes.md").is_file())

    def test_the_rule_and_the_skill_agree_on_the_order(self):
        rules = (SKILL.parents[2] / "rules" / "always_do.md").read_text(encoding="utf-8")
        self.assertIn("Components before code", rules)
        self.assertIn("ai-os-notes.md", rules)


if __name__ == "__main__":
    unittest.main()
