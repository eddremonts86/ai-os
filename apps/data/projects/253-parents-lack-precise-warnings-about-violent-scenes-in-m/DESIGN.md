---
id: "253"
slug: parents-lack-precise-warnings-about-violent-scenes-in-m
name: "253-parents-lack-precise-warnings-about-violent-scenes-in-m"
description: "Family-safe content catalogue. Calm, evidence-led, severity-coded."
source: "Common Sense Media (custom-adapted)"

colors:
  primary:   "#1F4E79"
  secondary: "#2E7D32"
  tertiary:  "#EF6C00"
  warning:   "#F59E0B"
  danger:    "#C62828"
  neutral:   "#FAFAFA"
  dark:      "#212121"
  text:      "#212121"
  muted:     "#616161"
  bg:        "#FFFFFF"
  border:    "rgba(33,33,33,0.12)"

severity:
  mild:     "#FDECEA"
  moderate: "#FFE0B2"
  severe:   "#FFCDD2"

typography:
  heading:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1.5rem"
    fontWeight: "600"
    lineHeight: "1.3"
  body:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1rem"
    fontWeight: "400"
    lineHeight: "1.6"
  mono:
    fontFamily: "JetBrains Mono, monospace"
    fontSize: "0.875rem"

rounded:
  sm: "4px"
  md: "8px"
  lg: "12px"

spacing:
  sm: "8px"
  md: "16px"
  lg: "32px"
  xl: "64px"
---

## Design direction

The product is a parent's reference, not a critic's review. The visual register is calm and information-first: severity is the only signal that pops, and everything else stays in a quiet palette.

Three principles drive the screen:

- **Severity is the only colour that matters.** Mild / moderate / severe are color-coded so a parent can scan the page in under a second and find the scenes that matter. Decorative color elsewhere is avoided.
- **Spoiler discipline is structural.** Warning text is short (one sentence per scene), describes *what is shown* without *why it happens*, and never names a character. The submission form must enforce the same constraint.
- **Curator attribution is visible.** Every warning carries the curator's name and review date. Parents using the page can adjust their trust accordingly; pretending severity is mechanical erodes that.

The MVP surface is functional: a per-film page, a search and filter view, a scene-skip view, a curator console. There is no marketing site beyond a single explanatory page.
