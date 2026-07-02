# Master Prompt to Implement AI-OS

> Run once on a new Mac, after creating the directory structure. Fills all the empty `.md` files with personalized content based on the Karpathy method.

---

You are an expert in productivity systems, dev environments, and AI assistants. Implement the **AI Operating System** based on the Karpathy method on this Mac.

## What AI-OS is

A directory at `~/Projects/ai-os/` with:

- `CLAUDE.md` — master instructions loaded by any AI assistant at the start of the conversation.
- `context/` — persistent context (who I am, my projects, preferences, tools, sources).
- `rules/` — hard rules (always do, ask before doing, never do).
- `specs/` — task Specs (the unit of work).
- `verifiers/` — quality gates (applied at the end of each task).
- `skills/` — local skills (reusable procedures).
- `workflows/` — recurring processes (daily_start, project_start, coding, research, content_creation).
- `archive/` — completed Specs.
- `outputs/` — generated artifacts.

## Goal

The user says:

- "I'm starting a new task" → you check `specs/current_spec.md`. If empty, you create one.
- "I'm coding" → you follow `workflows/coding.md` (with TDD, debugging, review).
- "I'm researching" → you follow `workflows/research.md`.
- "I'm writing docs" → you follow `workflows/content_creation.md`.

## Concrete tasks

### 1. Fill `CLAUDE.md`

Create the master instructions that any AI assistant should follow:

- The Karpathy method (Spec → Verifier → Environment).
- The 5 daily workflows.
- Output style (terse, English for code, etc.).
- Memory rules.
- Hard prohibitions.
- Project structure.
- Skill loading order (using-superpowers as router).

### 2. Fill `context/00_profile.md`

Ask the user 5-10 questions to learn:

- Name, location, languages.
- Style (terse, formal, casual).
- Triggers (what means "go", "ok", "continue").
- Tools used (terminal, editor, CLIs).

Write the answers in English.

### 3. Fill `context/01_business_or_work.md`

Ask the user about their work:

- Employment (if any).
- Active projects.
- Personal projects.
- Archived projects.

### 4. Fill `context/02_projects.md`

Inventory of projects:

- Active projects with stack, path, relevant skills.
- Archived projects with reason and date.

### 5. Fill `context/03_preferences.md`

User preferences:

- Language (chat in Spanish, code in English).
- Format (terse, no ceremony).
- Triggers.

### 6. Fill `context/04_tools.md`

Inventory of installed tools:

- OS, terminal, CLIs, languages, key packages.

### 7. Fill `context/05_sources.md`

Sources the AI can trust:

- Official docs URLs.
- Reference repositories.

### 8. Fill `rules/always_do.md`

23 actions that the AI should always do (read context at the start, verify before declaring done, etc.).

### 9. Fill `rules/ask_before_doing.md`

30+ actions that require explicit confirmation (rm -rf, sudo, install packages, etc.).

### 10. Fill `rules/never_do.md`

60+ absolute prohibitions (never commit secrets, never rm -rf /, never modify other profiles without permission, etc.).

### 11. Fill `verifiers/quality_checklist.md`

Checklist of 30+ items to apply at the end of each task.

### 12. Fill `verifiers/critic_prompt.md`

Prompt for the AI to critique its own output (spec compliance, code quality, documentation, etc.).

### 13. Fill `verifiers/source_check_prompt.md`

Prompt for verifying URLs and external claims (don't accept invented sources).

### 14. Fill `skills/README.md`

Explain what local skills are and when to create them.

### 15. Fill `skills/skill_template.md`

Template for creating new skills.

### 16. Fill `workflows/daily_start.md`

Workflow to start any session (load AI-OS, load context, load rules, check Spec).

### 17. Fill `workflows/project_start.md`

Workflow to create a Spec for a new task.

### 18. Fill `workflows/coding.md`

Workflow for code work (feature, bug, refactor).

### 19. Fill `workflows/research.md`

Workflow for research (compare options, summarize findings).

### 20. Fill `workflows/content_creation.md`

Workflow for content (docs, ADRs, tutorials).

### 21. Fill `specs/spec_template.md`

Template for creating a new Spec.

## Style

- ALL files in English (the chat can be in Spanish).
- Terse, no ceremony.
- Concrete, not pedagogical.
- Cite sources.

## Output

When done, the AI-OS is functional. The user can:

- Start a session: `cat ~/Projects/ai-os/CLAUDE.md` (or load the skill `ai-os-karpathy`).
- Create a Spec: `nano ~/Projects/ai-os/specs/current_spec.md`.
- Run a workflow: `cat ~/Projects/ai-os/workflows/coding.md`.

## Next step

After filling all the files, run `setup/03-required-skills.md` to install the 14 superpowers skills.
