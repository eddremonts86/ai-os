---
name: code-review-and-quality
description: Effective code review — what to look for, how to comment, PR size, quality checklist. Applies to PR reviews in any language, especially TypeScript/React/Node.
license: MIT
---

# Code Review & Quality

## Mindset

> "The review is not to prove you know more. It's to improve the code together."

Three goals of the review:
1. **Catch bugs** before prod
2. **Improve design** for the long term
3. **Share knowledge** across the team

It is NOT for:
- Showing off
- Debating style preferences (that's the linter's job)
- Blocking without reason

## When to request review

- PR < 400 lines of diff (ideal < 200)
- CI passes (lint, typecheck, tests)
- Self-review done (you read your own PR)
- Complete description (what, why, how to test)

## When to do review

- **< 4 hours** since assigned
- If it'll take > 24h, let someone know and reassign
- **< 30 min** per session (big PRs in chunks)

## Review structure

### 1. Overall (1 min)

Read the PR description first. Understand the "what" and "why" before looking at code.

### 2. High-level (5 min)

- Does the solution make sense?
- Is there a simpler approach?
- Does it fit the project architecture?
- Are there obvious security issues?

### 3. Detail (15-20 min)

- Potential bugs
- Edge cases not considered
- Performance issues
- Appropriate tests

### 4. Nitpicks (2-3 min)

