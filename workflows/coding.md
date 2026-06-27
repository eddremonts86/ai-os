# Coding

Workflow for code tasks: new feature, bug fix, refactor.

> **Prerequisite:** have the 14 superpowers skills installed (see `~/Projects/ai-os/CLAUDE.md` section 16). Without them, the load skill steps in this workflow will fail.
>
> Run `bash ~/Projects/ai-os/setup/verify.sh` to verify. If it reports `14/14 superpowers skills OK`, you're good.

## When to use

- Implement a new feature.
- Fix a bug.
- Refactor with impact >1 file.
- Tests for existing code.

Do not use for: configuration changes, single-line fixes (do them directly), research (use `workflows/research.md`).

## Steps

### 1. Determine the type of work (read Spec)

Read `specs/current_spec.md` to understand:

- What we are building/fixing/refactoring.
- What acceptance criteria apply.
- Which blocks are pending.

If the Spec is empty or doesn't exist, run `workflows/project_start.md` first.

### 2. Load the right skill (load skill)

Depending on the type of work:

| Type | Load skill |
|---|---|
| New feature (with Spec) | `workflows/project_start.md` (AI-OS) |
| New feature (without Spec) | `workflows/project_start.md` first, then this |
| Bug | → Load skill `systematic-debugging` |
| Refactor | → Load skill `code-simplification` (if available, else `code-review-and-quality`) |
| Tests | → Load skill `test-driven-development` |
| New skill | → Load skill `writing-skills` |
| Hotfix (urgent) | Skip Spec, do it directly, document later |

### 3. For bugs: → Load skill `systematic-debugging` (load skill)

If the task is a bug, → Load skill `systematic-debugging` FIRST.

This skill has 4 phases:

1. **Reproduce** — confirm the bug exists, get a minimal reproduction.
2. **Isolate** — find the smallest change that causes the bug.
3. **Hypothesize** — list 3+ possible causes, pick the most likely.
4. **Fix and verify** — apply the fix, verify the reproduction is gone, run regression tests.

Do not skip the reproduction phase. "I think the bug is X" is not a verification.

### 4. For tests: → Load skill `test-driven-development` (load skill)

If the task is to add or fix tests:

- Write the test FIRST (red).
- Verify the test fails for the right reason.
- Write the minimal code to pass (green).
- Refactor while keeping tests green.

This is TDD. It is not "write code then add tests".

### 5. For new features: work in branches (load skill)

→ Load skill `using-git-worktrees` if the work is large or might conflict with other work.

For small features, you can work on the main branch directly. For large features, use a worktree:

```bash
git worktree add ../<project>-<feature> -b feat/<feature-name>
cd ../<project>-<feature>
```

### 6. For new features: use → Load skill `test-driven-development` (load skill)

Even if the task is "new feature" and not "add tests", TDD applies:

- Write the test for the new feature first.
- Verify the test fails.
- Write the code to pass.
- Refactor.

### 7. For refactor: → Load skill `code-review-and-quality` (load skill)

If the task is a refactor, → Load skill `code-review-and-quality` first to identify what to refactor.

Anti-patterns to avoid:

- ❌ Refactor + new feature in the same PR (split into 2 PRs).
- ❌ Refactor without tests (add characterization tests first).
- ❌ Refactor without measurement (use benchmarks).

### 8. Execute the work (execute)

Apply the loaded skill's instructions. Common patterns:

- TypeScript / JavaScript: `tsc --noEmit` for type check, `vitest` for tests, `eslint` for linting.
- Python: `mypy` for types, `pytest` for tests, `ruff` for linting.
- Bash: `shellcheck` for linting, `bats` for tests.
- PowerShell: `PSScriptAnalyzer` for linting, `Pester` for tests.

Run tests after each significant change, not just at the end.

### 9. Verify with → Load skill `verification-before-completion` (load skill)

→ Load skill `verification-before-completion` and apply its 6 gates:

1. Does the artifact exist? (file, route, log)
2. Does it have the expected content? (grep, head, count)
3. Are there error indicators? (error, fail, exit 1)
4. Is the system healthy? (processes, services, health checks)
5. Did the test pass? (type check, lint, unit, integration)
6. Is the user-facing flow verified? (URL, smoke test)

If any gate fails, the work is NOT complete. Fix and re-verify.

### 10. Self-review with → Load skill `code-review-and-quality` (load skill)

→ Load skill `code-review-and-quality` for self-review before requesting review.

This skill has:

- Self-review checklist.
- Conventional comments (🔴/🟡/💡/❓/🎓).
- Size limits for PRs.
- Anti-patterns to look for.

### 11. Commit and finish (load skill)

→ Load skill `finishing-a-development-branch` to:

- Commit with conventional message.
- Push to remote.
- Open PR.
- Update Spec status to "complete".

### 12. Archive the Spec (move file)

```bash
mv ~/Projects/ai-os/specs/current_spec.md \
   ~/Projects/ai-os/archive/$(date +%Y-%m-%d)-<slug>.md
```

## Output

At the end of this workflow, you should have:

- Code committed (or PR open).
- Tests passing.
- Lint passing.
- Type check passing.
- Spec archived.
- A clean commit history.

## Anti-patterns

- ❌ Skipping the type check (TypeScript, Python) → runtime errors.
- ❌ Skipping tests → regressions.
- ❌ Mixing refactor with new feature in the same PR.
- ❌ Not running `verification-before-completion` at the end.
- ❌ Not archiving the Spec.
- ❌ Running lint + type check + tests sequentially → dispatch in parallel via `delegate_task`.

## Quick reference

```bash
# Type check (TypeScript)
npx tsc --noEmit

# Tests (Vitest)
npx vitest run

# Lint (ESLint)
npx eslint .

# Format (Prettier)
npx prettier --write .

# Build (Vite)
npm run build

# Dev server
npm run dev
```
