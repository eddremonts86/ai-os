---
name: saas-review
description: Full-app SaaS design review — enumerate and visit every route, audit each screen against the expensive-UI criteria, report prioritised findings, then apply the approved fixes with verification. Use when asked to "/saas-review", "review the whole app", "audit every page and fix it", "make this app look expensive", "revisa toda la app", or when the scope of a design task is the entire product rather than one screen. Chains `app-route-inventory` → `saas-ui-audit` → `saas-expensive-ui` and the four topical skills.
argument-hint: 'Optional: repo path, base URL, or a route/flow to scope the pass (defaults to the whole app in the current repo)'
user-invocable: true
---

# /saas-review — whole-app review and remediation

Six phases. **Routes first, audit second, code last.** The inventory is not optional overhead: an app
whose routes you have not visited cannot be reviewed, only guessed at.

Scope: `$input` if given (repo path, base URL, or a route/flow subset), otherwise the whole app in the
current repository.

## Non-negotiables

1. **Inventory before opinion.** Phase 1 and 2 complete before a single finding is written.
2. **No code before approval.** Phases 0–4 are read-only. Writing starts only after the user approves
   the findings list in Phase 4.
3. **Evidence per finding.** Route + file/line + observable symptom. "Feels cluttered" is not a finding.
4. **Never type the user's personal credentials.** For gated routes, prefer in order: (a) a saved
   Playwright storage state committed to the repo, (b) seeded test users read from the audited app's
   `.env` under the `SAAS_REVIEW_*` convention (see Authentication modes), (c) the user logs in
   themselves in the browser session you are driving. **Only test/dev credentials may be auto-read from
   `.env` — never a personal or production account.** Refuse to proceed if the only credentials
   available in `.env` look like a real account (no `local`/`test`/`dev`/`seed` markers in the email,
   the password is in a secret manager, the user objects to the read). Log the role you logged in as,
   never the password.
5. **Report gaps out loud.** Unvisited routes, untested roles, unprovoked states, unmeasured claims.
   A review that hides its gaps is worse than a short one.
6. **Do not break the app.** After every writing batch, run the project's own gate and fix what you
   broke before continuing.
7. **One commit per batch**, conventional-commit style. Never one mega-commit at the end.
8. **Never invent** metrics, users, requirements or routes.

## Phase 0 — Ground truth (read-only)

1. Load `saas-expensive-ui` — the judgement criteria for everything downstream.
2. Detect the stack: framework, router, styling system, component library, i18n, state/query layer.
3. Read the existing design system: tokens/theme file, one representative component, the spacing and
   radius scales, the icon family. **Existing project conventions beat any generic advice in these
   skills.** Note them explicitly; you will be held to them.
4. Find the verification gate — `package.json` scripts (`lint`, `typecheck`, `build`, `test`,
   `check:isReady`), or a "verification" section in `CLAUDE.md` / `AGENTS.md`.
5. Run the gate **now**, before touching anything, and record whether it already fails. Pre-existing
   failures must be attributed as pre-existing.
6. Find how to start the app: `.claude/launch.json`, README, or the dev script.

Output: one paragraph — stack, router, design system, gate command, baseline gate result.

## Phase 1 — Enumerate every route

Load `app-route-inventory` and follow it. Minimum:

```bash
bash "$AI_OS_ROOT/ai-config/skills/app-route-inventory/scripts/discover-routes.sh" .
```

Then **verify the script's output against the router source** — it is a first pass, not an oracle. Add
what static discovery cannot see: role/flag/plan-gated routes, data-generated routes, and the
non-route surfaces (modals, drawers, tab query params, wizard steps).

Produce the inventory table (route · file · auth · params · kind · main job · primary CTA) and write it
to `docs/ui-audit/route-inventory.md` in the audited repo.

**Checkpoint — present the route list to the user.** Confirm: is this complete, which routes are in
scope, which roles exist, and which Authentication mode applies (Mode A storage state, Mode B
`.env` test users, or Mode C user-logs-in-themselves). Do not proceed on assumption; a wrong scope
here wastes the entire pass.

