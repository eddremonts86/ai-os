# Local Skills

Skills specific to this AI-OS. **Not global** — they live here because they apply only to the `~/Projects/ai-os/` context.

## Difference with global skills

| Type | Path | Purpose |
|---|---|---|
| **Global** | `~/.claude/skills/<name>/` | Skills available to any project (99 in AI-OS). |
| **Local** | `~/Projects/ai-os/skills/<name>/` | Skills specific to AI-OS (this directory). |
| **Workspace** | `<project>/.agents/skills/<name>/` | Project-specific skills, not propagated. |

## When to create a local skill

When you find a recurring workflow that **only** applies to AI-OS. Examples:

- Creating a new Spec following the template.
- Archiving completed Specs.
- Generating MCP config.
- validating that setup scripts work.

## When to create a global skill instead

When the workflow applies to:

- Any coding project (use `workflows/coding.md` patterns).
- Multiple CLIs (Claude Code, Hermes, Codex, etc.).
- Debugging, testing, reviewing, deploying.

Put global skills in `~/.claude/skills/<name>/` (or use `setup/install-mac.sh` which symlinks from `ai-config/skills/`).

## Local skill template

Use `skill_template.md` as the base. Include:

- Frontmatter with `name:` and `description:`.
- "When to Use" section (triggers).
- "When NOT to Use" section (anti-patterns).
- Concrete steps with code.
- 1-2 examples.
- Pitfalls section.
- Verification section.

## Conventions

- Skill names in kebab-case (`brainstorming`, `wave-template-conventions`).
- Frontmatter in YAML.
- Sections in H2 (`##`).
- Code examples in fenced blocks with language (`bash`, `python`, etc.).
- Links to other skills or docs.
