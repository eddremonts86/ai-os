---
id: "251"
slug: no-way-for-city-residents-to-order-delivery-from-local-
name: "251-no-way-for-city-residents-to-order-delivery-from-local-"
description: "Care-from-a-distance ordering. Calm, large type, mobile-first, low-bandwidth tolerant."
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

The buyer is an adult child who cares for a parent from a distance. The recipient is an elderly person who did not place the order. Both are real users; neither is a customer in the consumer-app sense. The visual register is care-grade: large type, calm colors, no urgency, no marketing copy.

Three principles drive the screen:

- **Buyer flow is mobile-first and low-bandwidth tolerant.** The buyer is often on a phone in a city apartment. The form fits one screen at 360 px wide, loads over village-edge 4G, and survives a half-second connection drop without losing the order.
- **Recipient never sees the app.** The courier hands the recipient a printed note (in Russian) that explains who sent the goods and why. The note is the recipient's UI; the rest is invisible to them.
- **No urgency, no scarcity, no marketing.** "Only 2 hours left to send Christmas gifts" copy has no place here. The product is for ongoing care, not for retail gifting.

The MVP surface is functional: an order form, a delivery-status page, a buyer dashboard, and a one-tap courier confirmation. There is no marketplace, no catalogue scroll, no "discover nearby stores" feature.
