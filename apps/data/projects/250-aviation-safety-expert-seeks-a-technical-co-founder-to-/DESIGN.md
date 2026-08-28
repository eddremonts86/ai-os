---
id: "250"
slug: aviation-safety-expert-seeks-a-technical-co-founder-to-
name: "250-aviation-safety-expert-seeks-a-technical-co-founder-to-"
description: "Operations console for tower staff. Functional, no decoration. Status states are the UI."
source: "Operations console (custom)"

colors:
  primary:   "#0F172A"
  secondary: "#1E293B"
  tertiary:  "#334155"
  neutral:   "#F1F5F9"
  dark:      "#020617"
  accent:    "#0EA5E9"
  warning:   "#F59E0B"
  danger:    "#DC2626"
  success:   "#10B981"
  text:      "#0F172A"
  muted:     "#64748B"
  bg:        "#FFFFFF"
  border:    "rgba(15,23,42,0.12)"

typography:
  heading:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1.25rem"
    fontWeight: "600"
    lineHeight: "1.3"
  body:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "0.875rem"
    fontWeight: "400"
    lineHeight: "1.5"
  mono:
    fontFamily: "JetBrains Mono, monospace"
    fontSize: "0.8125rem"

rounded:
  sm: "2px"
  md: "4px"
  lg: "8px"

spacing:
  sm: "8px"
  md: "16px"
  lg: "24px"
  xl: "48px"
---

## Design direction

The end user is a tower supervisor reading the view at a glance. The visual register is operations-console, not product-page: high-contrast status states, dense lists, no marketing copy. A bird-strike alert that is missed because it looked like a notification card is a failure of design.

Three principles drive the screen:

- **State is color-coded, not icon-coded.** A green / amber / red status per contact row is enough. Tower staff should be able to read risk in under one second; redundant iconography slows that.
- **The runway context is on every row.** A contact without the runway and the active aircraft is a contact tower staff cannot act on. The view always pairs contact + classification + runway + aircraft callsign.
- **No decoration in the alert path.** Hero images, illustrations, animated transitions, and "we are proud to support" copy have no place in this surface. The alert is the UI.

The MVP surface is a desktop view only. There is no mobile app, no public dashboard, no marketing site. The system is shadow-mode advisory, so the view is for the expert and the validation team; tower staff see it as observers, not operators.
