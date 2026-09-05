# DESIGN.md — Plansmith (the plans explorer)

Describes what the interface **is**, and why the load-bearing decisions were made,
so they are not re-litigated. Anything not in here is not a committed decision.

> Rewritten 2026-08-13 during a remediation pass. The previous version was in
> Spanish (against this project's own AGENTS.md rule) and described a design that
> was never built: a distribution histogram in the income slider, skeleton shimmer
> loading, an SVG illustration in the empty state, and a pulse animation on score
> badges. None of those existed. Treat this file as a record of the built system,
> not a wish list.

---

## Register

Two surfaces in one app. `/` is a landing that says what the corpus is and why it is free,
then hands over to the product. Everything else is a dense, faceted reader over the corpus,
used to answer "what should I build next" in seconds. The landing persuades; the reader
does not. The reader carries no decorative motion; the landing carries exactly one moving
thing, the newest-plans list on the path (see Layout), and it is data moving, not chrome.

**Light, and locked light (2026-09).** The original palette was blue-black with a violet
accent and read as a terminal; the brief for the redesign was that nobody wanted to open it.
The current language is the one the reference interfaces share: an off-white ground, white
surfaces delimited by a tinted shadow rather than a drawn border, generous radii, pill
controls, a single soft accent, and exactly one gradient (under the hero). There is
deliberately no `prefers-color-scheme: dark` block; shipping one would hand every dark-OS
visitor the look being retired.

---

## Name and mark

**Plansmith.** The product takes raw material (a problem somebody posted) and forges it into
something made to measure (five documents, ready to open in an editor). The name says that in
one word, sits next to BuilderHunt and HunterReady without borrowing their "hunt", and stays
clear of ProblemHunt, which is a source this app scrapes and must not look like a copy of.
It replaced "AI-OS Plans Explorer", a description that had drifted into being the name.

**The mark is three sheets stacked**, offset diagonally, in `--accent`: the plan documents.
One geometric glyph, no hand-drawn illustration. It is drawn inline in `App.vue` so it takes
the colour token, and the same drawing is `public/favicon.svg` with the hex written out
(a favicon has no CSS). Until this change `index.html` linked a favicon that did not exist:
every page load fetched a 404.

Infrastructure identifiers are **not** renamed: the directory `apps/plans-explorer/`, the
Dockerfile, the deploy workflow and the Coolify app keep their slugs, because those are
referenced by absolute path from production configuration and by every doc in the repo.

---

## Tokens

Source of truth is `app/src/styles/tokens.css`. **No colour literal exists outside that
file.** The dark era grew three (`#8467ff` in two views, `var(--paper, #08090e)` in a third),
and each was a contrast failure or a black frame waiting for the palette to change. Every
ratio below is measured (WCAG 2.x relative luminance), not eyeballed.

### Surfaces

| Token | Value | Role |
| --- | --- | --- |
| `--bg` | `#f5f5f7` | Page. Cool off-white, never pure white |
| `--surface` | `#ffffff` | Cards, inputs, header |
| `--surface-2` | `#f1f1f5` | Raised or inset: chips, hovers, panels inside a card |
| `--line` | `#e6e7ec` | Divides content *inside* a surface |
| `--line-strong` | `#dcdde3` | Outlines an input against the page |

**Cards are delimited by `--shadow-1` and the gap around them, not by a border.** The
hairlines measure 1.26:1 and 1.36:1 on white and do not need to reach 3:1: on this palette a
drawn border would put a wireframe over a design that has none, and the reference UIs do
not draw one either. Hover adds a full-accent border as the second, non-motion signal.

### Text

| Token | Value | On `--surface` | On `--bg` | On `--surface-2` |
| --- | --- | --- | --- | --- |
| `--text` | `#15161c` | 18.05:1 | 16.58:1 | |
| `--text-dim` | `#5c6170` | 6.18:1 | 5.67:1 | 5.48:1 |

### Accent: one token now

| Token | Value | Use |
| --- | --- | --- |
| `--accent` | `#6b4de6` | Fills, rails, borders, focus ring, and accent-coloured text |
| `--accent-text` | `var(--accent)` | Alias. 29 rules still read it |
| `--on-accent` | `#ffffff` | Text on an accent fill |

The dark palette needed two accent tokens because its violet failed 4.5:1 as text. The light
accent is the same hue one step deeper, chosen so one value passes every role: **5.48:1**
with white text on a fill, **5.48:1** as text on `--surface`, **5.04:1** on `--bg`,
**4.76:1** on the 10% tint the chips use. The dark palette's `#7c5cff` measured 4.35:1 under
a white label and failed on every filled button, which is why it is gone.

`--accent-2` (`#0b7a54`, fun / high) is 5.35:1 on white and 4.67:1 on its tint. `--warn`
(`#9a5b06`, money / mid) is 5.42:1 and 4.74:1. `--danger` (`#c62828`) is 5.62:1 and 4.81:1.

### Alpha scale

`--accent-a05` · `--accent-a10` · `--accent-a30` · `--accent-2-a10` · `--accent-2-a30` ·
`--warn-a10` · `--warn-a30` · `--danger-a10` · `--ink-a02`

Named by source colour and opacity. Chips, badges and count pills are **borderless tints**
(`*-a10` background, full colour text): on white the tint is the shape, and a hairline around
a 12px label is clutter. `--accent-a30` is 1.4:1 on white and is not a usable border on its
own.

### The wash

`--wash` is three soft radial gradients (violet, peach, sky) fading into the page. It is the
only gradient in the app and it appears at the two ends of the landing and nowhere else:
under the hero, and on the closing tile, so the close reads as the hero's answer. It used to
also fill the "you are here" cell of the product grid, where a cell that was three-quarters
gradient read as a missing image; that block is now the path rail. Kept as a token so it
cannot be reinvented per view with slightly different colours.

### Focus

`--focus: var(--accent)`: derived, never a second literal. One global `:focus-visible` ring
in `app.css`, `2px solid var(--focus)` at `2px` offset. **A component must not set
`outline: none` without replacing it with something at least as strong.** A border-colour
change alone does not satisfy WCAG 2.4.11.

### Shape

`--radius-sm: 10px` · `--radius-md: 14px` · `--radius-lg: 18px` · `--radius-pill: 999px`

One rule, applied everywhere: **buttons and chips are pills; cards and media frames are
`--radius-lg`; inputs, selects and menus are `--radius-md`; small insets are `--radius-sm`.**
The main navigation is a segmented control (grey pill holding the items, active item on a
white pill with `--shadow-1`), the same idiom as the doc tabs in the reference interfaces.

### Shadows

`--shadow-1` rests, `--shadow-2` lifts on hover. Both are tinted toward the violet-grey of
the page (`rgba(28, 25, 60, …)`), not black: a black shadow on an off-white ground reads as a
smudge, a tinted one reads as depth.

### Other

`--code-bg: #f6f7f9` · `--code-fg: #24292f` (13.9:1). Fenced code uses highlight.js's
`github` theme, imported in `lib/md.ts`; the dark `atom-one-dark` would have been the one
place the old palette survived unnoticed, inside a white document.

Spacing runs on a 4px scale: 4 / 8 / 12 / 16 / 24 / 32 / 48.

### Typography

`--font-ui` is a **system stack** (`ui-sans-serif, system-ui, -apple-system, 'Segoe UI', …`)
and `--font-mono` is `ui-monospace, 'SF Mono', Menlo, …`.

> The previous version of this file said Inter and JetBrains Mono were loaded from Google
> Fonts. **They never were**: `index.html` had no font `<link>`, so every visitor without
> Inter installed was already reading `system-ui`. Naming that on purpose costs no request
> and no layout shift, and it is the typeface the reference interfaces use.

`tokens.css` no longer claims to be shared with `../site/index.html`. It was not, and never
had been: the landing site is acid-green on near-black with Space Grotesk.

---

## SEO, and its ceiling

What is in place: `<title>` per route (set in `router.afterEach`, and by PlanView from the
plan's own title once it loads), meta description, canonical, `robots` meta, Open Graph and
Twitter cards with a 1200x630 `og.png`, an `apple-touch-icon`, JSON-LD (`WebApplication`,
free, published by AI-OS), `robots.txt`, `sitemap.xml`, and a `<noscript>` paragraph so a
crawler that does not run scripts still reads one honest sentence instead of an empty div.

**The ceiling is the router.** Routes are hash fragments (`/#/plans/228`), and a fragment is
not part of the URL a crawler sees, so the whole app is one indexable page and the sitemap
lists one URL on purpose. The 900-plus plan pages, each with a real title and prose, are
invisible to search. Lifting that means path routing (`createWebHistory`; nginx already has
the `try_files` fallback) **plus** a prerender step that writes a static HTML shell per plan
with its title, description and JSON-LD, and a hash-to-path redirect so every existing link
keeps working. It changes every public URL, which is why it is a decision and not a commit.

---

## Layout

### LandingView (`/`)

**The path** ("Three tools, one path") is an ordered list on a rail, not a card grid. Each
stop is `32px | 5fr | 7fr`: a numbered node on the rail, copy at a 46ch measure, the product
on the right. The lede names three verbs; each stop's mono kicker is one of them, so the
sentence and the list are visibly the same three things. Only the current stop's node is
filled with the accent, and it carries a "You are here" chip beside its title: position is
the message, the number is not. The rail is drawn per stop from node centre to node centre
(segments overlap under the solid nodes, so no seam and nothing dangling past the last one).

The current stop shows the corpus rather than a screenshot of the page the visitor is on:
the twelve newest plans by capture date, four visible, one swapped every 3.5s through a
`TransitionGroup` (leaving row lifted out of flow, so the list never changes height).
Rotation does not start under `prefers-reduced-motion`, and it holds while the pointer or
focus is on the list. Loading shows four shimmer rows at the real row height; a failed fetch
shows one line with a link to the explorer instead of a skeleton that never resolves.

The two external tools sit in a browser frame: a 34px bar with three dots and the real
hostname, then the shot. Shots are captured at exactly the frame's ratio (1440x740, see
`scripts/capture-shots.mjs`) and `object-fit` never crops, so the frame shows what was
captured. The frame bar is what lets BuilderHunt's dark hero read as "their site" on this
light page instead of a black rectangle. The action button says the verb ("Open BuilderHunt");
the hostname sits beside it in mono, because a raw hostname as a button label read as a link
nobody named. Under 768px the grid is `28px | 1fr` with the visual below the copy.

**The close** is one tile with two doors, `7fr | 5fr`, divided by a hairline rather than by
a second surface. The wide door repeats the hero's ask with the hero's label ("Browse
plans", primary); the narrow one is the only place the site asks for something back, and
its explanation ("a person reads every submission") sits with its button instead of
orphaned under the heading, which is where the previous band left it. The tile carries the
wash (see Tokens) and a `--shadow-2`; under 768px it stacks and the divider becomes a top
border.

**The footer** (`App.vue`, every route) is three columns over a meta line: brand mark and
one-sentence tagline; the four routes; and "Elsewhere": the two sibling tools, the source
and AI-OS. The meta line is mono and comes from the generated index (plan count, indexed
date) the same way the old one-liner did; it renders nothing rather than a guess. The mark
is `components/BrandMark.vue`, shared with the header, so the two cannot drift.

### IndexView (`/plans`)

A **filter bar** above the grid, sticky at `top: var(--header-h)` under the sticky header,
then the results. One strip holds everything that narrows or orders the set: the search
field, one pill per dimension (Category, Tags, Tech, Country, Income), a `Clear all` pill that
only exists while something is active, and, pushed to the right, the result count and the
sort. The sort is the same `FilterMenu` + `FacetPanel` as every filter, in `single` mode
(radios, no counts), with the current choice printed on its pill: one control vocabulary in
the bar, not five pills and a native `<select>`.

Each pill is a `FilterMenu`: a disclosure, not a modal. The pill carries `aria-expanded` and
`aria-controls`, the panel opens under it, Tab walks into it, Escape or a click anywhere else
closes it, and a pill with active values takes the accent tint and shows the count. Panels
near the right edge open leftward (`:nth-last-child(-n + 2)`), because a 360px panel under a
pill at x = 900 runs off a 1024px viewport.

This replaced a 240px sticky sidebar that stacked four scrolling checklists, each with its
own scrollbar, and cost the grid 240px at every width. The grid keeps its `minmax(300px, 1fr)`
columns, so at the 1280px container that is still three columns, now ~400px wide instead of
~320px: room for these long problem titles. The sidebar also needed a `grid-template-rows: min-content 1fr` hack so a
50,000px results column would not stretch the search box; there is no such column any more
and the hack is gone with it.

- Card grid `repeat(auto-fill, minmax(300px, 1fr))`, 16px gap, `content-visibility: auto`
  on the children (see Performance).
- **Mobile**: the search takes the full first row and the pills wrap underneath. They wrap
  rather than scroll sideways because an `overflow-x` container would clip the panels. The
  panel then spans the bar instead of hanging off its pill (`.filter-menu` drops
  `position: relative` so the sticky bar becomes the containing block).

### PlanView (`/plans/:id`)

Title, metadata, `DocTabs` over the rendered markdown, and the original scraped
problem in its own surface. Three separate states: loading, **not-found**, and
**load-failed** — the last two are different problems with different recoveries,
and conflating them sent users hunting for a typo when the network had failed.

### RankingsView (`/rankings`)

Three top-5 columns (money / learn / fun). Only 15 items, so no windowing.

### AboutView (`/about`)

Real help: how search, facets, the income range and the score dashes behave.
Counts come from `meta.json`, never hardcoded.

---

## Components

| Component | Notes |
| --- | --- |
| `PlanCard` | Footer is two fixed rows: meta (country, stack, income) above, scores below with the source link pinned right, and an empty meta row keeps its 24px so scores line up across a row of cards. It was one wrapping flex row, which put the scores beside a short meta and under a long one. The stack pill is clamped to one line (full list in `title`). `<article>`. The title link stretches over the whole card via `::after`, so the card is the hit target while exactly one link stays in the accessibility tree and text stays selectable. The source link is raised above that overlay. Focus rings the card, not the title. |
| `FilterMenu` | Pill + panel disclosure for one filter dimension. Owns open state, Escape, and the document-level `pointerdown` listener that closes it on an outside click (cleaned up on unmount). |
| `FacetPanel` | Two modes. Standalone: collapsible group with its own header. `headless` (inside a `FilterMenu`): no header, always open, and a type-to-narrow field once the list passes eight options, because Category has 58 values and Country 45. `single`: radios instead of checkboxes, one value always set, used by the sort menu. Rows carry no negative inline margin: the old `-8px` bleed made every row wider than its list and put a horizontal scrollbar under each group. Collapsible group. The `<label>` wraps its checkbox and carries the 44px target; the checkbox stays 16px visually. Focus on the checkbox surfaces on the whole row. |
| `IncomeRangeSlider` | `headless` inside the Income menu: title kept only as the group's accessible name, no divider, header row only while there is something to reset. Two overlaid `input[type=range]`. `role="group"` + `aria-labelledby`, `aria-valuetext` so values announce as money. 24px thumbs on a 44px track; the ring goes on the thumb because the input spans the full track. |
| `ScoreBadge` | Pill, money 💰 / learn 🧠 / fun 🎮. Renders `—` when a plan is not ranked on that axis — most plans are unranked on two of three. |
| `WtpBadge` | Willingness-to-pay pill, bucketed by `mrrMid`. Wraps rather than clips: it is the price the person named, sometimes at length, and a truncated price means nothing. |
| `DocTabs` | `role="tablist"`, 44px tabs. |
| `MarkdownReader` | `markdown-it` + highlight.js `atom-one-dark`, lazy-loaded in its own chunk. Prose rhythm comes from shadcn/typeset — see below. |

Country flags come from a 17-entry map with a 🌍 fallback, and are `aria-hidden`
because the country name follows as text.

---

## Prose — shadcn/typeset

Rendered markdown is styled by [shadcn/typeset](https://ui.shadcn.com/docs/typeset),
vendored verbatim at `app/src/styles/typeset.css` (MIT, fetched 2026-08-13, sha
`f70fb975…`). It replaced 32 hand-written `.md-reader` rules that set every font
size and margin individually.

**It needs no Tailwind.** The file has zero Tailwind directives — no `@apply`,
`@tailwind`, `theme()` or `@utility`. It is plain CSS using `@layer components`,
`:where()` and custom properties, which is why it does not breach the "no Tailwind,
no UI kit, keep CSS small" rule in AGENTS.md. Upstream's install instructions
assume a Tailwind project; the stylesheet itself does not.

Typeset reads shadcn theme variable names, so `tokens.css` aliases ours onto them
(`--color-foreground`, `--color-muted-foreground`, `--color-border`,
`--color-primary`, `--color-ring`, `--font-heading`, `--radius`). Without those
aliases its own fallbacks would flatten the prose to `currentColor`.

The preset is `.typeset-plan`: 15px / 1.7 leading / 1.25em flow. Size and leading
match what the hand-rolled CSS used, so this was a like-for-like swap, not a
redesign. **To retune the prose, change those three values — do not add element
rules.** Everything else (heading sizes, list indents, the gap under a heading, rule
spacing) derives from them.

Three overrides remain in `MarkdownReader.vue`, each for a reason typeset documents
as the app's business:

1. `max-width: 720px` — typeset deliberately sets no measure; the layout owns it.
2. `overflow-wrap: anywhere` — typeset sets `break-word`, which does not shrink a
   container's min-content width. This corpus contains bare 200-character URLs that
   forced the page 285px past a 375px viewport, and only `anywhere` affects
   intrinsic sizing.
3. `pre.hljs` background/border — `atom-one-dark.css` is imported unlayered, so it
   beats `@layer components` and correctly owns syntax token colours; we take back
   only the container, since its `#282c34` is a different hue family from our
   surfaces.

Links keep typeset's underline **and** add `--accent-text`. Typeset sets links to
`color: inherit` on purpose — identifying links by underline rather than colour is
what WCAG 1.4.1 asks for, and the CSS this replaced was colour-only until hover.
The underline is the primary signal; the accent is a second one.

Wide tables are wrapped in typeset's `.typeset-scroll` by a `markdown-it` renderer
rule. The previous fix set `display: block` on the `<table>`, which removes its
table role from the accessibility tree.

> **Observation, not yet acted on:** no document in the corpus uses a labelled code
> fence, so highlight.js never actually highlights anything — its languages and
> theme are ~125KB (53.7KB gzipped) of the lazy markdown chunk serving a code path
> the data never takes. Left in place because plans are authored content that could
> start labelling fences, and the chunk is lazy. Worth revisiting if it never does.

---

## States

Every data view has all three, and **no error state is a dead end** — each carries
a `Try again` wired to a re-runnable loader, and all are `role="alert"`.

| State | Treatment |
| --- | --- |
| Loading | Centred text. No skeleton — deliberate, the data is one local fetch. |
| Error | Heading + message + `Try again`. |
| Empty | "No plans match these filters" + `clear all filters`. |
| Not found | Only PlanView. Heading + the offending id + back to the index. |

---

## Motion

Deliberately minimal. Route cross-fade 180ms, hover transitions 150ms, card lift
`translateY(-2px)`, rank item `translateX(2px)`, landing frame lift `translateY(-3px)`.
The one continuous motion is the landing's newest-plans list (one row swap every 3.5s,
500ms spring-like ease on `transform`, 350ms on `opacity`); it is real data changing, it
pauses under pointer or focus, and it does not start at all under reduced motion.

**Reduced-motion contract** (`app.css`): durations collapse to `0.01ms` and the two
hover *transforms* are removed outright rather than made instant, so nothing jumps.
It is not a blanket `all 0.01ms` kill — that would destroy the state feedback the
transitions exist for. Because the transform disappears, the hover **border** is
the only remaining feedback, which is why it uses the full accent and not a tint.

---

## Performance

Budget: **<200KB JS gzipped** (AGENTS.md). Currently 69.4KB + 53.7KB lazy markdown
chunk.

Every match renders at once. `content-visibility: auto` on the grid children with
`contain-intrinsic-size: auto 271px` lets the browser skip style, layout and paint
off-screen: a forced layout pass over the grid went 18.1ms → 5.1ms.

**271px is the measured mean *row* height, not the median card height.** Grid rows
size to their tallest card; seeding the median card (334px) inflated the page 34%
and the scrollbar visibly shrank as cards realised.

This trades render work, not DOM weight — ~14,500 nodes remain. Cutting that needs
windowing, which costs find-in-page and a dependency. Note that skipped subtrees
are excluded from `innerText`, so any check reading document text under-reports.

---

## Accessibility contract

- Skip link is the first tab stop (`position: fixed`, revealed on focus). Without
  it, reaching the results means tabbing past the whole sidebar — 835 tab stops.
- Heading outline is `h1` → `h2` with no skips. IndexView's `h1` is `sr-only`.
- All interactive targets clear 44×44 **as hit areas**, which is not the same as
  element boxes: a 16px checkbox inside a 44px label passes, and so does a 280×41
  title link whose `::after` covers the card. Measure by hit-testing.
- Every icon-only control has an accessible name. Decorative glyphs and emoji are
  `aria-hidden`.
- Text pairs are verified with the WCAG 2.x ratio, not by eye.

---

## Data honesty

The footer once read `525 plans · last indexed {{ new Date() }}` — the count was
hardcoded in three places and the date was the *render* time, so it always claimed
the corpus was indexed today. Counts and the build date now come from
`meta.json`, emitted by the indexer, and render as nothing when unavailable rather
than as a guess.

The indexer runs one `htmlToText()` pipeline over scraped content. It alternates
decode-and-strip to a fixed point because the corpus is mixed-depth encoded
(`&amp;#39;` beside `&lt;`) **and** what the entities encode is itself markup
(`&lt;!-- SC_OFF --&gt;&lt;div class="md"&gt;`). Decoding once leaves half the
corpus broken; decoding without stripping trades `&#39;` for a visible `<div>`.
Three invariants in `scripts/test-parser.mjs` guard both failure modes.
