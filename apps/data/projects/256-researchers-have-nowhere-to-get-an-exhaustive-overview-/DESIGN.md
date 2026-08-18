---
id: "256"
slug: researchers-have-nowhere-to-get-an-exhaustive-overview-"
name: "256-researchers-have-nowhere-to-get-an-exhaustive-overview-"
description: "Academic-grade overview surface. Citation-first, coverage-disclosed, no decoration."
source: "arXiv / OpenAlex (custom-adapted)"

colors:
  primary:   "#1F2937"
  secondary: "#374151"
  tertiary:  "#6B7280"
  neutral:   "#F9FAFB"
  dark:      "#111827"
  accent:    "#B91C1C"
  warning:   "#B45309"
  text:      "#111827"
  muted:     "#6B7280"
  bg:        "#FFFFFF"
  border:    "rgba(17,24,39,0.10)"

typography:
  heading:
    fontFamily: "Charter, Georgia, serif"
    fontSize: "1.5rem"
    fontWeight: "600"
    lineHeight: "1.3"
  body:
    fontFamily: "Charter, Georgia, serif"
    fontSize: "1rem"
    fontWeight: "400"
    lineHeight: "1.65"
  mono:
    fontFamily: "JetBrains Mono, monospace"
    fontSize: "0.875rem"

rounded:
  sm: "2px"
  md: "4px"
  lg: "8px"

spacing:
  sm: "8px"
  md: "16px"
  lg: "32px"
  xl: "64px"
---

## Design direction

The user is a researcher who has spent years reading papers. The visual register is academic: serif body, restrained palette, citation footnotes that read like footnotes, no decorative motion.

Three principles drive the screen:

- **Citation is a first-class element, not an afterthought.** Every claim in the synthesis carries a footnote number; the footnote resolves to a paper the user can open. The citation chain is the product's argument.
- **Coverage disclosure is on the page, not in a footnote.** The overview shows the source list, the date span, the paper count, and the indexed-as-of date in a visible block. The researcher can see what was searched.
- **No decoration in the synthesis path.** No icons, no color-coded categories beyond a single accent for citation markers, no marketing copy. The synthesis is the page.

The MVP surface is functional: an overview page, a search surface, an export action. There is no marketing site beyond a single explanatory page about coverage and limitations.