## Phase 2 — Visit every in-scope route

Start the app (`preview_start`, or the project's dev command). Resolve authentication using the
mode confirmed at the Phase 1 checkpoint (see Authentication modes). For each in-scope route
capture:

- Screenshot: desktop light · desktop dark (if themed) · mobile 375px
- Console errors and warnings
- Failed or slow network requests
- The states you can provoke: empty · loading · error · permission-denied
- Keyboard tab order on any screen with a form or primary action
- Load timing on critical routes

Store under `docs/ui-audit/evidence/<route-slug>/`. Runtime failures found here (404s, 500s, console
errors, broken redirects) are already findings — carry them into Phase 3.

Update the inventory with `visited: yes/no` per route and the reason for every `no`.

## Phase 3 — Audit

Load `saas-ui-audit`. Score the 21-criterion matrix per flow, and fill
`references/screen-worksheet.md` for each critical screen.

Pull in the topical skill when the flow touches its area — do not load all four for every route:

| Flow area | Skill |
| --- | --- |
| Dashboards, KPIs, reports, any numbers on screen | `saas-data-trust` |
| Anything where the user waits, or lacks feedback | `saas-perceived-speed` |
| Signup, first run, empty states, setup checklists | `saas-onboarding-activation` |
| Marketing site, hero, pricing, the first in-product message | `saas-landing-continuity` |

Also run the slop pass from `saas-expensive-ui/references/slop-catalog.md` across the whole app:
emojis as icons · colours outside tokens · unjustified gradients/glows/glassmorphism · nested cards ·
duplicated data · multiple primary CTAs · mixed icon families · badges that change no decision.

Two mechanical checks worth running on every screen:

- **Greyscale test** — if the primary action disappears in greyscale, the hierarchy depends on colour.
- **Duplication sweep** — list every number on the screen and everywhere else it appears.

## Phase 4 — Report, then stop

Write `docs/ui-audit/findings.md` using `saas-ui-audit/references/report-template.md`:

1. Executive summary — max 15 findings, most severe first
2. The matrix scores per flow
3. Full findings, each with route, file:line, evidence path, damaged user job, severity, recommendation,
   the component/token to reuse, acceptance criterion, regression risk
4. Change plan in small, independently revertible batches
5. Decisions needing a human (activation event, brand attributes, terminology, anything product-level)
6. What could not be measured, and what it would take

**Hard stop. Get the user's approval on which batches to apply.** Re-scoping is cheap here and
expensive after eight phases of edits.

## Phase 5 — Apply, batch by batch

Work P0 → P1 → P2. Never polish P2 while a P0 is open.

Per batch:

1. Implement using **existing components and tokens**. A new component requires a stated justification
   and an owner.
2. Cover the states the finding named: loading, empty, error, permission, success.
3. Run the project gate. Fix regressions before continuing. If a batch cannot pass, revert that batch
   and report it rather than shipping it.
4. Commit that batch alone.

Where the repair is implementation-level rather than judgement-level, `fix-ui-ux` / `impeccable` own
the verbs (`harden`, `layout`, `typeset`, `clarify`, `adapt`, `onboard`, `optimize`, `distill`). Use
them for execution; the severity order stays this skill's.

Do **not** apply, without explicit approval: anything that changes aesthetic direction, brand voice,
terminology, pricing copy, or an activation definition. Those are product decisions.

## Phase 6 — Verify and close

1. Re-run the full gate.
2. Re-visit every route you changed, in the browser, in both themes and at mobile width. A passing gate
   with a visibly broken UI is not verification.
3. Re-score the matrix on the changed flows and put the before/after side by side.
4. Report:
   - **Fixed** — grouped by severity, each with file and commit
   - **Found but not fixed** — with the reason
   - **Verification** — the exact commands run and their real output; if something still fails, say so
     with the output
   - **Still unmeasured** — the honest gap list
   - **Recommended next** — including any aesthetic direction work the diagnosis pointed at

## Modes

- Default: audit → approve → fix.
- `--report-only` in `$input`: stop after Phase 4. Use when the user wants the backlog, not the edits.
- A route or flow in `$input`: run all six phases, scoped to it — but still enumerate the full route
  list in Phase 1, because scope decisions need the whole map.

## Authentication modes

For gated routes, pick the first mode that applies; refuse to proceed if none does.

### Mode A — Saved storage state (preferred)

A Playwright `storageState` JSON (cookies + localStorage) committed to the audited repo. The
agent reuses the existing session; no credentials are read at all. Look for `auth.json`,
`playwright/.auth/user.json`, or a custom path. If the state has expired by the time Phase 2 runs,
fall back to Mode B or C — do not silently re-log-in with a guessed password.

### Mode B — Test users from `.env` (the new default for this skill)

Read seeded test users from the audited app's `.env` under the `SAAS_REVIEW_*` convention. The
audited app owns which users it exposes; the skill just consumes the contract.

**Env var contract.** The skill reads, in order:

1. `SAAS_REVIEW_USERS_JSON` — a single JSON object, e.g.
   ```json
   {
     "owner":          { "email": "owner@test.local",          "password": "..." },
     "admin":          { "email": "admin@test.local",          "password": "..." },
     "member":         { "email": "member@test.local",         "password": "..." },
     "platform-admin": { "email": "platform-admin@test.local",  "password": "..." }
   }
   ```
   Keys are role names (matching the audited app's auth model). Passwords are required.
2. Per-role env vars as a fallback when the JSON form is awkward to maintain in shell:
   `SAAS_REVIEW_OWNER_EMAIL`/`_PASSWORD`, `SAAS_REVIEW_ADMIN_EMAIL`/`_PASSWORD`,
   `SAAS_REVIEW_MEMBER_EMAIL`/`_PASSWORD`, `SAAS_REVIEW_PLATFORM_ADMIN_EMAIL`/`_PASSWORD`.
3. App-convention fallbacks for the platform-admin role only, since most apps already seed one:
   `DEFAULT_ADMIN_EMAIL` / `DEFAULT_ADMIN_PASSWORD` (builderhunt), `ADMIN_EMAIL` / `ADMIN_PASSWORD`
   (rails/devise), `SEED_ADMIN_EMAIL` / `SEED_ADMIN_PASSWORD` (custom). Use this only for the
   platform-admin role; for owner/admin/member, require the explicit `SAAS_REVIEW_*` keys.

**Safety rules when using Mode B.**

- **Test/dev only.** The email must contain a non-production marker (`test`, `dev`, `local`,
  `staging`, `example`, `.local`, `.test`, `@localhost`). If the only email present looks like a
  real account (`@builderhunt.com`, `@gmail.com`, etc., no test marker) **stop and ask the user**;
  do not auto-log-in. Same rule if the password is loaded from a secret manager rather than `.env`.
- **Never log the password.** When reporting progress, log the role and the email's local-part
  (`owner@test.local` → `owner`), never the secret.
- **Read `.env` once per session.** Cache the parsed users in a session-local variable; do not
  re-read the file per request.
- **Prefer `pnpm dev`/local URLs.** The skill runs the audit against the app's local dev server
  (per the project's own `.claude/launch.json` or `dev` script), not a deployed environment.

### Mode C — User logs in themselves

Ask the user to sign in inside the in-app Browser session you are driving, or to provide a
seeded test account out of band (chat, password manager, 1Password CLI). Continue from the
authenticated session. Used when Mode A and Mode B are not available.

### Decision tree

```
Is there a saved storage state in the repo?  → Mode A
Else: does the app's .env have SAAS_REVIEW_* test users?  → Mode B
Else: ask the user to log in themselves or share creds out of band  → Mode C
```

## Anti-patterns

- Auditing from code without ever loading the app.
- A findings list with no file references.
- Fixing P2 polish while a P0 blocker is open.
- One mega-commit that cannot be bisected.
- Claiming a phase is done without running the gate.
- Overriding the project's committed design conventions with generic advice.
- Proposing a full redesign when hierarchy, content, tokens or existing components would do.
- Silently skipping the authenticated half of the app.
