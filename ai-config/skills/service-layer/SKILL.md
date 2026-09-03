---
name: service-layer
description: Use when multiple workflows duplicate the same operational logic, when deciding what belongs in actions vs shared services, or when refactoring repeated operational blocks across domain flows. Use when adding a feature that shares mechanics with existing flows. Adapted from michaelshimeles/skills code-structure (service-layer pattern).
---

# service-layer

Two-layer separation: **actions** orchestrate domain rules (why/when), **service layer** centralizes reusable operational mechanics (how). Prevents duplicated ops, inconsistent behavior, and fixes that land in one path but not others.

## When to trigger

- 2+ callers need the same low-level operation (sandbox, email, payment, build, deploy)
- Copy-pasting operational logic between action files
- Bug fix in one workflow doesn't propagate to siblings
- New feature shares mechanics with existing flows

Do not use when logic is truly domain-specific and single-caller — keep it in the action.

## Core pattern

```
Orchestration (Actions)              Service (Shared Mechanics)
├── owns business rules              ├── owns reusable operations
├── owns state transitions           ├── owns provider/SDK calls
├── owns auth / ownership            ├── owns command execution
├── owns failure classification      ├── owns health / readiness
├── owns retries / user errors       └── returns structured results
└── calls service functions
```

Rule: "what this flow means" → action. "how to do it reliably" → service.

## Design principles

| Principle | Do | Don't |
|---|---|---|
| API shape | Composable capability blocks | One giant `doEverything()` |
| Inputs | Explicit params, structured returns | Hidden globals, DB reach-in |
| Migration | Extract one block → replace one caller → verify → migrate rest | Big-bang refactor |
| Domain logic | Keep auth/policy/error mapping in actions | Let service mutate domain tables |
| Extraction trigger | Repeated across 2+ callers | Used once (over-abstract) |

## Designing service functions

Split into capability blocks so callers can compose:

```ts
// composable — each caller picks what it needs
createManagedSandbox(...)
prepareRepo(...)
detectPackageManager(...)
installDependencies(...)
runBuildCommand(...)
startSandboxRuntime(...)
```

Each function:
- Takes explicit inputs, no hidden state
- Returns structured output (`{ ready, previewUrl, proxyPort }`)
- Never touches domain DB directly
- Makes failure explicit (typed result, not swallowed error)

## Migration checklist

1. Write the flow in action code first (behavior is clear).
2. Mark repeated operational chunks across callers.
3. Extract only repeated, non-domain chunks to service.
4. Replace one caller → verify (typecheck, lint, tests, run).
5. Migrate remaining callers one by one.
6. Keep domain policy in actions.

## Anti-patterns

| Anti-pattern | Problem |
|---|---|
| God service | One huge function hides control flow, untestable |
| Leaky service | Service mutates domain tables directly |
| Inconsistent API | Each function has different arg/error style |
| Over-abstraction | Extracting single-use logic — adds indirection for no sharing |

## Example

```ts
// emailService.ts — shared mechanics
export async function sendWelcomeEmail(p: { to: string; name: string }) {
  const html = `<h1>Welcome ${p.name}</h1>`;
  await emailProvider.send(p.to, "Welcome", html);
}
// userSignup.ts — orchestration (owns WHEN)
if (user.marketingOptIn) await sendWelcomeEmail({ to: user.email, name: user.name });
// adminInvite.ts — different rule, same mechanic
await sendWelcomeEmail({ to: invitee.email, name: invitee.name });
```

## Mental model

```
New feature? → write in action → repeated ops? → extract to service → no repetition? → keep in action
```

One sentence: **Actions orchestrate domain rules; service layer centralizes reusable operational mechanics with a composable, explicit-input API.**

## Relation to ai-os

- Pair with `ponytail` ladder: service extraction is rung 2 ("already in this codebase? → reuse") — extract once, reuse N times.
- Pair with `using-git-worktrees`: extract service in `main` first, then branch worktrees consume it.
- Evidence: prove extracted service with existing `verification-before-completion` + `webapp-testing` before migrating callers.

## Source

Adapted from `michaelshimeles/skills` `code-structure` (original author shimeles, vendored concept; this file is a rewrite for ai-os style, not a verbatim copy). Upstream: https://github.com/michaelshimeles/skills/tree/main/code-structure
