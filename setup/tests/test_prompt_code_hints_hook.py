"""setup/hooks/claude-prompt-code-hints.py hands at most three code locations to a prompt, and never blocks one."""

import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SETUP = Path(__file__).resolve().parents[1]
HOOK = SETUP / "hooks" / "claude-prompt-code-hints.py"
WIRE = SETUP / "wire-memory-hook.py"

# A stand-in for grepai: logs its argv, answers with duplicates, a lockfile and five real files.
FAKE_GREPAI = """#!/bin/sh
echo "$@" > "$GREPAI_ARGS"
cat <<'J'
[{"file_path":"src/App.tsx","start_line":1,"end_line":40},
 {"file_path":"src/App.tsx","start_line":60,"end_line":80},
 {"file_path":"pnpm-lock.yaml","start_line":1,"end_line":9},
 {"file_path":"src/sections.tsx","start_line":300,"end_line":340},
 {"file_path":"src/index.css","start_line":1,"end_line":20},
 {"file_path":"src/extra.ts","start_line":1,"end_line":2}]
J
"""


@unittest.skipIf(os.name == "nt", "the grepai stand-in is a shell script")
class PromptCodeHintsHookTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        t = Path(self.tmp.name)
        self.repo, self.bin, self.args = t / "repo", t / "bin", t / "args"
        (self.repo / ".grepai").mkdir(parents=True)
        (self.repo / "src").mkdir()
        subprocess.run(["git", "init", "-q", str(self.repo)], check=True)
        self.bin.mkdir()
        (self.bin / "grepai").write_text(FAKE_GREPAI)
        (self.bin / "grepai").chmod(0o755)

    def tearDown(self):
        self.tmp.cleanup()

    def run_hook(self, event, **env):
        env = {**os.environ, "PATH": f"{self.bin}{os.pathsep}{os.environ['PATH']}", "GREPAI_ARGS": str(self.args), **env}
        stdin = event if isinstance(event, str) else json.dumps(event)
        return subprocess.run([sys.executable, str(HOOK)], input=stdin, capture_output=True, text=True, timeout=30, env=env)

    def test_three_unique_files_without_lockfiles(self):
        p = self.run_hook({"prompt": "change the hero headline on the landing page", "cwd": str(self.repo)})
        ctx = json.loads(p.stdout)["hookSpecificOutput"]
        self.assertEqual(ctx["hookEventName"], "UserPromptSubmit")
        hints = [line for line in ctx["additionalContext"].splitlines() if line.startswith("- ")]
        self.assertEqual(hints, ["- src/App.tsx:1-40", "- src/sections.tsx:300-340", "- src/index.css:1-20"])

    def test_subfolder_scopes_the_search(self):
        self.run_hook({"prompt": "change the hero headline on the landing page", "cwd": str(self.repo / "src")})
        self.assertIn("--path src", self.args.read_text())

    def test_repo_root_does_not_scope(self):
        self.run_hook({"prompt": "change the hero headline on the landing page", "cwd": str(self.repo)})
        self.assertNotIn("--path", self.args.read_text())

    def test_silent_cases(self):
        cases = {
            "garbage input": ("not json", {}),
            "short prompt": ({"prompt": "go", "cwd": str(self.repo)}, {}),
            "slash command": ({"prompt": "/aios-code fix the hero headline please", "cwd": str(self.repo)}, {}),
            "harness notification": ({"prompt": "<task-notification> agent finished the hero headline", "cwd": str(self.repo)}, {}),
            "system note": ({"prompt": "[SYSTEM NOTIFICATION - NOT USER INPUT] the hero headline task", "cwd": str(self.repo)}, {}),
            "switched off": ({"prompt": "change the hero headline on the landing page", "cwd": str(self.repo)},
                             {"AIOS_CODE_HINTS": "0"}),
            "no git repo": ({"prompt": "change the hero headline on the landing page", "cwd": tempfile.gettempdir()}, {}),
        }
        for name, (event, env) in cases.items():
            with self.subTest(name):
                p = self.run_hook(event, **env)
                self.assertEqual((p.returncode, p.stdout), (0, ""))

    def test_repo_without_index_is_silent(self):
        (self.repo / ".grepai").rmdir()
        p = self.run_hook({"prompt": "change the hero headline on the landing page", "cwd": str(self.repo)})
        self.assertEqual((p.returncode, p.stdout), (0, ""))


class WireMemoryHooksTests(unittest.TestCase):
    def test_wires_both_hooks_idempotently_and_keeps_other_settings(self):
        with tempfile.TemporaryDirectory() as home:
            settings = Path(home) / ".claude" / "settings.json"
            settings.parent.mkdir()
            settings.write_text(json.dumps({"model": "x", "hooks": {"UserPromptSubmit": [
                {"hooks": [{"type": "command", "command": "other"}]}]}}))
            env = {**os.environ, "HOME": home, "USERPROFILE": home}
            wire = lambda *a: subprocess.run([sys.executable, str(WIRE), *a], capture_output=True, text=True, env=env)
            self.assertEqual(wire("--check").returncode, 1)
            self.assertEqual(wire().returncode, 0)
            self.assertEqual(wire("--check").returncode, 0)
            wire()
            data = json.loads(settings.read_text())
            self.assertEqual(data["model"], "x")
            prompt_cmds = [h["command"] for g in data["hooks"]["UserPromptSubmit"] for h in g["hooks"]]
            self.assertEqual(sum("claude-prompt-code-hints.py" in c for c in prompt_cmds), 1)
            self.assertIn("other", prompt_cmds)
            self.assertEqual(len(data["hooks"]["SessionStart"]), 1)


if __name__ == "__main__":
    unittest.main()
