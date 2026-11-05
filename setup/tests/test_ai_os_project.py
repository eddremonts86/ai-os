"""setup/ai-os-project.py: creates only what is missing and never overwrites."""

import importlib.util
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-project.py"
spec = importlib.util.spec_from_file_location("ai_os_project", SCRIPT)
proj = importlib.util.module_from_spec(spec)
spec.loader.exec_module(proj)


class ProjectInitTests(unittest.TestCase):
    def repo(self, d):
        r = Path(d) / "My App"
        r.mkdir()
        subprocess.run(["git", "init", "-q"], cwd=r, check=True)
        return r

    def test_creates_basics_and_is_idempotent(self):
        with tempfile.TemporaryDirectory() as d:
            r = self.repo(d)
            proj.init(r)
            text = (r / "CLAUDE.md").read_text(encoding="utf-8")
            self.assertIn("graphiti group_id is `My-App`", text)
            self.assertTrue((r / ".agents" / "skills").is_dir())
            ignore = (r / ".gitignore").read_text(encoding="utf-8").splitlines()
            for pat in (".env", ".env*.aside", ".playwright-mcp/"):
                self.assertIn(pat, ignore)
            self.assertNotIn(".env.*", ignore)  # would hide .env.example
            before = {p: p.read_bytes() for p in r.rglob("*") if p.is_file() and ".git/" not in str(p)}
            proj.init(r)
            self.assertEqual(before, {p: p.read_bytes() for p in r.rglob("*") if p.is_file() and ".git/" not in str(p)})

    def test_never_overwrites_existing_claude_md_or_ignore_lines(self):
        with tempfile.TemporaryDirectory() as d:
            r = self.repo(d)
            (r / "CLAUDE.md").write_text("mine\n", encoding="utf-8")
            (r / ".gitignore").write_text("node_modules\n.env\n", encoding="utf-8")
            proj.init(r)
            self.assertEqual((r / "CLAUDE.md").read_text(encoding="utf-8"), "mine\n")
            ignore = (r / ".gitignore").read_text(encoding="utf-8").splitlines()
            self.assertEqual(ignore.count(".env"), 1)
            self.assertIn("node_modules", ignore)

    def test_dry_run_writes_nothing_and_non_repo_is_refused(self):
        with tempfile.TemporaryDirectory() as d:
            r = self.repo(d)
            proj.init(r, dry=True)
            self.assertFalse((r / "CLAUDE.md").exists())
            with self.assertRaises(SystemExit):
                proj.init(Path(d))


if __name__ == "__main__":
    unittest.main()
