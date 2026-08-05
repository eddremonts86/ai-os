---
name: app-route-inventory
description: Enumerate and then actually visit every page/route of a web app before auditing, redesigning or testing it. Use when asked to "list all the pages", "navigate the whole app", "map the routes", "I want to review every screen", "audit the complete app", or whenever a task's scope is "the whole app" and the route list is not already known. Covers static discovery (Next.js, TanStack Router, React Router, Vue Router, Nuxt, SvelteKit, Remix, Astro, Angular, Laravel, Django, Drupal, Rails), runtime discovery, auth-gated and parameterised routes, and per-route evidence capture.
---

# App route inventory

You cannot review, redesign or test "the whole app" until you have the route list **and** you have
seen each route render. This skill produces both: a complete inventory table, then per-route evidence.

Static discovery alone is not an inventory. A route that exists in the router and 500s in the browser
is a finding, and you only find it by visiting.

## Phase 1 — static discovery

Run the helper script from the target repo root:

```bash
bash "$AI_OS_ROOT/ai-config/skills/app-route-inventory/scripts/discover-routes.sh" [repo-path]
```

It detects the router(s) in use and prints `route<TAB>source-file` plus a summary. It handles
file-based routers (Next.js app/pages, TanStack Router, Nuxt, SvelteKit, Remix, Astro), config-based
routers (React Router, Vue Router, Angular) and server frameworks (Laravel, Django, Drupal, Rails).

**Always sanity-check the script's output against the code.** It is a fast first pass, not an oracle:

- Config-based routers get grepped, so dynamically generated routes may be missed. Read the router
  file itself.
- Routes rendered conditionally by role, feature flag or plan will not be distinguishable statically.
- Redirects, catch-alls and error boundaries appear as routes but are not screens.
- Modal-as-route, drawer-as-route and tab-as-query-param surfaces are screens the router may not list.
  Grep for `searchParams`, `?tab=`, `useSearchParams`, `?modal=`.

## Phase 2 — classify before visiting

Build the inventory table. Do not skip the classification columns — they decide what you visit and how.

| Column | Why it matters |
| --- | --- |
| Route | The path pattern, e.g. `/projects/:id/settings` |
| Source file | Where to make the fix later |
| Auth | public / authenticated / role-gated / plan-gated |
| Params | What real values are needed to render it |
| Kind | screen / layout / redirect / api / error boundary / not-a-screen |
| Main job | The one outcome the user came for (from `saas-expensive-ui`) |
| Primary CTA | Should be exactly one |
| Owner | Who to ask when it is unclear |

Mark every route you will **not** visit, with the reason. An inventory with silent gaps is worse than
a short one, because it reads as complete.

## Phase 3 — get in

For anything behind a login:

- **Never type the user's credentials yourself.** Ask the user to sign in in the browser session you
  are driving, or to point you at a seeded test account, a saved storage-state/session file, or a dev
  bypass. Then continue from the authenticated session.
- For role-gated routes, ask which roles exist and whether test users exist per role. Audit per role;
  a screen that is correct for an admin can be broken for a viewer.
- Record which roles you could **not** test.

For parameterised routes, get real IDs from the running app (a list page, a seed script, the DB). Never
audit a detail screen with a fabricated ID — the empty/error path is not the real screen.

## Phase 4 — walk it and capture evidence

Start the app the project's own way (`preview_start` with `.claude/launch.json`, or the documented dev
command). Then per route capture:

1. **Screenshot** — desktop light, desktop dark (if themed), mobile (375px)
2. **Console errors and warnings**
3. **Failed network requests** and anything unusually slow
4. **The states you can provoke** — empty, loading, error, permission-denied. A state you did not
   provoke is a state you cannot claim exists.
5. **Keyboard tab order** on any screen with a form or a primary action
6. **Load timing** for critical routes

Store artifacts under `docs/ui-audit/evidence/<route-slug>/` in the audited repo, or the session
scratchpad if the user does not want repo writes. Reference the paths from the findings.

## Phase 5 — output

Write `docs/ui-audit/route-inventory.md` in the audited repo:

```markdown
# Route inventory — [app]

- Generated: [date]
- Stack: [framework + router]
- Discovery: script + manual verification of [router file]
- Routes found: N — visited: N — skipped: N

| Route | File | Auth | Params | Kind | Main job | Primary CTA | Visited | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |

## Not visited

| Route | Reason |
| --- | --- |

## Surfaces that are not routes

[Modals, drawers, tab params, wizards, toasts — screens that need auditing but have no path.]

## Runtime problems found while walking

[Console errors, 404s, 500s, broken redirects. These are findings already — hand them to the audit.]
```

## Rules

1. **The list is not the inventory.** Visiting is.
2. **Report the gaps explicitly** — unvisited routes, untested roles, unprovoked states.
3. **Read-only in this skill.** Discovery and capture do not modify the app.
4. **Never fabricate a route** you did not see in code or in the browser.
5. **Do not enter credentials.** Ask the user to authenticate.

## Related skills

`saas-ui-audit` (the consumer of this inventory) · `saas-expensive-ui` (the judgement criteria) ·
`/saas-review` (chains both) · `webapp-testing` / `browser-qa` (deeper interaction testing).
