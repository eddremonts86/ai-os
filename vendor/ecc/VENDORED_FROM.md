# Vendored From

This directory contains a **curated subset** of the **Everything Claude Code
(ECC)** plugin — only the files AI-OS actually links or runs. See `README.md`
for what each kept path is used by and how to vendor more.

## Source

| Field          | Value                                                                  |
| -------------- | ---------------------------------------------------------------------- |
| Repository     | https://github.com/affaan-m/ECC (also reachable as `affaan-m/everything-claude-code`) |
| Upstream       | https://ecc.tools                                                      |
| Plugin name    | `ecc`                                                                  |
| Version        | `2.0.0`                                                                |
| Upstream SHA   | **unknown** — the 2026-06-28 snapshot was copied without `.git` and no commit SHA was recorded (see ai-os commit `fe00d34bd`). `skills/contract-first/` was patched in later (2026-09-20, ai-os commit `7872bb788`) from a newer upstream, SHA also unrecorded. Record the SHA for any future vendoring. |
| License        | MIT (Copyright (c) 2026 Affaan Mustafa — see `./LICENSE`)              |
| Date vendored  | 2026-06-28 (full snapshot); collapsed to the used subset 2026-11-05    |

## History

- **2026-06-28** — full ECC v2.0.0 snapshot vendored (49 MB, ~3,240 files),
  minus `.git`, `.github`, `node_modules`, `.cache`, `dist`.
- **2026-09-20 (Phase 2)** — an evidence-backed `agent-sort` pass picked the
  DAILY bucket (16 skills, 3 agents, 2 commands — genuine gaps, not duplicates
  of the 14 superpowers or other vendored skills):
  - Skills: `DAILY_SKILLS.txt` is the single list; `setup/install-mac.sh` 7e
    symlinks each into every CLI, `setup/verify.sh` counts them.
  - Agents: `typescript-reviewer`, `vue-reviewer`, `build-error-resolver` →
    `~/.claude/agents/` (7f, Claude Code only).
  - Commands: `vue-review`, `build-fix` copied into `ai-config/commands/` and
    wrapped as `ai-config/skills/{vue-review,build-fix}/SKILL.md`.
- **2026-11-05** — local modifications (below), then the snapshot was
  **collapsed to what is used**: the 14 DAILY skills, 3 agents, 2 commands,
  the strategic-compact hook (`scripts/hooks/suggest-compact.js`) and its
  `require` closure (`scripts/lib/{utils,transcript-context,agent-data-home}.js`),
  plus `LICENSE`. Everything else (the other ~280 skills, 60+ agents, hooks,
  rules, plugin manifests, tests, docs) was removed with `git rm`; it remains
  in git history before this change and upstream. `setup/install-ecc.sh`
  (which linked every ECC skill and the whole tree as a Claude Code plugin)
  was removed with it — install-mac.sh 7e/7f already cover the subset.
  Paths of kept files are unchanged, so deployed symlinks keep resolving.

## Local modifications (2026-11-05)

- `skills/config-gc/` absorbed the former DAILY skills `skill-stocktake` and
  `context-budget` as modes (`references/skill-stocktake.md`,
  `references/context-budget.md`, `scripts/` copied from
  `skills/skill-stocktake/scripts/`). Both names were removed from
  `DAILY_SKILLS.txt` and their upstream directories were dropped in the
  collapse. DAILY is now 14 ECC skills.
- `skills/inherit-legacy-style/SKILL.md` description trimmed to <=350 chars.

## Notes on kept files

Some kept SKILL.md files describe ECC *plugin* hooks (`hooks/hooks.json`,
`scripts/hooks/gateguard-fact-force.js`, the `stop:cost-tracker` hook) that
are not vendored here — AI-OS does not install ECC as a plugin. Those skills
still work in their manual/standalone mode; vendor the hook from upstream if
you want the plugin behaviour.

## License obligations

ECC is MIT licensed. Keep `LICENSE` and the `Copyright (c) 2026 Affaan
Mustafa` line intact, and preserve upstream notices in modified files. ai-os
does not claim authorship of the vendored contents.
