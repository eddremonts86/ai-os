# Create a Spec Before Any Task

> Run before any non-trivial task. Creates the Spec that will guide execution.

---

Create a Spec for the following task:

<describe the task here>

## Instructions

1. Read `~/Projects/ai-os/CLAUDE.md` to understand the AI-OS method.
2. Read `~/Projects/ai-os/specs/spec_template.md` for the template.
3. Create the Spec in `~/Projects/ai-os/specs/current_spec.md` (replace if there's existing content).
4. Fill ALL sections:
   - Metadata (date, status, blocks).
   - Objective (1 sentence).
   - Context (why this task exists).
   - Acceptance criteria (specific, measurable).
   - Non-goals (what we WON'T do).
   - Plan (blocks of <= 30 min).
   - Verification per block.
   - Risks and mitigation.
   - References.
5. Show me the Spec and ask: "OK to proceed?"
6. Wait for approval before executing.

## Style

- ALL in English.
- Terse, no ceremony.
- Concrete acceptance criteria (not "works well", but "the test X passes").

## Example

Task: "Add dark mode to the app"

Spec:

```markdown
## Metadata

- Date: 2026-06-27
- Status: draft
- Blocks: 3

## Objective

Add dark mode toggle to the app that persists across sessions.

## Context

Users have been asking for dark mode. The app is light-only now.

## Acceptance criteria

- [ ] Toggle in the header switches theme.
- [ ] Theme persists across sessions (localStorage).
- [ ] No flash of wrong theme on load (FOUC).
- [ ] Lighthouse score > 90 with dark theme.

## Non-goals

- Multiple themes (just light/dark).
- Custom color picker.
- Auto-detect OS preference.

## Plan

### Block 1: Add theme provider (15 min)

- Create ThemeProvider with context.
- Add toggle in Header.
- Verify: toggle changes the theme visually.

### Block 2: Persist theme (15 min)

- Save theme to localStorage.
- Load on mount.
- Verify: refresh page, theme persists.

### Block 3: Prevent FOUC (15 min)

- Inject script in <head> before React hydrates.
- Verify: Lighthouse score > 90.

## Risks and mitigation

- Risk: localStorage unavailable in incognito.
  - Mitigation: fallback to in-memory state.

## Verification (end-to-end)

- [ ] Lighthouse score > 90
- [ ] Manual test: toggle, refresh, navigate, theme persists.

## References

- https://web.dev/articles/building/a-dark-mode-mode-toggle/
- https://github.com/eddremonts86/wave-template (similar pattern)
```

## After the Spec

Once approved, execute block by block. After each block, apply `verifiers/verification-before-completion.md`.
