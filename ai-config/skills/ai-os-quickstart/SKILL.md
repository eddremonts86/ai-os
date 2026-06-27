---
name: ai-os-quickstart
description: 1-line bootstrap of Edd's AI Operating System in any CLI (Claude Code, Hermes, Codex, Gemini, Antigravity). Verifies the 14 superpowers skills are installed, runs the setup, and confirms the environment is ready. Use when onboarding a new dev or Mac, or when verifying AI-OS is functional.
license: MIT
metadata:
  hermes:
    tags: [setup, bootstrap, onboarding]
---

# AI-OS Quickstart

1-line bootstrap of the AI Operating System in any CLI.

## When to use

- Onboarding a new dev to AI-OS.
- Verifying AI-OS state after installation.
- Initial setup on a new Mac (assumes `git clone` was already done).
- Troubleshooting when AI-OS workflows are failing.

## When NOT to use

- If you haven't cloned the repo yet. Run `git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os` first.
- If you want to modify AI-OS internals. This skill is read-only verification + setup.
- In a project that doesn't have AI-OS. The paths won't exist.

## What it does

1. **Verifies** that the AI-OS repo exists at `~/Projects/ai-os/`.
2. **Verifies** that the 14 superpowers skills are installed.
3. **Loads** the master instructions (`CLAUDE.md`).
4. **Loads** the context (`context/`).
5. **Loads** the rules (`rules/`).
6. **Checks** if there's an active Spec (`specs/current_spec.md`).
7. **Checks** the environment (zsh, git, gh, yq).
8. **Reports** status with concrete next steps.

## How to invoke

### In Hermes

```bash
hermes chat --skills ai-os-quickstart
```

### In Claude Code

```bash
/skill ai-os-quickstart
```

### In any CLI

Paste at the start of the conversation:

> Run the AI-OS quickstart verification. Confirm that 14 superpowers skills are installed, AI-OS repo exists, and environment is ready.

## Steps

### 1. Verify AI-OS exists

```bash
[ -f ~/Projects/ai-os/CLAUDE.md ] && echo "✅ AI-OS installed" || echo "❌ AI-OS missing — clone: git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os"
```

If missing → STOP. The user must clone the repo first.

### 2. Verify 14 superpowers skills

```bash
EXPECTED=14
ACTUAL=0
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  [ -d "$HOME/.claude/skills/$skill" ] && ACTUAL=$((ACTUAL + 1))
done
[ "$ACTUAL" -eq "$EXPECTED" ] && echo "✅ $ACTUAL/$EXPECTED superpowers skills" || echo "❌ Only $ACTUAL/$EXPECTED — install: gh repo clone obra/superpowers /tmp/sp -- --depth=1 && cp -r /tmp/sp/skills/* ~/.claude/skills/ && rm -rf /tmp/sp"
```

If < 14 → provide the install command.

### 3. Load AI-OS context

Read (do not execute, only read for context):

- `~/Projects/ai-os/CLAUDE.md` (master instructions).
- `~/Projects/ai-os/context/` (who I am, my projects, my preferences).
- `~/Projects/ai-os/rules/never_do.md` (absolute prohibitions).

### 4. Load skill `ai-os-karpathy` (mandatory after quickstart)

This skill loads the daily workflow. Without it, AI-OS is not active.

### 5. Verify environment

```bash
command -v zsh >/dev/null && echo "✅ zsh" || echo "❌ zsh missing"
command -v git >/dev/null && echo "✅ git" || echo "❌ git missing"
command -v gh >/dev/null && echo "✅ gh" || echo "❌ gh missing (brew install gh)"
command -v yq >/dev/null && echo "✅ yq" || echo "❌ yq missing (brew install yq)"
```

### 6. Verify Spec status

```bash
[ -s ~/Projects/ai-os/specs/current_spec.md ] && echo "✅ Active Spec" || echo "ℹ️ No active Spec"
```

### 7. Check skills in 5 CLIs

```bash
for cli_dir in ~/.claude/skills ~/.codex/skills ~/.gemini/skills ~/.agents/skills ~/.hermes/skills/imported; do
  count=$(find -L "$cli_dir" -maxdepth 1 -mindepth 1 ! -name "READMEDD.md" ! -name "taste-skill-llms.txt" 2>/dev/null | wc -l | tr -d ' ')
  echo "  $cli_dir: $count skills"
done
```

All should show 99 skills.

### 8. Final report

```markdown
## AI-OS Status

✅ AI-OS installed at ~/Projects/ai-os/
✅ 14/14 superpowers skills
✅ Context loaded (CLAUDE.md + context/ + rules/)
✅ 99 skills in 5 CLIs
✅ Environment: zsh, git, gh, yq
[ℹ️/✅] Spec: [active/no active]

## Next step

[If no Spec]: "What task are we working on today?"
[If active Spec]: Continue executing block [N].
```

## Examples

### Example 1: New dev onboarding

**Context:** First time using AI-OS on a new Mac.

**Output:** All checks pass, environment is ready, user is asked for the first task.

### Example 2: Verifying after Mac update

**Context:** macOS update broke some symlinks.

**Output:** Some checks fail, the skill reports exactly which symlinks are broken and provides the fix command.

### Example 3: Quickstart in existing project

**Context:** User starts a session in `~/Projects/wave-template`.

**Output:** Loads the AI-OS context, but does NOT modify the project. The AI is now ready to apply the AI-OS method to work on the project.

## Pitfalls

- ❌ **Don't skip the prerequisites check.** Without the 14 superpowers, workflows silently degrade (TDD without TDD, code-review without code-review).
- ❌ **Don't invent paths.** If `~/Projects/ai-os/CLAUDE.md` doesn't exist, **fail** (don't assume).
- ❌ **Don't execute the setup script automatically.** The setup is heavy (brew, npm). The user must explicitly approve it.
- ❌ **Don't modify the AI-OS repo.** This skill is read-only verification.

## Anti-patterns

- Loading `ai-os-quickstart` on a Mac without `~/Projects/ai-os/` (path missing).
- assuming the user wants to install when they only want to verify.
- loading `ai-os-karpathy` without first verifying with `ai-os-quickstart`.

## Output

After running this skill, the agent should have:

- verified the AI-OS state.
- loaded the context.
- loaded `ai-os-karpathy` for daily work.
- ready to execute the next step (new task or active Spec).

**If any step is missing** → bootstrap is incomplete. Run again.

## Next step

- **If no active Spec:** ask the user "What task are we working on today?".
- **If active Spec:** continue executing the next block.
- **If workflows are missing superpowers:** run `promps/setup/03-required-skills.md` first.

## Related

- **Skill:** `ai-os-karpathy` (loaded after this skill).
- **Workflow:** `~/Projects/ai-os/workflows/project_start.md` — Spec + execution.
- **Verify:** `bash ~/Projects/ai-os/setup/verify.sh` — 14 health checks.
- **Setup:** `promps/setup/03-required-skills.md` — install missing superpowers.

## Anti-patterns (extended)

- ❌ Starting work without executing this skill first.
- ❌ Claiming AI-OS works without verifying.
- ❌ Loading `ai-os-karpathy` directly (skip the verification).
- ❌ Modifying `ai-os-quickstart` to bypass checks (defeats the purpose).
