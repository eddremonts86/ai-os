---
id: "246"
slug: users-of-credit-products-regularly-overpay-due-to-non-t
name: "246-users-of-credit-products-regularly-overpay-due-to-non-t"
description: "Customer-side financial advocate. Trust and clarity over decoration."
source: "Stripe (adapted)"

colors:
  primary:   "#0A2540"
  secondary: "#635BFF"
  tertiary:  "#00D4FF"
  neutral:   "#F6F9FC"
  dark:      "#1A1F36"
  accent:    "#22C55E"
  warning:   "#F59E0B"
  danger:    "#DC2626"
  text:      "#1A1F36"
  muted:     "#8898AA"
  bg:        "#F6F9FC"
  border:    "rgba(0,0,0,0.1)"

typography:
  heading:
    fontFamily: "SF Pro Display, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "2rem"
    fontWeight: "600"
    lineHeight: "1.2"
  body:
    fontFamily: "SF Pro Text, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1rem"
    fontWeight: "400"
    lineHeight: "1.6"
  mono:
    fontFamily: "SF Mono, JetBrains Mono, monospace"
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

The product is a financial advocate, not a bank. The interface should read as the customer's side of the table: a clean, evidence-first surface that shows what was found, where it came from, and what it cost.

Three principles drive the screen:

- **Evidence on top.** Every finding shows the line from the source document next to the plain-language explanation. The customer must be able to point at the report and say "this is mine, this is from my bank."
- **Numbers, not adjectives.** A finding says "₽1,840 over 12 months for SMS-banking," not "you may be overpaying for notifications." The poster's framing is about hidden fees becoming visible; the UI must mirror that.
- **Trust signals are structural.** A retention-policy banner on the upload screen, a deletion-on-request link on every report, no bank logo on the report itself, no "powered by" tag linking the service to any bank. The visual language stays on the Stripe-style fintech palette because it conveys precision, but bank branding is removed.

The MVP surface is small: an upload screen, a short processing indicator, and a one-page report. There is no dashboard in v1, by design — a dashboard would imply an ongoing relationship before the value is validated.
