# Daily Start

Workflow to start any work session with me.

> **Prerequisite:** have the 14 superpowers skills installed (see `~/Projects/ai-os/CLAUDE.md` section 16). Without them, this workflow will fail at step 2 (using-superpowers is missing).
>
> Run `bash ~/Projects/ai-os/setup/verify.sh` to verify. If it reports `14/14 superpowers skills OK`, you're good.

## When to use

- Start of a session in any CLI (Claude Code, Hermes, Codex, Gemini, Antigravity).
- Coming back from a break (lunch, weekend, etc.).
- Switching between projects.
- When in doubt about the current state of the AI-OS.

## Steps

### 1. Load AI-OS (load skill)

```bash
# In Hermes:
hermes chat --skills ai-os-karpathy

# Or, in any CLI, read the master instructions at the start of the conversation:
cat ~/Projects/ai-os/CLAUDE.md
```

The skill `ai-os-karpathy` (or reading CLAUDE.md) provides:

- 18 sections of master instructions.
- Link to `rules/`, `context/`, `specs/`, `verifiers/`, `workflows/`.
- List of all installed skills.

### 2. → Load skill `using-superpowers` (load skill)

The `using-superpowers` skill is the **router** that decides which specific superpowers skill to load at each phase of the task. It's the meta-skill.

How it works:

- Reads the conversation and detects the phase (idea, spec, implementation, test, debug, review, etc.).
- Loads the specific skill that applies.
- Continuously re-evaluates as the task progresses.

If `using-superpowers` is not installed → see CLAUDE.md section 16 for the install script.

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

### 4. → Load skill `workflows/daily_start.md` (AI-OS internal)

The `daily_start` workflow of AI-OS has 7 steps:

1. Load AI-OS (step 1 of this workflow).
2. → Load `using-superpowers` (step 2 of this workflow).
3. → Load `brainstorming` if the idea is vague (step 3 of this workflow).
4. Read `context/` (profile, projects, preferences, tools).
5. Read `rules/` (always_do, ask_before_doing, never_do).
6. Read `specs/current_spec.md`. If empty → the user has no active Spec. If filled → continue execution.
7. Start the task. → Load skill `workflows/project_start.md` if a new Spec is needed.

### 5. Read `context/` (read files)

```bash
# Read all context in order
for f in ~/Projects/ai-os/context/*.md; do
  echo "=== $f ==="
  cat "$f"
done
```

These 6 files give you the durable context:

- `00_profile.md` — who I am.
- `01_business_or_work.md` — Schilling + personal projects.
- `02_projects.md` — active/archived inventory.
- `03_preferences.md` — language, tone, formatting.
- `04_tools.md` — macOS, terminals, CLIs, packages.
- `05_sources.md` — official docs + reference repos.

### 6. Read `rules/` (read files)

```bash
for f in ~/Projects/ai-os/rules/*.md; do
  echo "=== $f ==="
  cat "$f"
done
```

The 3 rules files are **hard constraints**:

- `always_do.md` — 23 mandatory actions.
- `ask_before_doing.md` — 30+ actions that require explicit confirmation.
- `never_do.md` — 60+ absolute prohibitions.

### 7. Start the task (start work)

After reading CLAUDE.md + context/ + rules/, ask the user:

> "I've loaded AI-OS. What's the task today?"

Possible paths:

- **New task** → → Load skill `workflows/project_start.md` (AI-OS) to create a Spec.
- **Existing Spec** → execute block by block.
- **Quick task** (<15 min) → just do it, archive when done.
- **Research** → → Load skill `workflows/research.md` (AI-OS).
- **Code work** → → Load skill `workflows/coding.md` (AI-OS).

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
- ❌ Starting a task without a Spec → use `workflows/project_start.md` first.
- ❌ Asking "should I continue?" mid-task → if the user said "go", execute.
