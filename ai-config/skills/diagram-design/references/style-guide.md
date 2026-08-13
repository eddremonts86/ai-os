# Style Guide

**The single source of truth for colors, typography, and tokens.** Every diagram draws from this — not from hex values inlined in other reference files. If you want to change the visual skin of Schematic, change this file.

**AI-OS local skin (onboarded 2026-08-13).** This file is a deliberate local delta over
upstream `diagram-design` — the shipped default skin (white-smoke / atomic-tangerine) has
been replaced by the AI-OS brand palette extracted from `site/index.html`. See
[`../VENDORED_FROM.md`](../VENDORED_FROM.md) before refreshing from upstream: a naive
overwrite of this file silently reverts every diagram to the generic default skin.

The skin is **dark-first**, matching the AI-OS site. `template-dark.html` is the default
variant for AI-OS diagrams; the light variant is the secondary register for print and
light-background docs.

Canonical brand source: [`context/06_brand.md`](../../../../context/06_brand.md) in the AI-OS
repo. If the brand changes, change that file first, then propagate here.

---

## Tokens

### Semantic roles

Every token is referred to by **semantic role**, not by its hex value. Type references (`type-*.md`) and SKILL.md say `accent`, not `#b3ee55`.

**Dark is the default register.** Pick the dark column unless the diagram is bound for print
or a light-background document.

| Role | Purpose | AI-OS (dark, default) | AI-OS (light) |
|---|---|---|---|
| `paper` | Page background, default node fill | `#08090e` (void) | `#f4f5f9` (ink-white) |
| `paper-2` | Diagram container bg, secondary fill | `#0f1119` (panel) | `#e9eaf1` |
| `ink` | Primary text, primary stroke | `#f4f5f9` (ink-white) | `#08090e` (void) |
| `muted` | Secondary text, default arrow stroke | `#a2a4ae` | `#53555d` |
| `soft` | Sublabels, boundary labels | `#7d8089` | `#61636b` |
| `rule` | Hairline borders | `rgba(244,245,249,0.12)` | `rgba(8,9,14,0.12)` |
| `rule-solid` | Stronger borders, baselines | `#2b2d38` (line) | `#c9cbd6` |
| `accent` | Focal / 1–2 max per diagram | `#b3ee55` (acid) | `#4f7800` (acid, darkened) |
| `accent-tint` | Fill for accent-bordered boxes | `rgba(179,238,85,0.12)` | `rgba(179,238,85,0.22)` |
| `link` | HTTP/API calls, external arrows | `#3bdfef` (cyan) | `#007583` (cyan, darkened) |

> **Brand palette source:** extracted from the AI-OS site (`site/index.html`), whose palette is
> authored in oklch. Brand colors: `void oklch(0.14 0.012 275)`, `panel oklch(0.18 0.016 275)`,
> `ink oklch(0.97 0.006 275)`, `muted oklch(0.72 0.014 275)`, `faint oklch(0.56 0.014 275)`,
> `line oklch(0.30 0.02 275)`, `acid oklch(0.88 0.19 128)`, `plasma oklch(0.70 0.24 349)`,
> `cyan oklch(0.83 0.13 205)`, `amber oklch(0.83 0.16 78)`. Hex values above are the sRGB
> conversions, so the tokens survive in SVG (which has no oklch support in older renderers).

> **Two derived values, and why.** (1) `soft` in dark is `oklch(0.60 …)`, not the site's
> `faint oklch(0.56 …)` — faint measures 4.27:1 on `paper`, which fails AA for the 9px
> sublabel text this role carries. (2) The light-mode `accent` and `link` are darkened
> members of the same hue families: acid at `L 0.88` measures 1.3:1 on light paper and is
> unusable as a stroke or label there. Bright acid survives in light mode only as
> `accent-tint` fill.

> **Contrast, verified.** Every role above was checked against its own `paper` with the WCAG 2.x
> formula: dark — ink 18.26:1, muted 8.01:1, soft 5.04:1, accent 14.47:1, link 12.30:1;
> light — ink 18.26:1, muted 6.82:1, soft 5.50:1, accent 4.80:1, link 4.98:1. All text roles
> clear 4.5:1. Re-verify with the same method if you touch a value.

