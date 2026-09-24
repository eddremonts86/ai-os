---
name: optimize-mobile
description: End-to-end mobile audit and repair of an existing web app — every route, every flow, measured at 320/375/430/768 and verified in real iOS Safari (simulator), then fixed with small committed diffs. Use when asked to "/optimize-mobile", "optimiza la app para móvil", "audita la app en mobile", "revisa todo en el móvil", "make this work on phones", "fix the mobile view", or when an app's phone experience needs a full pass (layout, touch targets, iOS input zoom, safe areas, sticky hover, flows, states). For shipped products, not greenfield design.
argument-hint: 'Optional: a route, section or component to scope the pass (defaults to the whole app, including signed-in and admin areas)'
user-invocable: true
---

# /optimize-mobile — measure, walk, fix, verify

Scope: `$input` if given, otherwise **the whole app** — public pages, signed-in areas and the
admin/back office. "Whole app" means every route *and* every flow a person does on a phone.

The pass exists because desktop-built apps fail on phones in ways a screenshot at 375px does not
show: iOS zooms into small inputs, `:hover` sticks after a tap, a floating player hides the end of
every page, a side panel opens off-screen, the keyboard's "done" throws away an edit. Every one of
those was found by **using** the app in real Safari, not by reading CSS.

## Non-negotiables

1. **Measure before you fix, and verify after.** Every finding comes from a measurement or a
   screenshot; every fix is re-checked the same way. No "should be fixed".
2. **Real iOS Safari is the reference.** Use the iOS simulator tool when available (attach
   first). Chromium emulation misses input zoom, sticky hover, `env(safe-area-inset-*)`, WebKit's
   fixed-position containing blocks and lock-screen media. The browser pane is for batch numbers.
3. **Flows, not only screens.** Walk each primary job end to end (see Phase 3).
4. **Never type a password, never create accounts to get in.** Ask the user to sign in on the
   simulator, or — only if they ask — add a dev-only sign-in bypass (see "Auth-gated areas").
5. **Don't touch what is fine.** Report it as fine. Smallest diff at the root cause; one guard in
   the shared rule beats one per caller.
6. **Follow the repo's own rules** (its CLAUDE.md/AGENTS.md): staging by path, commit as soon as a
   change is verified, its deploy gate before any push. `git push` is often the deploy — never push
   unless the user asks, and run the repo's gate first.
7. Match the codebase: its comment density, naming, CSS architecture (plain CSS, Tailwind, UnoCSS,
   CSS modules). Check `package.json` before using any library. No new dependencies for this.

## Phase 0 — environment

- Start the dev server the repo's way (`.claude/launch.json` / preview tool). Note its URL.
- Attach the iOS simulator panel; note the device's point size (tap coordinates are points, a
  screenshot is ~2–3x). Open the dev URL with `open_url`.
- `open_url` is a full reload: it stops audio and wipes client state. Navigate **inside** the app
  (tap links/dock) when testing anything stateful.
- If a page renders but data fails with "Load failed" / "Failed to fetch", the dev server died
  and a service worker is serving the shell. Check the server log before debugging the page.
- Read the design tokens and every existing `@media` block first: many apps already have a phone
  block and `@media (pointer: coarse)` rules. Extend them; do not fork a second system.

## Phase 1 — inventory

Use the `app-route-inventory` skill to list every route, including parameterised ones (pick real
ids from the API/DB) and auth-gated ones. Record which need a session and which need admin.

## Phase 2 — batch measurement (browser pane)

Emulate a phone (width < 768 also flips `pointer: coarse` in most emulators). Load
`scripts/mobile-audit.js` into the page and run it over every route at 320, 375, 430 and 768:

```js
// paste scripts/mobile-audit.js, then:
await __mobileAuditRoutes(['/', '/route-2', /* … */], [320])   // one width per call if the tool times out
```

Triage the output:
- `scrollW > w` or `overflow` → horizontal scroll. Find the element; the usual causes are in the
  fix catalogue (grid `auto` tracks, `nowrap` ids, fixed-width columns).
- `small` → targets under 44x44 that the hit-test could not reach. Inline text links inside a
  sentence are exempt; everything else gets a hit area.
