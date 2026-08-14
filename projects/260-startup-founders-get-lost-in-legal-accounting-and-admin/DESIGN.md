---
id: "260"
slug: startup-founders-get-lost-in-legal-accounting-and-admin
name: "260-startup-founders-get-lost-in-legal-accounting-and-admin"
description: "Founder operations console. Calm, deadline-led, ledger-style."
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

The product is a deadline-driven operations plan, not a productivity app. The visual register is operations-console: dense lists, calm colors, the next deadline always visible. A founder who opens the page on Monday morning should know in five seconds what is on the hook this week.

Three principles drive the screen:

- **Deadlines are the dominant visual element.** Every task row shows its due date prominently; overdue tasks are red. The plan is a date-aware list, not a Kanban board.
- **"Not legal advice" is structural.** Every task detail carries the disclosure at the top of the detail view, not buried in a footer. The MVP is a reminder, not a counsel.
- **The plan is exportable, not siloed.** Every plan page has a clear "export to Notion / Google Docs" action the founder can use to hand the plan to their lawyer or accountant.

The MVP surface is functional: an input form, a plan page, a per-task detail view, an export action. There is no public marketing site beyond a single explanatory page.
