---
id: "255"
slug: its-difficult-for-parents-of-newborns-in-india-to-organ
name: "255-its-difficult-for-parents-of-newborns-in-india-to-organ"
description: "Care-grade booking. Calm, mobile-first, WhatsApp-native."
source: "Custom care-grade UI"

colors:
  primary:   "#0F766E"
  secondary: "#115E59"
  tertiary:  "#0E7490"
  neutral:   "#F8FAFC"
  dark:      "#0F172A"
  accent:    "#22C55E"
  warning:   "#B45309"
  danger:    "#B91C1C"
  text:      "#0F172A"
  muted:     "#64748B"
  bg:        "#FFFFFF"
  border:    "rgba(15,23,42,0.12)"

typography:
  heading:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1.5rem"
    fontWeight: "600"
    lineHeight: "1.3"
  body:
    fontFamily: "Inter, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1.0625rem"
    fontWeight: "400"
    lineHeight: "1.6"
  mono:
    fontFamily: "JetBrains Mono, monospace"
    fontSize: "0.875rem"

rounded:
  sm: "6px"
  md: "10px"
  lg: "16px"

spacing:
  sm: "12px"
  md: "20px"
  lg: "32px"
  xl: "64px"
---

## Design direction

The parent using this surface is often post-delivery, on a phone, and not in a state to fight a complex form. The visual register is care-grade: large type, calm colors, no urgency, no marketing copy.

Three principles drive the screen:

- **Search is one screen, results are one screen, booking is one screen.** A parent should be able to search, see results, and book in three taps. Anything that adds a screen adds friction a parent will not push through.
- **Clinic confirmations live in WhatsApp.** The clinic never logs into a portal in v1. The parent never has to call to chase a confirmation. The booking state is reflected in WhatsApp messages, not on a status page the parent has to remember.
- **Medical scope is honest.** The schedule is clearly attributed to the IAP recommendation. "Consult your paediatrician" appears at decision points. The MVP does not invent clinical guidance.

The MVP surface is functional: a parent search, a parent booking, a parent schedule tracker, a clinic WhatsApp flow. There is no marketing site beyond a single explanatory page.
