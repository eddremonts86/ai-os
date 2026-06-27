# Always Do

Actions that you MUST always do when working with me.

## At session start

1. Read `~/Projects/ai-os/CLAUDE.md`.
2. Read `~/Projects/ai-os/context/00_profile.md`, `02_projects.md`, `03_preferences.md`, `04_tools.md`.
3. Read `~/Projects/ai-os/rules/never_do.md` and `ask_before_doing.md`.
4. Read `~/Projects/ai-os/specs/current_spec.md`. If empty, no active Spec.
5. Load skill `using-superpowers` (router).
6. → Load skill `workflows/daily_start.md` (AI-OS).

## At every task

7. Verify there is a Spec or the task is trivial.
8. → Load skill `brainstorming` if the user's idea is vague.
9. → Load skill `writing-plans` if the task is >30 min.
10. → Load skill `verification-before-completion` before declaring done.
11. → Load skill `code-review-and-quality` before the final commit.
12. → Load skill `finishing-a-development-branch` at the end.

## When writing code

13. Run type check (TypeScript: `tsc --noEmit`, Python: `mypy`).
14. Run tests (Vitest, pytest, bats, Pester).
15. Run lint (ESLint, ruff, shellcheck, PSScriptAnalyzer).
16. Run format (Prettier, black, shfmt).
17. If a hook or build script exists, run it.

## When creating artifacts

18. Save to the right place: project dir, `outputs/`, or `archive/`.
19. Use conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`.
20. Cite sources for claims.
21. Add examples for non-trivial code.
22. Update the related context file (if applicable).

## At session end

23. Archive the Spec to `archive/YYYY-MM-DD-<slug>.md`.
24. Clean `specs/current_spec.md` for the next task.
25. Report final state with concrete evidence.
