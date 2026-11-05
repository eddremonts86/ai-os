# CLI reference

Reference material moved out of `CLAUDE.md` (formerly its §12 "Commands quick reference",
§13 "How to invoke from each CLI" and §15 "AI-OS as orchestrator"). The behavioural rules
stay in `CLAUDE.md` and `rules/`; this file is lookup only.

## Commands quick reference

```bash
# Set once per shell; override it when the repository lives elsewhere.
export AI_OS_ROOT="${AI_OS_ROOT:-$HOME/Projects/ai-os}"

# Start session with AI-OS
hermes chat --skills ai-os-quickstart

# Or in any CLI
cat "$AI_OS_ROOT/CLAUDE.md"
# → paste at the start of the conversation

# Verify
bash "$AI_OS_ROOT/setup/verify.sh"

# Create new Spec (only when one is required — see CLAUDE.md "Method")
$EDITOR "$AI_OS_ROOT/specs/current_spec.md"

# Archive completed Spec
mv "$AI_OS_ROOT/specs/current_spec.md" "$AI_OS_ROOT/archive/$(date +%Y-%m-%d)-slug.md"
```

## How to invoke from each CLI

### Claude Code

```bash
# Auto-loads from ~/.claude/skills/
# Manual: paste CLAUDE.md content at the start of the conversation
```

### Hermes

```bash
hermes chat --skills ai-os-karpathy
hermes chat --skills ai-os-quickstart
# or
hermes chat   # skills already loaded from imported:
```

### Codex / Gemini / Antigravity

```bash
# Auto-loads from ~/.codex/skills/, ~/.gemini/skills/, ~/.agents/skills/
```

Codex and Antigravity read `AGENTS.md`, which is a symlink to `CLAUDE.md` (see
[`repo-layout.md`](repo-layout.md) "Traps").

## AI-OS as orchestrator

AI-OS is the single source of truth for the AI setup:

- **Skills** → `ai-config/skills/` (source of truth) → symlinks to supported CLIs.
- **MCP servers** → `ai-config/mcp/*.yaml` → generated to `~/.hermes/config.yaml`.
- **Dotfiles** → `dev-env/dotfiles/` → symlinks to `~/`.
- **Setup scripts** → `setup/install-{mac,windows}.sh/ps1` (1-command per OS).
- **CI** → `.github/workflows/test-{mac,linux,windows}.yml` validates that setup scripts work.

To replicate on another Mac: `git clone + bash setup/install-mac.sh`. To replicate on Windows:
`git clone + powershell -File setup/install-windows.ps1`.

## Per-machine bridge

`setup/install-mac.sh` and `setup/install-windows.ps1` render
`ai-config/templates/global-bridge.md.tmpl` into a per-machine adapter
(`~/.ai-os/adapters/global-bridge.md`, with the discovered AI-OS root substituted — no
committed user path) and symlink each CLI's global instruction file to it.
