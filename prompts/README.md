# Original Karpathy Prompts

> The 6 original prompts from Andrej Karpathy's "AI Operating System" video + 1 additional setup prompt I created. **Reorganized by category** (instead of flat, as they were originally).
>
> **Use case:** if you want to bootstrap AI-OS in a new Mac or share it with other devs, these prompts are the starting point.

## Categories

### setup/ (run once on a new Mac)

- **`01-create-structure.md`** — base command to create the directory structure on a new Mac.
- **`02-master-prompt.md`** — master prompt that generates CLAUDE.md, context/, rules/, specs/, etc.
- **`03-required-skills.md`** — verifies and installs the 14 superpowers skills required by AI-OS.

### daily-use/ (run daily)

- **`01-daily-start.md`** — short prompt to start the day with AI-OS loaded.

### verifiers-specs/ (run per task)

- **`02-create-spec.md`** — creates a Spec for a new task.
- **`03-verifier.md`** — verifies the output of a completed task.

### skill-creation/ (run when discovering a pattern)

- **`04-convert-to-skill.md`** — converts a recurring task into a reusable skill.

## Recommended order

1. **`setup/01-create-structure.md`** — create the AI-OS directory structure.
2. **`setup/02-master-prompt.md`** — generate the master instructions.
3. **`setup/03-required-skills.md`** — install required superpowers skills.
4. **`daily-use/01-daily-start.md`** — daily session workflow.
5. For each task: `verifiers-specs/02-create-spec.md` → execute → `verifiers-specs/03-verifier.md`.
6. When a pattern repeats: `skill-creation/04-convert-to-skill.md`.