- `inputs` under 16px → iOS zoom on focus. Always a fix.
- `body` under ~16px on phones, `tiny` under 11px → type fixes.
- A 1px overflow with `innerWidth` 321 is emulator rounding, not a bug. Say so and move on.

A navigate/reload wipes injected helpers: re-inject after each full navigation. A hidden browser
pane pauses animations and view transitions, so positions read mid-animation there.

## Phase 3 — walk it in real Safari (simulator)

Screenshot every route at the top and after scrolling to the end. Then walk the flows. Minimum set;
add the app's own primary jobs:

| Flow | What to do | What breaks |
|---|---|---|
| Forms | focus every field; submit with the keyboard; submit invalid | page zooms on focus; error unreadable; submit only via return key |
| Inline edit / rename | edit, then tap the keyboard accessory **✓/Done** | Done is a *blur*: edits that save only on submit are lost |
| Lists | tap row body, not just the title; long titles | 20px tall tap target; titles truncated to 3 letters |
| Side panels / editors | open from a row deep in a long list | opens off-screen above the list; hidden under a sticky bar |
| Bulk selection | select one row | sticky action bar parks under the filter bar |
| Media / players | play, pause, seek, next, open the item page, lock the screen | floating player hides page ends; prev/next only change page, not audio |
| Nav | every tab/dock item at 320 | dock buttons shrink; labels wrap |
| States | first load, empty, loading, error, offline (stop the server) | false empty state before hydration; raw "Load failed" |
| Theme | repeat key screens in dark and light | "on-accent" ink used on a tinted background → invisible |

After every tap, screenshot. iOS keeps `:hover` on the last tapped element — look for buttons that
stay highlighted.

Lock-screen / Control Center media controls and artwork do **not** render reliably in the
simulator. Verify there that audio continues while locked and that position/metadata appear;
report controls/artwork as "verify on a real device" rather than guessing a fix.

## Auth-gated areas

Ask the user to sign in on the simulator. If they want a password-less dev login, build it with
three independent locks and prove the production build lacks it:
1. registered only under a compile-time dev flag (`import.meta.env.DEV`, `process.env.NODE_ENV`
   checked by the bundler) so the prod bundle does not contain it;
2. answers only a loopback `Host`;
3. the dev server binds `127.0.0.1`.
Create a **real** session through the auth library (e.g. Better Auth plugin endpoint +
`setSessionCookie`, NextAuth/Lucia equivalents) — a faked user breaks sessions/devices/sign-out.
Allow only same-origin redirect paths (`/x`, not `//x`). Then build prod and grep the output for the
endpoint path and button copy: zero hits, or it does not ship.

## Phase 4 — fix catalogue (proven patterns)

Put phone overrides **last** in the stylesheet or at higher specificity: at equal specificity
source order decides, and phone blocks placed early silently lose to later desktop rules.

**Inputs & forms**
- `@media (pointer: coarse) { input, select, textarea { font-size: 16px } }` — including search
  fields and any overlay placeholder that mirrors the input.
- Visible submit/confirm inside single-field forms; `enterKeyHint="done"`.
- Inline edits commit on **blur**; make return just blur so there is one save path (no double save).
- Password fields: show/hide toggle (same input, `type` swapped; `onPointerDown` preventDefault so
  focus and the keyboard stay; `aria-pressed`; 44px).
- Error text: never the "ink for text on the solid accent" token on a tinted accent background.
  Use body ink + an accent rule (`box-shadow: inset 3px 0 0 var(--accent)`), not colour alone.

**Touch targets without moving layout**
```css
@media (pointer: coarse) {
  .small-control { position: relative; }            /* skip if already positioned */
  .small-control::after { content: ''; position: absolute;
    inset: min(0px, calc((100% - 44px) / 2)); }      /* grows to 44, never shrinks */
}
```
Widen gaps between neighbours so expanded areas do not overlap. Controls that can simply be 44
(tabs, segmented pills, icon buttons in headers) get `min-height: 44px`.

**Whole-row tap**: stretch the row's main link (`.title::after { position:absolute; inset:0 }`,
row `position:relative`) and lift the row's other controls (`position:relative; z-index:1`) —
including drag handles.

**Hover on touch**
- Controls revealed only on `:hover` are invisible but still tappable on phones:
  `@media (hover: none) { .card .play { opacity: 1; transform: none } }`.
