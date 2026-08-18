---
id: "261"
slug: uk-property-investors-have-nowhere-to-quickly-and-relia
name: "261-uk-property-investors-have-nowhere-to-quickly-and-relia"
description: "Investor estimate + contractor panel. Numbers-first, evidence-led."
source: "Custom investor-ops UI"

colors:
  primary:   "#0F172A"
  secondary: "#1E293B"
  tertiary:  "#0E7490"
  neutral:   "#F8FAFC"
  dark:      "#020617"
  accent:    "#10B981"
  warning:   "#F59E0B"
  danger:    "#DC2626"
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

The product is a number-and-evidence surface, not a marketplace. The visual register is investor-ops: dense tables, the estimate band visible at a glance, contractor verification status front and centre. Decoration competes with the investor's ability to size a deal.

Three principles drive the screen:

- **The estimate band is the page.** Low / mid / high numbers are visible without scrolling. A single number is never shown; the band is the honest output.
- **Verification status is the contractor's headline.** Each contractor row shows verification status (verified / unverified / pending) and the number of references. Star ratings the platform invents are not used.
- **The PDF is the deliverable.** The investor shares the PDF with a broker or a lender; the PDF must look defensible on its own without the website. Branding, estimate band, and contractor shortlist all carry into the PDF.

The MVP surface is functional: an intake form, an estimate view, a contractor shortlist view, a PDF report. There is no public marketplace, no blog, no marketing site beyond a single explanatory page.