- Naming
- Comments
- Style (if the linter doesn't cover it)

## Comments — language matters

### Categories with prefix

```
🔴 BLOCKING — must be resolved before merge
🟡 IMPORTANT — should be resolved, but you can explain why not
💡 NIT — preference, not a blocker
❓ QUESTION — I need to understand the code
🎓 LEARNING — educational context, not a change request
```

### Examples

```
🔴 This will throw when user.email is null (no DB constraint). Add a null check or schema validation.

🟡 Consider using a Map instead of object for O(1) lookup. Performance only matters at scale, but it's cleaner.

💡 Could rename `data` → `userInput` for clarity. Up to you.

❓ Why is this Promise.race instead of Promise.all? Both would work, but I'm not sure of the intent.

🎓 In TypeScript 5.0+, you can use `const` type parameters for better inference. See: <link>
```

### Tone

**Yes:**
- "Consider..."
- "What do you think about...?"
- "I'm wondering if..."
- "Could we...?"

**No:**
- "This is wrong"
- "You should..."
- "Why didn't you...?"
- "This is bad"

## Review checklist

### Functionality
- [ ] The code does what the PR description says
- [ ] Edge cases considered (null, undefined, empty, max, race conditions)
- [ ] Appropriate error handling (don't swallow errors)
- [ ] No missing business logic

### Design
- [ ] Follows project patterns (check skills/AGENTS.md)
- [ ] No unnecessary coupling
- [ ] Single responsibility
- [ ] Clear names (variables, functions, types)
- [ ] No "clever" code that requires comments to understand

### Security
- [ ] No hardcoded secrets
- [ ] Input validation (especially user input)
- [ ] Auth/authz on endpoints
- [ ] SQL/NoSQL parameterized
- [ ] XSS sanitization
- [ ] CSRF protection
- [ ] CORS configured correctly

See skill `owasp-security` for the full checklist.

### Performance
- [ ] N+1 queries avoided
- [ ] No unnecessary loops over large data
- [ ] No render loops in React (useMemo/useCallback only if worth it)
- [ ] Bundle size didn't explode (verify size-limit)
- [ ] No memory leaks (event listeners, timers, closures)
- [ ] DB queries with indexes

### Testing
- [ ] Tests for new functionality
- [ ] Tests for bug fixes (regression)
- [ ] Edge cases tested
- [ ] Tests are not flaky
- [ ] Coverage didn't drop

### Legibility
- [ ] Functions < 50 lines (ideally < 20)
- [ ] Files < 300 lines
- [ ] No redundant comments ("// increment i" over `i++`)
- [ ] Magic numbers extracted to named constants

### Types (TypeScript)
- [ ] No `any` (use `unknown` + narrowing)
- [ ] Specific interfaces/types, not generic
- [ ] `as` only when inevitable
- [ ] Generics applied well

## PR sizes

| Diff lines | Category | Review time |
|---|---|---|
| < 50 | Trivial | 5 min |
| 50-200 | Ideal | 15-30 min |
| 200-400 | Large | 30-60 min (split if possible) |
| 400-800 | Very large | split into multiple PRs |
| > 800 | Massive refactor | requires design doc first |

If your PR is > 400 lines, it can probably be split.

```bash
# Split with git
git checkout -b feat/part-1
git add <files-for-part-1>
git commit -m "feat: part 1 of X"
git checkout main
git checkout -b feat/part-2
# rest of files
```

## Self-review

Before requesting review, review your own PR:

```bash
# 1. View the full diff
gh pr diff

# 2. Reread the description
gh pr view

# 3. Run tests locally
pnpm test
pnpm typecheck
pnpm lint

# 4. Check CI
gh pr checks

# 5. Self-review on GitHub
# Add comments to your own PR explaining non-obvious choices
```

## Common patterns to reject

### 1. "Fix" that hides the problem

```typescript
// ❌ BAD
try {
  await db.users.create(data);
} catch (e) {
  return null;  // silence = bug that's hard to debug
}

// ✅ GOOD
try {
  return await db.users.create(data);
} catch (e) {
  if (e.code === 'UNIQUE_VIOLATION') throw new ConflictError('Email exists');
  logger.error({ err, data: redact(data) }, 'failed to create user');
  throw e;
}
```

### 2. "I'll fix it later" comments

```typescript
// ❌ BAD
// TODO: add proper validation
function processInput(input: any) {
  return doStuff(input);
}

// ✅ GOOD
// No TODO, or with ticket reference:
// TODO(SCH-12345): add proper validation
function processInput(input: unknown) {
  if (!validateSchema(input)) throw new ValidationError();
  return doStuff(input);
}
```

### 3. Over-engineering

```typescript
// ❌ BAD: premature abstraction
class AbstractUserFactoryBuilderFactory { ... }

// ✅ GOOD: KISS
function createUser(data) { ... }
```

### 4. God components/classes

```typescript
// ❌ BAD: 500-line component doing everything
function Dashboard() {
  // fetch data, handle auth, render charts, manage state, handle routes
}

// ✅ GOOD: split up
function Dashboard() {
  return (
    <DashboardLayout>
      <DashboardHeader />
      <DashboardCharts />
      <DashboardTable />
    </DashboardLayout>
  );
}
```

### 5. Magic strings/numbers

```typescript
// ❌ BAD
if (user.role === 'admin') { ... }
setTimeout(callback, 86400000);

// ✅ GOOD
const ROLES = { ADMIN: 'admin', USER: 'user' };
if (user.role === ROLES.ADMIN) { ... }
const ONE_DAY_MS = 24 * 60 * 60 * 1000;
setTimeout(callback, ONE_DAY_MS);
```

## Approval

### Approve

```markdown
LGTM! Ship it 🚀

(or "Looks Good To Me" + emoji)

Or with detail:
Nice work. Two nits but I'll let you decide.

### Approved with suggestions
[suggestion 1]
[suggestion 2]

### Comments addressed
[link to comments]
```

### Request changes

```markdown
### Blocking
1. [critical issue]

### Suggestions (non-blocking)
1. [improvement]
```

If the change is blocking, be specific about WHAT to change and WHY.

### Empty comment on approval

If there's nothing to say → approve with "LGTM" and emoji. Don't require 5 paragraphs of approval.

## When NOT to approve

- CI fails (lint, tests, build)
- PR description is empty
- Diff > 800 lines without justification
- Changes outside the PR scope
- Mixes fix + refactor + feat (ask for split)
- No tests for functional change
- Bug regression without test preventing it

## Tooling

```bash
# GitHub CLI
gh pr list                    # see open PRs
gh pr view <num>              # see details
gh pr diff <num>              # see diff
gh pr review --approve         # approve
gh pr review --request-changes --body "..."
gh pr review --comment --body "..."

# Conventional comments
# https://conventionalcomments.org/
# Prefixes: praise (🎓), nit (💡), suggestion (🟡), issue (🔴), question (❓)

# Danger.js (auto-comments)
# https://danger.systems/
# Auto-flag: PRs > 500 lines, no tests, etc.
```

## Resources

- [Conventional Comments](https://conventionalcomments.org/)
- [Google Engineering: Code Review](https://google.github.io/eng-practices/review/)
- [GitHub code review docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests)
- Related skill: `requesting-code-review` (how to ask)
- Related skill: `receiving-code-review` (how to receive)
- Related skill: `owasp-security` (security checklist)
- Related skill: `code-simplification` (how to simplify)