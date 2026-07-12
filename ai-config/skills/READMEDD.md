# Installed Global Skills

This directory is the source of truth for AI-OS global skills. Setup scripts
symlink flat skills from here into the supported CLI skill directories.

## Current Model

- Flat skills are directories with a top-level `SKILL.md`.
- Nested plugin bundles are directories with skills under `skills/<name>/SKILL.md`.
- `setup/install-mac.sh` propagates flat skills to the Mac CLI targets.
- Plugin bundles with nested layouts are installed by their own scripts, such as
  `setup/install-claude-tools.sh` and `setup/install-ecc.sh`.

## Supported CLI Targets

- `~/.claude/skills/` — Claude Code
- `~/.codex/skills/` — Codex
- `~/.gemini/skills/` — Gemini CLI
- `~/.agents/skills/` — Antigravity workspace-scoped path / shared by several other agents
- `~/.gemini/config/skills/` — Antigravity's real GLOBAL (all-workspaces) path per
  https://antigravity.google/docs/skills (confirmed 2026-07-12); optional/
  best-effort, additive to `~/.agents/skills/` above
- `~/.minimax/skills/` — MiniMax Code on Mac
- Hermes reads `~/.agents/skills/` natively via `skills.external_dirs` in
  `~/.hermes/config.yaml` — no symlinked copy (previously
  `~/.hermes/skills/imported/`, removed; see P1-2 in the 2026-07-12 audit).

Windows currently supports the five symlinked targets plus Hermes's
`skills.external_dirs`, and does not wire MiniMax by default.

## Count Skills

```bash
find ai-config/skills -maxdepth 2 -name SKILL.md \
  -path "*/ai-config/skills/*/SKILL.md" | wc -l
```

```bash
find ai-config/skills -mindepth 3 -name SKILL.md | wc -l
```

Use these commands instead of hardcoding counts in documentation.

## Required Process Skills

AI-OS requires the 14 superpowers process skills checked by
`setup/verify.sh`. The setup script installs missing ones from
`obra/superpowers` when needed.

## Adding A Global Skill

1. Add `ai-config/skills/<name>/SKILL.md`.
2. Include frontmatter with `name:` and `description:`.
3. Keep all file content in English.
4. Run `DRY_RUN=1 bash setup/install-mac.sh`.
5. Run `bash setup/verify.sh`.

## Hermes Note

Hermes may need `/reload-skills` or a gateway restart after new symlinks are
created. This is a resolver refresh issue; the symlinks can still be correct.
