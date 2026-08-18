---
id: "258"
slug: problem-analysis-owners-of-small-b2b-businesses-cannot-
name: "258-problem-analysis-owners-of-small-b2b-businesses-cannot-"
description: "Operations-grade B2B growth console. Ledger-style, weekly-cadre, French-first."
source: "Linear (custom-adapted)"

colors:
  primary:   "#5E6AD2"
  secondary: "#3D52D6"
  tertiary:  "#7C8AEC"
  neutral:   "#F7F8FA"
  dark:      "#1A1B25"
  accent:    "#10B981"
  warning:   "#F59E0B"
  danger:    "#DC2626"
  text:      "#1A1B25"
  muted:     "#8A8F98"
  bg:        "#FBFBFB"
  border:    "rgba(26,27,37,0.10)"

typography:
  heading:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1.5rem"
    fontWeight: "600"
    lineHeight: "1.3"
  body:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "0.9375rem"
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

The product is a weekly discipline loop, not a campaign tool. The visual register is operations-console: dense lists, calm colors, no urgency, no marketing copy. The owner must be able to look at the dashboard on Sunday evening and decide whether the system is moving.

Three principles drive the screen:

- **The dashboard is the page.** No sidebar of unrelated tools, no upsell banners. The owner's first visit shows pipeline value, leads-by-source, conversion rate, top campaign, stuck deals. Anything that competes with that list is excluded.
- **French is the default.** The dashboard, the activity log, and the monthly review template are in French. A future English toggle is out of scope; the source is in France.
- **Honest numbers, no placeholders.** A row that says "no data this week" is more useful than a row that shows 0 with a green check. The MVP's design must accept an honest empty state as a valid state.

The MVP surface is functional: a dashboard, an activity log, a monthly review template, a consultant booking page. There is no public marketing site beyond a single explanatory page.
