"""setup/ai-os-scope.py: folders resolve to the right scope and brand, the guard blocks or warns by severity."""

import importlib.util
import subprocess
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-scope.py"
spec = importlib.util.spec_from_file_location("ai_os_scope", SCRIPT)
sc = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sc)

CFG = {
    "default": "personal",
    "guard": {"always_block": ["555-0100"]},
    "scopes": {
        "work": {
            "paths": ["Clients/acme"],
            "git": "context/personal/machine/dotfiles/git/.gitconfig-work",
            "design": {"system": "https://example.com/acme-ds"},
            "guard": {"block": ["re:ACME-[0-9]+", "acme-internal"], "warn": ["Acme"]},
        },
        "company": {
            "paths": ["me/products"],
            "design": {"doc": "me/products/DESIGN.md"},
            "brands": {"alpha": {"paths": ["me/products/alpha"], "design": {"doc": "me/products/alpha/DESIGN.md"}}},
        },
        "personal": {"paths": ["me"]},
    },
}


class WhichTests(unittest.TestCase):
    def setUp(self):
        self.projects = Path(tempfile.mkdtemp())

    def test_first_matching_scope_wins_and_brand_design_overrides(self):
        info = sc.which(CFG, self.projects / "me/products/alpha/src", self.projects)
        self.assertEqual((info["scope"], info["brand"]), ("company", "alpha"))
        self.assertEqual(info["design"]["doc"], "me/products/alpha/DESIGN.md")

    def test_folder_match_is_case_insensitive_and_exact_on_segments(self):
        self.assertEqual(sc.which(CFG, self.projects / "clients/ACME/app", self.projects)["scope"], "work")
        self.assertEqual(sc.which(CFG, self.projects / "Clients/acme-old", self.projects)["scope"], "personal")

    def test_outside_projects_falls_back_to_default(self):
        self.assertEqual(sc.which(CFG, "/", self.projects)["scope"], "personal")

    def test_no_config_means_no_scope(self):
        self.assertEqual(sc.which(None, self.projects), {"scope": None})


class GuardTests(unittest.TestCase):
    DIFF = "+++ b/README.md\n+see ACME-1234 for context\n+Built at Acme\n-removed acme-internal line\n+++ b/x.txt\n+call 555-0100\n"

    def test_terms_of_other_scopes_only(self):
        own = {t for _, s, t in sc.guard_terms(CFG, "work")}
        self.assertNotIn("acme-internal", own)
        self.assertIn("555-0100", own)

    def test_block_warn_and_always_on_added_lines_only(self):
        found = sc.scan(self.DIFF, sc.guard_terms(CFG, "personal"))
        got = {(sev, term, f) for sev, _, term, f in found}
        self.assertIn(("block", "re:ACME-[0-9]+", "README.md"), got)
        self.assertIn(("warn", "Acme", "README.md"), got)
        self.assertIn(("block", "555-0100", "x.txt"), got)
        self.assertNotIn(("block", "acme-internal", "README.md"), got)  # only on a removed line

    def test_check_push_exit_code_follows_severity(self):
        repo = Path(tempfile.mkdtemp())
        git = lambda *a: subprocess.run(["git", "-C", str(repo), *a], check=True, capture_output=True)
        git("init", "-q"); git("config", "user.email", "t@example.com"); git("config", "user.name", "t")
        (repo / "a.md").write_text("Built at Acme\n"); git("add", "."); git("commit", "-qm", "warn only")
        code, out = sc.check_push(CFG, repo, ["HEAD"])
        self.assertEqual(code, 0)
        self.assertTrue(any(o.startswith("WARN") for o in out))
        (repo / "b.md").write_text("ticket ACME-77\n"); git("add", "."); git("commit", "-qm", "block")
        code, out = sc.check_push(CFG, repo, ["HEAD"])
        self.assertEqual(code, 1)

    def test_cli_accepts_a_new_branch_range_as_one_argument(self):
        # pre-push passes "SHA --not --remotes" for a branch the remote does not have yet.
        import sys
        r = subprocess.run([sys.executable, str(SCRIPT), "check-push", "HEAD --not --remotes"],
                           capture_output=True, text=True)
        self.assertNotEqual(r.returncode, 2, r.stderr)


class GitConfigTests(unittest.TestCase):
    def test_block_has_one_include_per_folder_and_apply_is_idempotent(self):
        block = sc.git_block(CFG, projects="/p", root="/r")
        self.assertIn('[includeIf "gitdir/i:/p/Clients/acme/"]', block)
        self.assertIn("path = /r/context/personal/machine/dotfiles/git/.gitconfig-work", block)
        home = Path(tempfile.mkdtemp()) / ".gitconfig"
        home.write_text("[user]\n    name = Me\n")
        sc.apply_git(block, home)
        sc.apply_git(block, home)
        text = home.read_text()
        self.assertEqual(text.count(sc.MARK_BEGIN), 1)
        self.assertIn("name = Me", text)
        self.assertTrue(home.with_name(".gitconfig.pre-aios-scope.bak").exists())


if __name__ == "__main__":
    unittest.main()