- Sticky hover: under `@media (hover: none)`, reset hover fills/transforms of transport buttons,
  icon buttons and primary buttons (respect `[aria-pressed=true]` states).

**Layout & overflow**
- Grids with an implicit `auto` column grow to the widest `nowrap` child and defeat ellipsis:
  `grid-template-columns: minmax(0, 1fr)`.
- Never print raw ids/slugs where a title exists — join the title server-side.
- Rows with 4+ columns on phones: move secondary facts (duration, count) to a second line under the
  title; count grid children vs `grid-template-columns` (a fixed last track squeezing 2 buttons
  pushes one outside the row).
- Buttons that truncate a row's text move under the text on phones.
- Big covers stacked over text on phones: put a small cover beside the text.
- Fixed nav/dock at 320: remove `gap`, tighten padding, `flex: none` on items; do the arithmetic.
- Separators meant for a single row: hide them when the row wraps.
- Opaque bands/"glass" layers that only exist for a pinned state: remove when not pinned.

**Fixed/sticky pieces**
- Floating player/bar over content: reserve its measured height at the page end, e.g.
  `body:has(.player:not(.is-closing)) .app { padding-bottom: calc(var(--player-gap) + 24px) }`
  with the gap published by a ResizeObserver. Include the safe-area inset.
- Sticky offsets from measured heights (ResizeObserver → CSS var), never hardcoded px — a filter
  bar that wraps to two rows hides whatever was parked 62px below it.
- Side editors on phones → full-screen sheet: `position: fixed; inset: 0; z-index` above the dock,
  solid background, sticky header (title + close) and sticky action bar, safe-area padding.
  If it renders the width of its parent, an ancestor with `transform`/`filter`/`backdrop-filter`
  — including a **filling entrance animation** in WebKit — is its containing block. Walk up the
  ancestors, find it, disable it while the sheet is open (`:has(.sheet) { animation: none }`).
- Translucent "glass" fills vanish on a solid sheet (white on white): use a recessed well token.
- Safe areas: `viewport-fit=cover` needs `env(safe-area-inset-*)` paid back on top chrome,
  bottom docks and anything floating above them.

**Type**
- Body copy 16px on phones; uppercase captions ≥ 10.5–11px; numbers stacked under icons instead
  of 7–8px labels drawn over them.
- Tailwind preflight makes `svg` `display:block`: icons inside sentences wrap onto their own line →
  `display: inline-block; vertical-align: -1px` for those contexts.

**States**
- Before client hydration resolves, show skeletons, not "you have nothing yet".
- Network errors (Safari "Load failed", Chrome "Failed to fetch", Firefox "NetworkError", or
  `navigator.onLine === false`) get an offline message and retry on the `online` event.
- Play/pause (or any toggle) buttons in cards reflect the live global state, and "time left" reads
  from the live player, not the last save.

**Players / media flows**
- "Next/previous" beside a transport should move the audio when it is playing, not only the page.
- Hide the global mini-player on the page that already has the full transport for the same item.
- On narrow phones, drop secondary player controls that exist elsewhere (language → settings) so
  the title has room; hide add-to-list below ~360px if every row already offers it.

## Phase 5 — verify, commit, report

1. Re-run `mobile-audit.js` on every touched route; re-walk the flows in the simulator and
   screenshot each fix.
2. Run the project's typecheck/lint/tests. Build prod when a change is dev-gated.
3. Commit per area (e.g. "phone audit — playback flow", "— catalog editor"), staging paths only,
   message = problem measured + fix. Check the commit contains your files.
4. Do not push unless asked; if asked, run the repo's deploy gate first, then verify production
   read-only (health/version endpoint, key routes, new CSS served).
5. Report in the user's language, as a table per area: **file · problem detected · fix applied**,
   then what is fine and untouched, then what could not be verified (and why), then anything
   left in the environment (test data you created, servers running).

## Anti-patterns

- Fixing from a desktop screenshot or from reading CSS alone.
- Hardcoding pixel offsets for sticky stacks; one-off overrides per caller.
- Adding a "mobile" component library or a second breakpoint system.
- Emojis, new fonts, or a redesign nobody asked for — this is repair, not rebrand.
- Leaving a dev bypass reachable in production, or typing the user's password to test.
- Deleting test data or user data yourself — list it and let the user decide.
