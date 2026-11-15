"""Regression tests for the pre-main security fixes (2026-11-14): backup paths, the installer's marked block,
the scan baseline filter and the published agent count."""

import importlib.util
import os
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def load(path, name):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


@unittest.skipIf(os.name == "nt", "macOS/Linux shell script")
class BackupPathTests(unittest.TestCase):
    """A checkout directly in HOME must not make the backup copy the whole home folder into itself."""

    def run_backup(self, home, projects, dest):
        env = {**os.environ, "HOME": str(home), "AI_OS_PROJECTS_DIR": str(projects)}
        return subprocess.run(["bash", str(ROOT / "setup/backup-before-reinstall.sh"), str(dest)],
                              capture_output=True, text=True, timeout=60, env=env)

    def test_refuses_home_as_projects_folder(self):
        home = Path(tempfile.mkdtemp())
        dest = home / "Backups" / "ai-os"
        p = self.run_backup(home, home, dest)
        self.assertEqual(p.returncode, 1)
        self.assertIn("AI_OS_PROJECTS_DIR", p.stderr)
        self.assertFalse(dest.exists())

    def test_refuses_destination_inside_projects(self):
        home = Path(tempfile.mkdtemp())
        projects = home / "Projects"
        projects.mkdir()
        dest = projects / "backup"
        p = self.run_backup(home, projects, dest)
        self.assertEqual(p.returncode, 1)
        self.assertIn("inside", p.stderr)
        self.assertFalse(dest.exists())


@unittest.skipIf(os.name == "nt", "macOS/Linux shell script; install-windows.ps1 has its own Add-AiosBlock")
class MarkedBlockTests(unittest.TestCase):
    """install-mac.sh's aios_block: refresh in place, never lose the user's lines without a copy."""

    def block(self, path, body):
        script = (f'LOG_PREFIX=t; eval "$(sed -n \'/^warn() {{/p\' {ROOT}/setup/install-mac.sh)"; '
                  f'eval "$(sed -n \'/^aios_block() {{/,/^}}/p\' {ROOT}/setup/install-mac.sh)"; '
                  f'aios_block "$1" "$2"')
        subprocess.run(["bash", "-c", script, "x", str(path), body], check=True, capture_output=True, text=True)

    def test_refresh_is_idempotent_and_keeps_user_lines(self):
        rc = Path(tempfile.mkdtemp()) / ".zshrc"
        rc.write_text("mine\n")
        self.block(rc, "one")
        self.block(rc, "two")
        text = rc.read_text()
        self.assertEqual(text.count("# >>> ai-os >>>"), 1)
        self.assertIn("mine\n", text)
        self.assertIn("two", text)
        self.assertNotIn("one", text)
        self.assertFalse(rc.with_name(".zshrc.pre-aios.bak").exists())

    def test_unclosed_block_is_copied_before_rewrite(self):
        rc = Path(tempfile.mkdtemp()) / ".zshrc"
        original = "mine1\n# >>> ai-os >>>\nold\nmine2\n"
        rc.write_text(original)
        self.block(rc, "new")
        self.assertEqual(rc.with_name(".zshrc.pre-aios.bak").read_text(), original)


class ScanBaselineFilterTests(unittest.TestCase):
    """scan.py --baseline keeps image findings and matches paths when the scan root is a subfolder."""

    @classmethod
    def setUpClass(cls):
        cls.scan = load(ROOT / "ai-config/skills/aios-security-audit/scripts/scan.py", "scan")

    def setUp(self):
        self.repo = Path(tempfile.mkdtemp())
        subprocess.run(["git", "init", "-q", str(self.repo)], check=True)
        (self.repo / "app").mkdir()

    def finding(self, tool, file):
        return {"tool": tool, "file": file}

    def test_keeps_changed_files_and_images_drops_untouched(self):
        res = [self.finding("trivy-fs", "Dockerfile"), self.finding("trivy-fs", "old/Dockerfile"),
               self.finding("trivy-image", "app:1 (debian 12)"), self.finding("hadolint", "")]
        kept = self.scan.only_changed(res, self.repo, ["Dockerfile"])
        self.assertEqual([f["file"] for f in kept], ["Dockerfile", "app:1 (debian 12)", ""])

    def test_subfolder_scan_matches_paths_from_git_top(self):
        res = [self.finding("trivy-fs", "Dockerfile")]
        self.assertEqual(len(self.scan.only_changed(res, self.repo / "app", ["app/Dockerfile"])), 1)
        self.assertEqual(len(self.scan.only_changed(res, self.repo / "app", ["Dockerfile"])), 0)


class AgentCountTests(unittest.TestCase):
    def test_stats_counts_every_shared_agent_but_the_readme(self):
        stats = load(ROOT / "setup/ai-os-stats.py", "stats").compute()
        files = [f for f in (ROOT / "ai-config/agents").glob("*.md") if f.name != "README.md"]
        self.assertEqual(stats["agents"], len(files))


class AgentNpxPinTests(unittest.TestCase):
    """Agents with Bash must not run whatever version of an npm package is current (2026-11-15 review)."""

    def test_every_npx_package_is_pinned(self):
        import re
        unpinned = []
        for f in (ROOT / "ai-config/agents").glob("*.md"):
            for pkg in re.findall(r"npx (?:-y|--yes) (\S+)", f.read_text(encoding="utf-8")):
                if "@" not in pkg.lstrip("@") or pkg.endswith("@latest"):
                    unpinned.append(f"{f.name}: {pkg}")
        self.assertEqual(unpinned, [])


if __name__ == "__main__":
    unittest.main()
