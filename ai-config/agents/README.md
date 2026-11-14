# Agents

Custom subagents that every CLI with file-based agents can call: Claude Code, Codex, Gemini CLI and opencode.
One Markdown file per agent here (shared) or in `context/personal/agents/` (yours, git-ignored; same name wins).
`setup/render-agents.py` writes each CLI's own format at install time and on `ai-os agents`; the format and the
per-CLI extras are documented at the top of that script.

| Agent | Use it for |
|---|---|
| `a11y-auditor` | WCAG 2.2 AA audit in a real browser: axe plus keyboard, focus, names, contrast in states, reflow (read-only) |
| `aios-reviewer` | reviewing an AI-OS change against the repo's own rules before a PR (read-only) |
| `bundle-optimizer` | measuring the production bundle and cutting it: heavy or duplicated deps, missing splits, assets |
| `design-system-keeper` | UI code that bypasses the project's tokens or components: raw values, duplicates, theme breakage (read-only) |
| `docs-drift-checker` | finding docs that no longer match the code: commands, paths, counts, steps (read-only) |
| `docs-writer` | writing or fixing Markdown and MDX documents, checked before it finishes |
| `fresh-reviewer` | a cold review of a Spec, plan or proposal; give it only the document and repo paths (read-only) |
| `installer-tester` | running the installer in a throwaway HOME: idempotency, user files kept, real machine untouched |
| `perf-auditor` | Core Web Vitals, long tasks and load under throttling, with a budget for CI (read-only) |
| `rerender-hunter` | finding wasted React/Vue re-renders, tracing each to its cause, with before/after counts |
| `root-cause-debugger` | proving why something fails and fixing it once, where every caller passes |
| `security-reviewer` | a security review of a branch or PR: entry points, authorization, injection, data exposure, removed guards (read-only) |
| `source-checker` | checking the URLs, versions, APIs and numbers in research output against primary sources (read-only) |
| `stability-tester` | leaks over repeated use, bad-network behaviour, sustained load and flaky tests (read-only) |
| `supply-chain-vetter` | vetting a skill, MCP server, agent, package, Action or image before installing it, without running it |
| `test-writer` | adding the missing tests, in the project's own style, editing test files only |
| `threat-modeler` | threat-modelling a Spec or design before it is built: assets, actors, STRIDE per boundary, missing controls (read-only) |
| `ui-reviewer` | a cold design review of a screen or flow against its brief, with screenshot or file:line evidence (read-only) |
| `windows-porter` | porting a shell-script change to its PowerShell twin, and saying what is unverified without pwsh |

Invoke by name: "use the docs-writer agent to …" (Claude, Codex, opencode) or `@docs-writer …` (Gemini). Every CLI
also delegates on its own when the task matches the agent's `description`.
