---
id: "249"
slug: its-impossible-to-donate-to-animal-shelters-due-to-comp
name: "249-its-impossible-to-donate-to-animal-shelters-due-to-comp"
description: "Charity transparency. Quiet, evidence-led, audit-first. No emotional theater."
source: "Linear (custom-adapted)"

colors:
  primary:   "#5E6AD2"
  secondary: "#3D52D6"
  tertiary:  "#7C8AEC"
  neutral:   "#F7F8FA"
  dark:      "#1A1B25"
  accent:    "#22C55E"
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

The product's whole promise is verifiable. Every screen must reinforce that the chain is observable: donor → service-held funds → receipt → audit confirmation → disbursement. If the design hides any of those links, it undermines the trust it is selling.

Three principles drive the screen:

- **Receipts are first-class content.** On the donor dashboard, a donation row opens into the receipts and audit confirmations that backed it. Receipts are not buried under three clicks; they are the point.
- **Audit status is visible, not announced.** A green dot on a donation row means the auditor confirmed the underlying receipt. An amber dot means receipt uploaded but not yet reviewed. A red dot means the auditor rejected the receipt. No decoration; just a state.
- **No emotional theater.** No sad-animal hero images, no "every ruble counts" copy, no urgency timers. The product's argument is evidence, not pity. Donors who arrived through pity may convert once; donors who arrived through audit confidence may stay for years.

The MVP surface is functional: a shelter profile, a donation flow, a donor dashboard, a shelter receipt-upload console, an auditor console. There is no marketing site, no blog, no social-share card generator.
