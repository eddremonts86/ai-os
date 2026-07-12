---
name: ai-os-karpathy
description: AI Operating System local of Edd based on the "Spec + Verifier + Environment" method from Andrej Karpathy. Loads persistent context (profile, projects, preferences, tools, sources), 99 global skills, MCP servers, and rules for daily work with any AI CLI. Use when starting any AI session in Claude Code, Hermes, Codex, Gemini, or Antigravity.
license: MIT
metadata:
  hermes:
    tags: [meta, context, orchestration]
---

# AI-OS (Karpathy Method)

Personal AI work system. Local, versioned, replicable.

## What it provides

- **18 master instructions** in `CLAUDE.md` (method, workflows, prohibitions).
- **6 context files** (`context/`): profile, business/work, projects, preferences, tools, sources.
- **3 rules files** (`rules/`): always_do, ask_before_doing, never_do.
- **3 verifiers** (`verifiers/`): quality_checklist, critic_prompt, source_check_prompt.
- **5 workflows** (`workflows/`): daily_start, project_start, coding, research, content_creation.
- **99 global skills** distributed to 5 CLIs.
- **14 superpowers skills (REQUIRED)** integrated into the workflows.
- **10 declarative MCP servers** generated automatically (9 enabled; graphiti is disabled pending a smoke test).

## When to load

- **Start of any session** in Claude Code, Hermes, Codex, Gemini, or Antigravity.
- **When you want to apply the Karpathy method** (Spec + Verifier + Environment) to a task.
- **When switching projects** and need to reload the context.

## How to load

### In Hermes (recommended)

```bash
hermes chat --skills ai-os-karpathy
```

Or paste at the start of the conversation:

> Load and apply `~/Projects/ai-os/CLAUDE.md`. Read `context/`, `rules/`, and `specs/current_spec.md` before responding.

### In Claude Code

```bash
# Auto-loads from ~/.claude/skills/ai-os-karpathy/
# Or explicit:
/skill ai-os-karpathy
```

### In Codex / Gemini / Antigravity

Auto-loads from `~/.codex/skills/`, `~/.gemini/skills/`, `~/.agents/skills/`.

## What it does

1. **Reads `CLAUDE.md`** for the master instructions.
2. **Loads `context/`** for who I am, my projects, my preferences, my tools.
3. **Loads `rules/`** to know what to always do, what to ask before doing, what to never do.
4. **Checks `specs/current_spec.md`** to see if there's an active Spec.
5. **Loads `workflows/`** appropriate for the current task.
6. **Triggers the right superpowers skill** for the phase of the work (brainstorming, writing-plans, verification-before-completion, etc.).

## When to NOT use

- ❌ On a Mac without the 14 superpowers skills installed. The workflows will fail silently.
- ❌ Without running `bash setup/verify.sh` first. If you don't know the state, don't assume.
- ❌ As a replacement for `ai-os-quickstart`. `ai-os-quickstart` is for bootstrapping, `ai-os-karpathy` is for daily work.

## Dependencies (REQUIRED)

| Dependency | Why |
|---|---|
| 14 superpowers skills | The workflows explicitly invoke them via `Load skill` syntax. |
| Bash + Python 3.11 | To run setup scripts and MCP generator. |
| yq | To validate MCP config in `verify.sh`. |
| git | To commit and archive Specs. |

If any dependency fails, run `bash setup/verify.sh` to diagnose.

## Daily workflow (loaded after this skill)

```
1. → Load skill `workflows/daily_start.md` (AI-OS)
2. → Load skill `using-superpowers` (router)
3. Check `specs/current_spec.md`
4. If new task → → Load skill `workflows/project_start.md`
5. If existing Spec → execute block by block
6. At the end → → Load skill `verification-before-completion`
7. Archive the Spec
```

## How it integrates with superpowers

| AI-OS workflow | Superpowers skill loaded |
|---|---|
| `daily_start` | `using-superpowers` (router) |
| `project_start` | `brainstorming`, `writing-plans`, `executing-plans`, `verification-before-completion` |
| `coding` | `test-driven-development`, `systematic-debugging`, `code-review-and-quality`, `verification-before-completion`, `using-git-worktrees`, `finishing-a-development-branch` |
| `research` | `verification-before-completion`, `code-review-and-quality` |
| `content_creation` | `documentation-and-adrs`, `code-review-and-quality` |

## How it integrates with sub-agents (parallel dispatch)

**Default for any task with 2+ independent workstreams: dispatch sub-agents in parallel.**

`delegate_task(tasks=[...])` is the standard tool. Max 3 concurrent sub-agents per user. Each subagent gets isolated context and returns a final summary.

Concrete patterns where AI-OS workflows dispatch in parallel:

- **`daily_start`** in parallel with research on the user's domain.
- **`project_start`**: brainstorm + gather-context + scan-similar-projects in 3 parallel sub-agents.
- **`coding`**: implement block 1 (sub-agent 1) + implement block 2 (sub-agent 2) + verify (sub-agent 3).
- **`research`**: research topic A (sub-agent 1) + research topic B (sub-agent 2) + summarize (sub-agent 3).
- **`content_creation`**: write draft (sub-agent 1) + verify URLs (sub-agent 2) + cross-platform check (sub-agent 3).

**Threshold rule:** if you can break the task into 2+ independent workstreams, dispatching is **mandatory**. Sequential is the exception that requires justification.

Full details: `rules/always_do.md` section "ALWAYS: use sub-agents in parallel when possible".

## Output

After loading this skill, the AI should have:

- Loaded CLAUDE.md + context/ + rules/ + workflows/.
- checked specs/current_spec.md.
- ready to execute the next step.

## Verification

```bash
bash ~/Projects/ai-os/setup/verify.sh
```

If it shows "Pasados: 14, Fallados: 0", AI-OS is functional.

## Pitfalls

- ❌ Don't load `ai-os-karpathy` without the 14 superpowers installed. The workflows will silently degrade.
- ❌ Don't skip the context load. Forgetting preferences = generic AI behavior.
- ❌ Don't run this in a project that doesn't have AI-OS. The paths won't exist.

## Related

- `ai-os-quickstart` (bootstrap, 1-line) — for initial setup.
- `using-superpowers` (router) — loaded automatically after this skill.
- `workflows/daily_start.md` — the actual workflow loaded after this skill.
- `setup/verify.sh` — to validate the AI-OS state.
