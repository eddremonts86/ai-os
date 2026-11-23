"""/aios-ui-form-create: its recipes use shadcn's Field family, and every skill that talks about forms agrees."""

import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SKILLS = ROOT / "ai-config" / "skills"
FORM = SKILLS / "aios-ui-form-create"

# What `shadcn add field input-group` exports today (CLI 4.23, 2026-11-23). A recipe that imports another name
# from these two files is teaching an API that does not exist.
EXPORTS = {
    "field": {"Field", "FieldLabel", "FieldDescription", "FieldError", "FieldGroup", "FieldLegend", "FieldSeparator",
              "FieldSet", "FieldContent", "FieldTitle"},
    "input-group": {"InputGroup", "InputGroupAddon", "InputGroupButton", "InputGroupText", "InputGroupInput",
                    "InputGroupTextarea"},
}
LEGACY = ("<FormField", "<FormItem", "<FormControl", "FormMessage", "@/components/ui/form\"", "@/components/ui/form'")


def read(path):
    return path.read_text(encoding="utf-8")


class FormSkillTests(unittest.TestCase):
    def test_the_skill_and_its_two_references_exist(self):
        for name in ("SKILL.md", "references/form-rules.md", "references/field-recipes.md"):
            self.assertTrue((FORM / name).is_file(), name)

    def test_recipes_import_only_names_the_components_export(self):
        text = read(FORM / "references/field-recipes.md")
        found = 0
        for names, module in re.findall(r"import\s*\{([^}]+)\}\s*from\s*[\"']@/components/ui/([\w-]+)[\"']", text):
            if module in EXPORTS:
                found += 1
                got = {n.strip() for n in names.split(",") if n.strip()}
                self.assertLessEqual(got, EXPORTS[module], f"{module}: {sorted(got - EXPORTS[module])}")
        self.assertGreaterEqual(found, 2, "the recipes never import from field or input-group")

    def test_nothing_teaches_the_legacy_form_wrapper(self):
        for path in (FORM / "SKILL.md", FORM / "references/field-recipes.md", FORM / "references/form-rules.md",
                     SKILLS / "shadcn-patterns" / "SKILL.md"):
            text = read(path)
            for token in LEGACY:
                self.assertNotIn(token, text, f"{path.relative_to(ROOT)} still uses {token}")

    def test_one_validation_timing_rule_everywhere(self):
        rules = read(FORM / "references/form-rules.md")
        self.assertIn('mode: "onTouched"', rules)
        self.assertIn("isBlurred", rules)
        row = next(l for l in read(SKILLS / "optimizing-forms" / "SKILL.md").splitlines() if l.startswith("| Validation on blur"))
        self.assertNotIn("Not on keypress", row)
        self.assertIn("change", row)

    def test_the_canonical_design_md_has_a_forms_section_after_the_ai_os_ones(self):
        template = read(SKILLS / "aios-ui-system-check" / "references" / "design-md.md")
        self.assertIn("\n## Forms\n", template)
        self.assertLess(template.index("\n## Variants and patterns\n"), template.index("\n## Forms\n"))

    def test_the_other_form_skills_name_the_command(self):
        for skill in ("optimizing-forms", "pick-ui-library", "shadcn-patterns"):
            self.assertIn("/aios-ui-form-create", read(SKILLS / skill / "SKILL.md"), skill)


if __name__ == "__main__":
    unittest.main()