> **Note:** The pre-baked example HTML files in `assets/` ship with upstream's skin, not this
> one. They are reference geometry, not brand samples — do not copy their hex values. New
> diagrams the skill produces use the tokens above.

### Inversion rule (dark → light)

Any `rgba(244,245,249, X)` in dark becomes `rgba(8,9,14, X)` in light. Same opacities, RGB
flipped. `accent` and `link` do **not** invert by opacity — they swap to their darkened
light-mode members named in the table above.

### Series palette (multi-series chart types only)

A small set of desaturated, editorial-tone colors for chart types that genuinely need to distinguish multiple overlapping entities (currently: **radar**). The "1-focal" rule still holds — `accent` is reserved for the focal series; the palette below covers the rest.

| Token | Dark (default) | Light | Notes |
|---|---|---|---|
| `series-1` | `#3bdfef` (cyan) | `#008493` | Non-focal series |
| `series-2` | `#ff49b6` (plasma) | `#ad1275` | Non-focal series |
| `series-3` | `#ffb831` (amber) | `#9d6400` | Non-focal series |
| `series-4` | `#b093e5` (violet) | `#714ca6` | Non-focal series — derived, not a site color |
| `series-5` | `#a2a4ae` (slate) | `#61636b` | Non-focal series |

All ten values clear 3:1 against their own `paper` (dark 6.52–12.30:1, light 4.08–6.18:1).
`series-1..3` and `series-5` come straight from the site palette; `series-4` is a derived
violet at `oklch(0.72 0.12 300)` / `oklch(0.50 0.14 300)` because the brand names only four
non-accent hues and radar needs five.

Fills sit at `0.18` opacity light, `0.22` dark; strokes use the full color. **Don't backfill these tokens to non-chart types** — architecture, swimlane, etc. continue to use muted-ink variants. The series palette is opt-in for diagrams where overlapping shapes demand distinguishable color, not a license to add color elsewhere.

### Terminal skin (opt-in alternate)

A self-contained palette for the terminal-window primitive (see [primitive-terminal.md](primitive-terminal.md)) — a CLI-chrome register for dev-tool posts and technical social cards. It does not replace the default skin above and isn't affected by onboarding; it's a second, fixed skin you opt into per-diagram.

| Token | Hex | Purpose |
|---|---|---|
| `terminal-page` | `#0a0a0a` | Page background behind the window |
| `terminal-paper` | `#141414` | Window body, node fill |
| `terminal-bar` | `#1b1b1b` | Titlebar strip |
| `terminal-border` | `#2b2b2b` | Window border, hairlines |
| `terminal-ink` | `#f5f5f5` | Primary text, primary stroke (same white-smoke as default `ink`) |
| `terminal-muted` | `#9a9a9a` | Secondary text, sublabels, ring stroke |
| `terminal-soft` | `#5c5c5c` | Tertiary — inactive dots, spokes |
| `terminal-accent` | `#ff5a36` | The one accent — focal station, prompt sign, active dot |
| `terminal-accent-tint` | `rgba(255,90,54,0.12)` | Fill for accent-bordered boxes |

**1-accent rule still holds.** Everything that isn't `terminal-ink` or `terminal-muted`/`terminal-soft` should be `terminal-accent` — never introduce a second hue.

---

## Typography

| Role | Family | Size | Weight | Usage |
|---|---|---|---|---|
| `title` | Instrument Serif | 1.75rem | 400 | Page H1 |
| `node-name` | Space Grotesk (sans) | 12px | 600 | Human-readable labels |
| `sublabel` | JetBrains Mono | 9px | 400 | Port, protocol, URL, field type |
| `eyebrow` | JetBrains Mono | 7–8px | 500, tracked 0.18em, uppercase | Type tags, axis labels |
| `arrow-label` | JetBrains Mono | 8px | 400, tracked 0.06em | Arrow annotations |
| `callout` | Instrument Serif *italic* | 14px | 400 | Editorial asides only |

### Font stack

```html
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Space+Grotesk:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
```

Fallback stacks, matching the site: `"Space Grotesk", system-ui, sans-serif` and
`"JetBrains Mono", ui-monospace, monospace`.

