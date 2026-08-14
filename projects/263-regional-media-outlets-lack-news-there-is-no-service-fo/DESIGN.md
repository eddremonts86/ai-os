---
id: "263"
slug: regional-media-outlets-lack-news-there-is-no-service-fo"
name: "263-regional-media-outlets-lack-news-there-is-no-service-fo"
description: "Editorial newsroom console. Source-first, evidence-led, no decoration."
source: "Custom newsroom-grade UI"

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

The user is an editor reading the day's shortlist at 7am with two minutes before assigning reporters. The visual register is newsroom-grade: dense lists, source-first rows, no marketing copy. The shortlist must be scannable in under a minute.

Three principles drive the screen:

- **The source link is the headline.** Each row shows the source (city council minutes, court docket, press release) and the timestamp. The one-line summary sits below; it does not replace the source.
- **The competitor-check status is visible.** A green / red badge shows whether the named competitors have already covered the story. The editor can decide whether to assign in under five seconds.
- **The feedback loop is one click.** Each row has covered / not relevant / under investigation actions right there; no separate workflow. The next morning's shortlist improves because of today's marks.

The MVP surface is functional: a morning email, an editor console, a competitor-list editor, a first-mover badge ledger. There is no public marketing site beyond a single explanatory page.
