# ECC Integration

[Everything Claude Code (ECC)](https://github.com/affaan-m/ECC) is a large,
MIT-licensed library of Claude Code skills, agents, commands and hooks. AI-OS
does **not** install it as a plugin or vendor the whole tree. It vendors only
the curated subset it actually uses, at `vendor/ecc/`.

## What is vendored

| Path under `vendor/ecc/` | What | Wired by |
| ------------------------ | ---- | -------- |
| `skills/<name>/` — the 14 names in `DAILY_SKILLS.txt` | continuous-learning-v2, security-scan, gateguard, codebase-onboarding, architecture-decision-records, contract-first, inherit-legacy-style, ai-first-engineering, ai-regression-testing, config-gc, cost-tracking, skill-comply, skill-scout, rules-distill | `setup/install-mac.sh` step 7e → every CLI's skill dir |
| `agents/{typescript-reviewer,vue-reviewer,build-error-resolver}.md` | Claude Code subagents | step 7f → `~/.claude/agents/` |
| `commands/{vue-review,build-fix}.md` | upstream originals | copied into `ai-config/commands/`, wrapped as `ai-config/skills/{vue-review,build-fix}` |
| `scripts/hooks/suggest-compact.js` + `scripts/lib/*.js` | strategic-compact PreToolUse hook | step 9e via `setup/wire-compact-hook.mjs` (Windows: `install-windows.ps1`) |
| `LICENSE`, `VENDORED_FROM.md`, `README.md` | license, provenance, re-vendoring how-to | — |

The subset was chosen by an evidence-backed `agent-sort` pass (2026-09-20) —
genuine gaps, not duplicates of the 14 superpowers or other vendored skills —
and the rest of the snapshot was removed on 2026-11-05. Full history and local
modifications (e.g. `config-gc` absorbing `skill-stocktake` and
`context-budget`) are in [`vendor/ecc/VENDORED_FROM.md`](../vendor/ecc/VENDORED_FROM.md).

## Install and verify

There is no separate ECC installer. `bash setup/install-mac.sh` links everything
(idempotent; it also prunes ECC skill symlinks whose target is gone), and
`bash setup/verify.sh` checks it: the DAILY skills are part of each client's
expected skill set (section 4) and the three agents are section 5d.

CI (`.github/workflows/reusable-test.yml`, `test-windows.yml`) runs a
required "Verify curated ECC subset" step: every DAILY skill has a `SKILL.md`
with frontmatter, the agents, commands and hook exist, and the hook's
`require` closure loads.

## Adding or refreshing an ECC skill

See [`vendor/ecc/README.md`](../vendor/ecc/README.md): copy the directory from
an upstream clone, add the name to `DAILY_SKILLS.txt` (agents: the
`ECC_DAILY_AGENTS` arrays in `install-mac.sh` and `verify.sh`), make sure it
has no dependency outside its own directory, and record the upstream SHA in
`VENDORED_FROM.md`.

## Not vendored

ECC's plugin manifest and `hooks/hooks.json` (quality-gate, gateguard,
cost-tracker, observe hooks, …) are not vendored, so a few kept SKILL.md files
mention hooks that are absent here. Those skills run in their manual /
standalone mode. Vendor the specific hook script (and its `require` closure)
if you need it.