**Load-bearing rule:** Mono is for *technical* content (ports, commands, URLs, field types).
Names go in Space Grotesk. Page title is Instrument Serif. Italic Instrument Serif is
reserved for annotation callouts (see [primitive-annotation.md](primitive-annotation.md)).

> **Deliberate override of upstream's "never JetBrains Mono" rule.** Upstream bans JetBrains
> Mono as a generic "dev font" reflex. Here it is the *brand* mono — the AI-OS site ships
> Space Grotesk + JetBrains Mono and nothing else — so brand fidelity wins. The rule it was
> protecting still holds: mono is scoped to technical content, never used as a blanket face.
> The brand ships no serif, so Instrument Serif is retained for `title` and `callout` per the
> three-family constraint below.

---

## Stroke, radius, spacing

| Token | Value | Use |
|---|---|---|
| `stroke-thin` | `0.8` | Tag-box outlines, leaf nodes |
| `stroke-default` | `1` | Most strokes |
| `stroke-strong` | `1.2` | Emphasis strokes |
| `radius-sm` | `4` | Small tags |
| `radius-md` | `6` | Node boxes |
| `radius-lg` | `8` | Containers, rings |
| `grid` | `4` | Every coord, size, and gap is divisible by 4 (hard rule) |

---

## Node type → treatment

Semantic role combinations — reference these by name in type specs.

| Type | Fill | Stroke |
|---|---|---|
| `focal` (1–2 max) | `accent-tint` | `accent` |
| `backend` | `paper-2` | `ink` |
| `store` | `ink @ 0.05` | `muted` |
| `external` | `ink @ 0.03` | `ink @ 0.30` |
| `input` | `muted @ 0.10` | `soft` |
| `optional` | `ink @ 0.02` | `ink @ 0.20` dashed `4,3` |
| `security` | `accent @ 0.05` | `accent @ 0.50` dashed `4,4` |

---

## Customizing the skin

**Inside AI-OS, do not run onboarding against this file for a one-off project.** This skill is
a symlink into the AI-OS repo, shared by every project and every CLI — rewriting the tables
above changes the skin globally and shows up as a dirty diff in the AI-OS repo. See
[`SKILL.md` §0](../SKILL.md) for the AI-OS-specific gate.

- **Changing the AI-OS brand** → edit [`context/06_brand.md`](../../../../context/06_brand.md)
  first, then propagate the semantic roles here in the same commit.
- **One project needs a different brand** (client work) → create
  `.ai-os/brand-tokens.md` in that project's root, mapping the same semantic roles. The skill
  reads it as an override for that project only and leaves this file untouched.
- **Brand handoff / design-token JSON** → map it into `.ai-os/brand-tokens.md`, not here.

### Constraints (don't break these)

- **Contrast**: `ink` must hit WCAG AA on `paper`. `muted` and `soft` must hit AA too — both
  carry 9–11px text. Verify with the WCAG 2.x ratio, don't eyeball it.
- **One accent**: `accent` is acid green and nothing else. `plasma`, `cyan`, and `amber` exist
  in the brand but are **not** second accents — `cyan` is scoped to the `link` role, and
  plasma/amber only appear in the multi-series chart palette.
- **No rainbow palette**: the brand ships 10 colors; a diagram uses 3 (paper, ink, accent).
  The rest become `muted`/`soft` variants.
- **Serif + sans + mono**: three families, not more. The AI-OS brand ships no serif, so
  Instrument Serif is retained for `title` and `callout` — the register contrast is
  load-bearing.
- **Paper is cool near-black, not pure black**: `#08090e` carries a hint of blue-violet
  (hue 275) that the whole palette shares. Pure `#000` breaks the family and kills the acid.
  In the light register, `#f4f5f9` for the same reason — never pure white.
- **Dot pattern is optional, not default**: the 22×22 dot pattern is an opt-in "dotted paper" variant (good for long-form editorial hero diagrams). The default background is a clean `paper` fill, no pattern. When the pattern is enabled, it should sit at ~10% opacity of `ink` on `paper` — visible but quiet.
- **Container is clean by default**: the diagram sits directly on the page paper, no secondary container background or border. A framed variant (`paper-2` bg + `rule` border + 8px radius + padding) is available as an opt-in for card-heavy layouts, but don't reach for it by default — the extra chrome fights the figure.
