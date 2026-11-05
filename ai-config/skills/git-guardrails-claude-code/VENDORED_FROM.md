# Vendored from mattpocock/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/mattpocock/skills |
| Upstream path | `skills/misc/git-guardrails-claude-code/` |
| Author | Matt Pocock (aihero.dev) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `c55ee46073ed923f86ce59a5eb3b6d895095d1b7` |
| Commit date | 2026-09-18 |
| Vendored | 2026-09-26 |

## What was NOT vendored

- The rest of the upstream repo (36 skills total) — only this one and 5 siblings
  (`wizard`, `codebase-design`, `improve-codebase-architecture`,
  `resolving-merge-conflicts`, `setup-pre-commit`) were picked, reviewed one by one
  against overlap with AI-OS's 14 required superpowers before vendoring. The rest
  (`tdd`, `diagnosing-bugs`, `code-review`, `writing-for-agents`, `to-spec`, `to-tickets`,
  `wayfinder`, ...) collide in intent with skills AI-OS already requires
  (`test-driven-development`, `systematic-debugging`, `code-review-and-quality`,
  `writing-skills`) or with AI-OS's own file-based Spec workflow
  (`workflows/project_start.md`), and installing them would add a second, competing
  trigger for the same task.

## Local modifications

None. `SKILL.md`, `scripts/block-dangerous-git.sh` and `agents/openai.yaml` are
byte-identical to the vendored commit.

## Why this one

Sets up a real Claude Code `PreToolUse` hook (not just a prompt) that blocks
`git push`, `git reset --hard`, `git clean -f(d)`, `git branch -D` and force-push
variants before they execute, reading `tool_input.command` via `jq` and exiting 2 to
block. Reviewed the script in full before vendoring: no network calls, no `eval`, a
fixed pattern blocklist. Complements, rather than replaces, this repo's own git safety
protocol in `CLAUDE.md` and the destructive-action confirmation rules already in effect
— this is an enforced backstop, not a substitute for judgment.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/mattpocock/skills /tmp/mp
diff -r /tmp/mp/skills/misc/git-guardrails-claude-code \
  ai-config/skills/git-guardrails-claude-code --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
