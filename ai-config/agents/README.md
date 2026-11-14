# Agents

Custom subagents that every CLI with file-based agents can call: Claude Code, Codex, Gemini CLI and opencode.
One Markdown file per agent here (shared) or in `context/personal/agents/` (yours, git-ignored; same name wins).
`setup/render-agents.py` writes each CLI's own format at install time and on `ai-os agents`; the format and the
per-CLI extras are documented at the top of that script.

| Agent | Use it for |
|---|---|
| `aios-reviewer` | reviewing an AI-OS change against the repo's own rules before a PR (read-only) |
| `docs-drift-checker` | finding docs that no longer match the code: commands, paths, counts, steps (read-only) |
| `docs-writer` | writing or fixing Markdown and MDX documents, checked before it finishes |
| `fresh-reviewer` | a cold review of a Spec, plan or proposal; give it only the document and repo paths (read-only) |
| `installer-tester` | running the installer in a throwaway HOME: idempotency, user files kept, real machine untouched |
| `root-cause-debugger` | proving why something fails and fixing it once, where every caller passes |
| `source-checker` | checking the URLs, versions, APIs and numbers in research output against primary sources (read-only) |
| `test-writer` | adding the missing tests, in the project's own style, editing test files only |
| `windows-porter` | porting a shell-script change to its PowerShell twin, and saying what is unverified without pwsh |

Invoke by name: "use the docs-writer agent to …" (Claude, Codex, opencode) or `@docs-writer …` (Gemini). Every CLI
also delegates on its own when the task matches the agent's `description`.
