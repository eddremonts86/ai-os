# workspace-skills

Skills kept in the AI-OS repo but **not** linked into any CLI's global skill
directory — the installer only globs `ai-config/skills/*`. They describe one
specific codebase, so loading them in every session cost context and stole
triggers from the general skills.

To use one, copy (or symlink) it into that project's `.agents/skills/`.

| Skill | For | Why it is here and not in the project |
|---|---|---|
| `hermes-mcp-pattern` | contributing to NousResearch/hermes-agent | `~/.hermes/hermes-agent` is an upstream clone, not a repo we own |

Moved out of the global set on 2026-11-05 straight into their projects'
`.agents/skills/` (iaWorkSpace, plansmith and others).
