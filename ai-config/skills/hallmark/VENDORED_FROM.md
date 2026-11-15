# Vendored from nutlope/hallmark

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 7 links it into every CLI.

| Field | Value |
|---|---|
| Upstream | https://github.com/nutlope/hallmark |
| Author | Together AI (Hassan El Mghari) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Version | 2.0.0 |
| Commit | `04977e15f3dfd6ee4b74c887dac3eb52665d6c92` (2026-11-11) |
| Vendored | 2026-11-15 |
| Vendored subtree | upstream `skills/hallmark/` only |
| Upstream subtree hash | `17e101d9cfdbf3f8f22e6ba3cbcee5e527126ebfcdbd1b03484d7ccc5e56964a` (sha256 of the sorted per-file sha256 list, before the edits below) |

Vetted 2026-11-15 by reading the source (supply-chain-vetter): no prompt injection, exfiltration, obfuscation or
remote code. Scripts use only `node:*` builtins. Network: `api.together.xyz` (imagegen, with `TOGETHER_API_KEY`),
`upload.wikimedia.org` (`photos --save`), localhost (capture). Verdict: install with limits.

## What was NOT vendored

- `scripts/install.mjs`: copies the skill into `~/.claude/skills`, `~/.agents/skills` and opencode's folder after
  deleting what is there, which would replace AI-OS's symlinks. AI-OS links the skill itself.
- `scripts/install-hook.mjs`, `scripts/lint-hook.mjs`: write a PostToolUse hook into `~/.claude/settings.json`
  (or the project's). The hook is benign, but AI-OS does not register hooks from third-party skills.
- `scripts/picture.mjs`: a maintainer tool that writes theme pictures into the skill's own folder (the AI-OS repo).
- Upstream `site/`, `eval/`, `docs/`, `.github/`, `.claude-plugin/`.

## Local modifications

1. `SKILL.md` `description`: explicit invocation only (the user names Hallmark). Upstream also triggered on any
   "build or design something new", which collides with `/aios-ui-design` and the rule to compose from proven
   pieces (`rules/always_do.md` § UI).
2. `SKILL.md`: an "AI-OS limits" block under the title (no installer or hook, never `theme.mjs index`, image
   generation only on request even when `TOGETHER_API_KEY` is set, never install or start a project outside the
   current one without asking, say when the page loads third-party fonts or photos).
3. `agents/openai.yaml`: `allow_implicit_invocation: false` (Codex).

## How AI-OS uses it

- `/hallmark <prompt>`, `/hallmark redesign <path>`, `/hallmark audit <path>` when the user names it.
- `ai-config/skills/aios-ui-verify/scripts/antislop.py` runs its `sloplint.mjs` statically on any project, without
  the Hallmark-only gates, as an advisory check of `/aios-ui-verify`.

## Updating

Download the new commit's `skills/hallmark/`, diff it against this folder, re-apply the three edits, delete the
four scripts again, update the table, re-run `setup/tests/test_antislop.py`, and re-vet changed scripts.
