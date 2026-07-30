# ai-config/commands

Shared slash-command combos, distributed globally the same way as
`ai-config/skills/` (mirrors that flow per this file's original placeholder
note). Two distribution paths, both driven by these Markdown sources:

1. **Skills** (preferred, zero extra plumbing): each command also exists as a
   proper Agent Skill under `ai-config/skills/<name>/SKILL.md` — e.g. `action`,
   `full`, `gen-html`. Claude Code, Codex, Antigravity, Hermes, and this VS
   Code Copilot Chat session all auto-discover skills from `~/.agents/skills/`
   (or their own skills dir), where a skill IS a slash command
   (`/action`, `/full`, `/gen-html`). No separate wiring needed — it rides the
   existing skill-symlink step in `setup/install-{mac,windows}.*`.
2. **This directory** (`ai-config/commands/*.md`) exists for the two client
   types that don't consume Skills as literal `/name` commands:
   - **VS Code Copilot Chat's global prompts folder** — copied verbatim as
     `<name>.prompt.md` (same frontmatter + body format).
   - **Gemini CLI custom commands** — TOML-only
     (see https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html),
     generated from these Markdown sources (frontmatter `description` → TOML
     `description`, body → TOML `prompt`).

Both distribution steps run in `setup/install-windows.ps1` (step 5d). Add the
same step to `setup/install-mac.sh` when maintaining Mac parity.

When adding a new global command:

1. Add `ai-config/commands/<name>.md` (frontmatter: `description`).
2. Add the matching `ai-config/skills/<name>/SKILL.md` so Claude
   Code/Codex/Antigravity/Hermes/VS Code (via `~/.agents/skills/`) get it too.
3. Re-run the installer to propagate everywhere.
