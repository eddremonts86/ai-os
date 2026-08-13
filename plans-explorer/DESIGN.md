# DESIGN.md — AI-OS Plans Explorer

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

Internal tool. A dense, faceted reader over a corpus of 552 product plans, used to
answer "what should I build next" in seconds. Not a marketing surface: no hero, no
persuasion, no decorative motion. Information density beats visual impact.

---

## Tokens

Source of truth is `app/src/styles/tokens.css`. **No colour literal exists outside
that file** — 23 hand-written `rgba()` values used to re-derive brand colours in 8
components, so changing a brand colour left all 23 behind.

### Surfaces

| Token | Value | Role |
| --- | --- | --- |
| `--bg` | `#0b0d12` | Page |
| `--surface` | `#151922` | Cards, inputs, header |
| `--surface-2` | `#1b2029` | Raised — chips, hovers, inset panels |
| `--line` | `#232a36` | Divides content *inside* a surface |
| `--line-strong` | `#2d3644` | Outlines a surface *against* the page |

`--surface` and `--surface-2` were lifted from `#11141b`/`#161a23` because a card
sat 1.05:1 from the page with a 1.20:1 hairline — delimited by nothing
perceptible.

**The hairlines do not reach the 3:1 of WCAG 1.4.11 and do not need to.** Reaching
it on this palette requires a `#59677f` mid-grey that turns the UI into a
wireframe. Cards are grouped by a 12px gap and their own internal structure, so
the hairline is emphasis, not the identifying boundary. Do not "fix" this by
raising the border.

### Text

| Token | Value | On `--surface` |
| --- | --- | --- |
| `--text` | `#e8ebf2` | 15.44:1 |
| `--text-dim` | `#9aa3b2` | 7.24:1 |

### Accent — two tokens, on purpose

| Token | Value | Use |
| --- | --- | --- |
| `--accent` | `#7c5cff` | Fills, rails, borders, `accent-color`, focus ring |
| `--accent-text` | `#9074ff` | Anything set with `color:` |

The brand purple measures **4.24:1** on `--surface` and **3.86:1** on the 10% tint
the chips use. That clears the 3:1 non-text floor but fails the 4.5:1 text floor,
and it was colouring 12px chip labels on every card. `--accent-text` is the same
hue lifted 15% toward white: 5.38:1 on `--surface`, 5.08:1 on `--surface-2`,
5.67:1 on `--bg`, 4.89:1 on the accent tint.

**When adding an accent-coloured rule: `color` takes `--accent-text`, everything
else takes `--accent`.**

`--accent-2` (`#3ddc97`, 10.43:1) and `--warn` (`#f5a524`, 9.03:1) pass as text
already and need no second token.

### Alpha scale

`--accent-a05` · `--accent-a10` · `--accent-a30` · `--accent-2-a10` ·
`--accent-2-a30` · `--warn-a10` · `--warn-a30` · `--ink-a02`

Named by source colour and opacity. **`--accent-a30` is not a usable border on its
own** — it measures 1.43:1 on `--surface`. Accent needs alpha ≥ 0.80 to reach 3:1,
so anything load-bearing uses the full accent.

### Focus

`--focus: var(--accent)` — derived, never a second literal. One global
`:focus-visible` ring in `app.css`: `2px solid var(--focus)` at `2px` offset.
**A component must not set `outline: none` without replacing it with something at
least as strong.** A border-colour change alone does not satisfy WCAG 2.4.11.

### Other

`--radius-sm: 6px` · `--radius-md: 8px` · `--radius-lg: 12px` ·
`--shadow-1` · `--shadow-2` · `--code-bg: #1a1d24` · `--code-fg: #c0c5d0` (9.75:1)

Spacing runs on a 4px scale: 4 / 8 / 12 / 16 / 24 / 32 / 48.

### Typography

`--font-ui: 'Inter'` · `--font-mono: 'JetBrains Mono'`, both from Google Fonts.

> **Divergence worth knowing:** `tokens.css` opens with "Tokens shared with
> ../site/index.html — keep in sync". They are **not** in sync and never were. The
> AI-OS site is acid-green `#b3ee55` on `#08090e` with Space Grotesk. This app is
> purple on blue-black with Inter. Either reconcile them deliberately or drop the
> comment; do not assume parity.

---

## Layout

### IndexView (`/`)

CSS grid with named areas so the sidebar and the search field are placed
explicitly rather than by source order.

```
desktop (>768px)          mobile (<=768px)
'search  results'         'search'
'facets  results'         'toggle'
                          'facets'
                          'results'
```

`grid-template-rows: min-content 1fr` on desktop is **load-bearing**. `.results`
spans both rows and is ~50,000px tall; without it the browser splits that height
across the rows, row 1 becomes ~24,000px, and the filter sidebar lands 24,565px
down the page where nobody finds it.

- Sidebar 240px, sticky, `max-height: calc(100dvh - 80px)` with its own scroll.
  `dvh` not `vh` — `vh` counts mobile browser chrome.
- Card grid `repeat(auto-fill, minmax(300px, 1fr))`, 12px gap.
- **Mobile**: the facets are a disclosure, collapsed by default, behind a
  `Filters` toggle carrying `aria-expanded` / `aria-controls` and a badge with the
  active-filter count. Open, the panel is `static` with no `max-height` and no
  inner overflow — the page scrolls instead of nesting scrollers. Search stays
  outside the disclosure: it is the primary filter.

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
| `PlanCard` | `<article>`. The title link stretches over the whole card via `::after`, so the card is the hit target while exactly one link stays in the accessibility tree and text stays selectable. The source link is raised above that overlay. Focus rings the card, not the title. |
| `FacetPanel` | Collapsible group. The `<label>` wraps its checkbox and carries the 44px target; the checkbox stays 16px visually. Focus on the checkbox surfaces on the whole row. |
| `IncomeRangeSlider` | Two overlaid `input[type=range]`. `role="group"` + `aria-labelledby`, `aria-valuetext` so values announce as money. 24px thumbs on a 44px track; the ring goes on the thumb because the input spans the full track. |
| `ScoreBadge` | Pill, money 💰 / learn 🧠 / fun 🎮. Renders `—` when a plan is not ranked on that axis — most plans are unranked on two of three. |
| `WtpBadge` | Willingness-to-pay pill, bucketed by `mrrMid`. |
| `DocTabs` | `role="tablist"`, 44px tabs. |
| `MarkdownReader` | `markdown-it` + highlight.js `atom-one-dark`, lazy-loaded in its own chunk. |

Country flags come from a 17-entry map with a 🌍 fallback, and are `aria-hidden`
because the country name follows as text.

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
`translateY(-2px)`, rank item `translateX(2px)`.

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
