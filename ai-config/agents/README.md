# Agents

Custom subagents that every CLI with file-based agents can call: Claude Code, Codex, Gemini CLI and opencode.
One Markdown file per agent here (shared) or in `context/personal/agents/` (yours, git-ignored; same name wins).
`setup/render-agents.py` writes each CLI's own format at install time and on `ai-os agents`; the format and the
per-CLI extras are documented at the top of that script.

| Agent | Use it for |
|---|---|
| `docs-writer` | writing or fixing Markdown and MDX documents, checked before it finishes |

Invoke by name: "use the docs-writer agent to …" (Claude, Codex, opencode) or `@docs-writer …` (Gemini). Every CLI
also delegates on its own when the task matches the agent's `description`.
