# Intent: ponytail global install + intent.md home
Author: Edd (ai-os) — Status: accepted
Date: 2026-09-02
Source: user request 2026-09-02 + video https://www.youtube.com/watch?v=LoMOPj-lO8U (Rob Shocks, AI-native SDLC)

## Problem

Every AI interaction on this machine (Claude Code, Codex, Hermes, Gemini/Antigravity, Cursor/Windsurf, OpenCode) currently runs without a shared minimality discipline, so agents over-build (date pickers, wrappers, extra deps). Separately, ideas still go through ad-hoc backlog entries and lose fidelity by the time they reach `specs/current_spec.md`. Setup must work identically on mac, linux and windows clones.

## Proposed outcome

- Every detected CLI runs Ponytail (`DietrichGebert/ponytail`, v4.9.0, MIT) at `full` by default, toggleable per-session (`/ponytail lite|full|ultra|off`), with `~/.config/ponytail/config.json` as the per-machine source of truth.
- `intent/` exists as the versioned intake for the AI-native SDLC loop (`intent.md → spec.md → plan.md → diff/tests → review → maintain → new intent.md`). `intent/intent-template.md` and `ai-config/skills/intent-to-spec/` are the mechanism; `specs/current_spec.md` remains the single active pointer.
- `setup/install-mac.sh` and `setup/install-windows.ps1` reproduce the state on a fresh clone; `setup/verify.sh` reports ponytail status.

## Affected users and systems

- `ai-os` repo: `ai-config/skills/`, `ai-config/manifest.yaml`, `setup/install-mac.sh`, `setup/install-windows.ps1`, `setup/verify.sh`, `setup/verify-windows.ps1`, `docs/repo-layout.md`, `CLAUDE.md` consumers (all CLIs).
- Local machine: `~/.claude/`, `~/.codex/`, `~/.gemini/`, `~/.agents/`, `~/.hermes/`, `~/.config/ponytail/`, `~/.ai-os/env.sh`.
- No production services, no Coolify deploys.

## Constraints

- Ponytail installs are idempotent and never fail the whole `install-*` run (fallback to `AGENTS.md` rules copy if marketplace/plugin is unreachable; `node` must be on non-interactive PATH for hooks — warn, don't abort).
- Verify checks for ponytail are optional (`opt_*`), never `REQ_FAIL` — a missing optional CLI must not mark the whole install as failed.
- Do not hardcode home paths in tracked files (`dev-env/dotfiles/zsh/.zshrc` guard stays intact); per-machine values go to `~/.ai-os/env.sh` or `~/.config/ponytail/config.json`.
- Default `full`, not `ultra`; `ultra` is opt-in.
- Freeze prior spec to `archive/2026-09-02-frozen-community-submissions.md` — not discarded.
- No auto-trigger `intent.md` → `spec.md` via cron/MCP in this slice.

## Open questions

- Do we pin `vendor/ponytail/` as a git subtree for offline/air-gapped installs, or rely solely on marketplace + `AGENTS.md` fallback? (owner: platform)
- Should `PONYTAIL_SUBAGENT_MATCHER` be set globally or only for `explore` agents? (owner: Edd)
