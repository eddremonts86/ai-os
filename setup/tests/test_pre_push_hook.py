"""The pre-push hook must not leak git's hook environment into the checks it runs.

2026-11-23: a push from a linked worktree ran the hook with GIT_DIR exported. The test suites it starts
create throwaway repos (`git init`, `git config user.*`); with GIT_DIR set those commands rewrote the
shared .git/config instead (core.bare = true, a fake user), breaking every worktree of the clone.
"""
import os
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

HOOKS = Path(__file__).resolve().parent.parent / "hooks"
PROBE = """import os, subprocess, tempfile, unittest
class Probe(unittest.TestCase):
    def test_probe(self):
        open(os.environ["PROBE_OUT"], "w").write(os.environ.get("GIT_DIR", ""))
        repo = tempfile.mkdtemp()  # what the real suites do
        subprocess.run(["git", "-C", repo, "init", "-q"], check=True)
        subprocess.run(["git", "-C", repo, "config", "user.name", "leaked"], check=True)
"""


@unittest.skipIf(os.name == "nt" or not shutil.which("bash"), "the hook is a bash script")
class PrePushEnvTests(unittest.TestCase):
    def test_push_from_linked_worktree_does_not_touch_the_shared_config(self):
        tmp = Path(tempfile.mkdtemp())
        env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}
        env.update(HOME=str(tmp / "home"), PROBE_OUT=str(tmp / "probe.out"), GIT_CONFIG_GLOBAL=os.devnull)
        (tmp / "home").mkdir()

        def git(cwd, *a, check=True):
            return subprocess.run(["git", "-C", str(cwd), *a], env=env, check=check, capture_output=True, text=True)

        main, wt = tmp / "main", tmp / "wt"
        subprocess.run(["git", "init", "-q", "--bare", str(tmp / "remote.git")], env=env, check=True)
        subprocess.run(["git", "init", "-q", str(main)], env=env, check=True)
        git(main, "config", "user.email", "a@example.com"); git(main, "config", "user.name", "a")
        (main / "setup" / "tests").mkdir(parents=True)
        (main / "setup" / "tests" / "test_probe.py").write_text(PROBE, encoding="utf-8")
        git(main, "add", "."); git(main, "commit", "-qm", "probe")
        git(main, "remote", "add", "origin", str(tmp / "remote.git"))
        git(main, "worktree", "add", "-q", str(wt), "-b", "feat")
        git(main, "config", "core.hooksPath", str(HOOKS))

        # The hook fails here (this sandbox has none of the repo's files); only its environment matters.
        git(wt, "push", "origin", "feat", check=False)

        self.assertTrue((tmp / "probe.out").exists(), "the hook did not reach the unit-test step")
        self.assertEqual((tmp / "probe.out").read_text(), "", "GIT_DIR leaked into the checks")
        config = (main / ".git" / "config").read_text()
        self.assertNotIn("bare = true", config)
        self.assertNotIn("leaked", config)
        shutil.rmtree(tmp, ignore_errors=True)


if __name__ == "__main__":
    unittest.main()
