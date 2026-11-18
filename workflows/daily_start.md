# Daily Start

Workflow to start any work session with me.

> **Prerequisite:** have the 14 superpowers skills installed (see `docs/skills-catalog.md` "Superpowers skills"). Without them, this workflow will fail at step 2 (using-superpowers is missing).
>
> Run `bash "$AI_OS_ROOT/setup/verify.sh"` to verify. If it reports `14/14 superpowers skills OK`, you're good.

## When to use

- Start of a session in any CLI (Claude Code, Hermes, Codex, Gemini, Antigravity).
- Coming back from a break (lunch, weekend, etc.).
- Switching between projects.
- When in doubt about the current state of the AI-OS.

## Steps

### 1. Load AI-OS (load skill)

```bash
# In Hermes:
hermes chat --skills aios-karpathy

# Or, in any CLI, read the master instructions at the start of the conversation:
cat "$AI_OS_ROOT/CLAUDE.md"
```

The skill `aios-karpathy` (or reading CLAUDE.md) provides:

- The master instructions (method, always-follow rules, priorities, prohibitions).
- Links to `rules/`, `context/`, `specs/`, `verifiers/`, `workflows/`, and the reference docs (`docs/skills-catalog.md`, `docs/cli-reference.md`).

### 2. → Load skill `using-superpowers` (load skill)

The `using-superpowers` skill is the **router** that decides which specific superpowers skill to load at each phase of the task. It's the meta-skill.

How it works:

- Reads the conversation and detects the phase (idea, spec, implementation, test, debug, review, etc.).
- Loads the specific skill that applies.
- Continuously re-evaluates as the task progresses.

If `using-superpowers` is not installed → see `docs/skills-catalog.md` "Setup on a new Mac".

### 3. → Load skill `brainstorming` (load skill)

→ Load skill `brainstorming` — if the user's idea is vague, run a brainstorming session first.

This skill has 7 techniques:

- Ask "What are you trying to do?"
- Ask "What does success look like?"
- Ask "What constraints do you have?"
- Ask "What's the risk if you don't do this?"
- Ask "What's the simplest possible version?"
- Ask "What could go wrong?"
- Ask "What's the next concrete step?"

Skip this step if the user already has a clear Spec in `specs/current_spec.md` or a well-defined task.

### 4. Follow this workflow

The `daily_start` workflow of AI-OS has 7 steps:

1. Load AI-OS (step 1 of this workflow).
2. → Load `using-superpowers` (step 2 of this workflow).
3. → Load `brainstorming` if the idea is vague (step 3 of this workflow).
4. Read `context/personal/me/profile.md` and `me/preferences.md`; the rest of `context/` on demand.
5. Read `rules/` (always_do, ask_before_doing, never_do).
6. Read `specs/current_spec.md`. If it contains the no-active-Spec template → there is no active Spec. Otherwise, continue the one active task.
7. Start the task. Follow `workflows/project_start.md` only if the task needs a Spec (>~2 hours, more than one repo, or the user asks for one).

### 5. Read `context/` (read files)

Read only the two small files up front:

- `context/personal/me/profile.md` — who I am.
- `context/personal/me/preferences.md` — language, tone, formatting.

The rest of `context/` is read on demand — see the "Read only when the task needs it" table
in `rules/always_do.md`. Reading all of it up front cost ~15K tokens per session
(`context/personal/work/projects.md` alone is 28K characters) for files most tasks never use.

### 6. Read `rules/` (read files)

```bash
for f in "$AI_OS_ROOT"/rules/*.md; do
  echo "=== $f ==="
  cat "$f"
done
```

The 3 rules files are **hard constraints**:

- `always_do.md` — mandatory actions per phase + parallel dispatch rule.
- `ask_before_doing.md` — 30+ actions that require explicit confirmation.
- `never_do.md` — absolute prohibitions.

### 7. Start the task (start work)

After reading CLAUDE.md + context/ + rules/, ask the user:

> "I've loaded AI-OS. What's the task today?"

Possible paths:

- **Large task** (>~2 hours, more than one repo, or the user asks for a Spec) → follow `workflows/project_start.md` to create a Spec.
- **Existing Spec** → execute block by block.
- **Any other task** → plan inline (`writing-plans` for multi-step work), do it, verify with `verification-before-completion`. No Spec.
- **Research** → follow `workflows/research.md`.
- **Code work** → follow `workflows/coding.md`.

## Output

At the end of this workflow, you should have:

- AI-OS loaded.
- All context and rules internalized.
- A clear idea of the next step.
- The user has the right CLI skill loaded.

## Anti-patterns

- ❌ Skipping step 2 (using-superpowers) → tasks lose the superpowers framework.
- ❌ Skipping step 5 (context/) → you'll forget preferences or project details.
- ❌ Skipping step 6 (rules/) → you might violate `never_do.md`.
- ❌ Starting a large task (>~2 hours or multi-repo) without a Spec → use `workflows/project_start.md` first. Smaller tasks do not need one.
- ❌ Asking "should I continue?" mid-task for approved reversible work. Protected actions still require action-specific approval.
