---
id: "254"
slug: solar-installation-companies-lack-a-platform-for-end-to
name: "254-solar-installation-companies-lack-a-platform-for-end-to"
description: "Project-status timeline. Quiet, ledger-style, overdue-as-red."
source: "Linear (custom-adapted)"

colors:
  primary:   "#5E6AD2"
  secondary: "#3D52D6"
  tertiary:  "#7C8AEC"
  neutral:   "#F7F8FA"
  dark:      "#1A1B25"
  accent:    "#F59E0B"
  success:   "#10B981"
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

The product is a status timeline, not a dashboard. The customer's first question is "where is my project?"; the answer must be readable in under five seconds. Decoration competes with that.

Three principles drive the screen:

- **The timeline is the page.** The customer status page is a single vertical timeline: milestone, date, status note, attachment. There is no sidebar, no cross-sell, no marketing banner. Decoration is excluded so the timeline can dominate.
- **Overdue is red, on time is muted.** A milestone that is past its expected date shows as overdue (red); an on-time milestone shows as muted (grey). The customer should not have to interpret color to know whether the project is on track.
- **The installer's voice is plain Portuguese, not jargon.** The status note is a sentence the installer would actually type ("permit submitted to Enel SP on 12/03, awaiting approval"). The MVP's milestone labels (homologação, art, vistoria) are localised but the notes are conversational.

The MVP surface is functional: a customer status page, an installer console, a weekly digest email. There is no public marketing site beyond a single explanatory page.
