# 06 — Brand

Canonical brand tokens for AI-OS. Any skill, diagram, slide, or generated asset that needs
brand colors or typography reads **this file**, not a hardcoded hex value.

Source of truth for the values below: `site/index.html` (the AI-OS landing page), whose CSS
custom properties are authored in oklch. Extracted and verified 2026-08-13.

---

## Palette

Authored in oklch; the sRGB hex is the conversion used wherever oklch is not safe (SVG in
older renderers, PNG export, email).

| Name | oklch | Hex | Role |
|---|---|---|---|
| `void` | `oklch(0.14 0.012 275)` | `#08090e` | Page background (dark register) |
| `void-2` | `oklch(0.11 0.012 275)` | `#040408` | Deepest background |
| `panel` | `oklch(0.18 0.016 275)` | `#0f1119` | Card / container background |
| `panel-2` | `oklch(0.22 0.018 275)` | `#181a23` | Raised surface |
| `ink` | `oklch(0.97 0.006 275)` | `#f4f5f9` | Primary text on dark; paper on light |
| `muted` | `oklch(0.72 0.014 275)` | `#a2a4ae` | Secondary text |
| `faint` | `oklch(0.56 0.014 275)` | `#72747d` | Tertiary text |
| `line` | `oklch(0.30 0.02 275)` | `#2b2d38` | Borders, hairlines |
| `acid` | `oklch(0.88 0.19 128)` | `#b3ee55` | **The** accent |
| `plasma` | `oklch(0.70 0.24 349)` | `#ff49b6` | Secondary highlight |
| `cyan` | `oklch(0.83 0.13 205)` | `#3bdfef` | Links, external references |
| `amber` | `oklch(0.83 0.16 78)` | `#ffb831` | Warnings, in-progress state |

**The palette is dark-first.** Everything shares hue ~275 (blue-violet) except the four
chromatic accents. That shared hue is what makes it read as one family — do not introduce a
neutral at a different hue.

**One accent.** `acid` is the accent. `plasma`, `cyan`, and `amber` are scoped: cyan to links,
amber to warnings, plasma to a single secondary highlight. Using three of them at once in the
same view erases the signal.

### Light register

The brand has no authored light mode. When one is needed, derive it — do not invent new hues:

| Role | Value | Note |
|---|---|---|
| paper | `#f4f5f9` | `ink` becomes the background |
| paper-2 | `#e9eaf1` | |
| text | `#08090e` | `void` becomes the text |
| secondary text | `#53555d` | `oklch(0.45 0.014 275)` |
| tertiary text | `#61636b` | `oklch(0.50 0.014 275)` |
| border | `#c9cbd6` | |
| accent | `#4f7800` | `oklch(0.52 0.15 128)` — acid darkened; bright acid is 1.3:1 on light paper and unusable as stroke or text |
| link | `#007583` | `oklch(0.50 0.12 205)` — cyan darkened |

Bright `acid` survives in the light register only as a low-opacity tint fill, never as a
stroke or a text color.

### Contrast (verified, WCAG 2.x)

Dark on `#08090e`: ink 18.26:1 · muted 8.01:1 · faint 4.27:1 · acid 14.47:1 · cyan 12.30:1.
Light on `#f4f5f9`: text 18.26:1 · secondary 6.82:1 · tertiary 5.50:1 · accent 4.80:1 · link 4.98:1.

> `faint` at 4.27:1 **fails AA for small text.** It is fine for 14px+ or decorative use. Any
> role carrying 9–11px text must use `oklch(0.60 0.014 275)` = `#7d8089` (5.04:1) instead.

---

## Typography

| Role | Family | Fallback stack |
|---|---|---|
| Sans / UI / headings | **Space Grotesk** | `"Space Grotesk", system-ui, sans-serif` |
| Mono / technical | **JetBrains Mono** | `"JetBrains Mono", ui-monospace, monospace` |

```html
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
```

The brand ships **no serif**. Where a third register is genuinely load-bearing (editorial
titles and asides in diagrams), Instrument Serif is the approved addition — see
`ai-config/skills/diagram-design/references/style-guide.md`.

Mono is scoped to technical content: commands, paths, ports, field types, code. Never a
blanket face for body text.

---

## Geometry

| Token | Value |
|---|---|
| `radius` | `14px` |
| `radius-sm` | `9px` |
| `maxw` | `1180px` |
| `ease` | `cubic-bezier(0.16, 1, 0.3, 1)` |

---

## Consumers

Skills and files that read these tokens. Update them in the same commit when the brand changes:

- `ai-config/skills/diagram-design/references/style-guide.md` — diagram skin (dark-first).
- `site/index.html` — the origin of the values; changes here start there.

### Per-project override

For client work with a different brand, create `.ai-os/brand-tokens.md` in that project's
root, mapping the same semantic role names. Skills prefer it over this file when present. Do
not edit this file or a skill's style guide for a single project — those are global.
