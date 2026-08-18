---
name: "745-real-working-conditions-cant-be-verified-before-taking-"
description: "Premium fintech. Payments, banking, money. Trust + precision."
source: "Stripe"

colors:
 primary:   "#0A2540"
 secondary: "#635BFF"
 tertiary:  "#00D4FF"
 neutral:   "#F6F9FC"
 dark:      "#1A1F36"
 accent:    "#22C55E"
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
   fontWeight: "400"

rounded:
 sm: "4px"
 md: "8px"
 lg: "12px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#635BFF"
  textColor: "{colors.text}"
  rounded: "{rounded.md}"
  padding: "12px 24px"
 button-secondary:
  backgroundColor: "transparent"
  textColor: "{colors.primary}"
  rounded: "{rounded.md}"
  border: "1.5px solid {colors.primary}"
 card:
  backgroundColor: "{colors.neutral}"
  rounded: "{rounded.lg}"
  shadow: "0 1px 3px rgba(0,0,0,0.08)"
  border: "1px solid rgba(0,0,0,0.06)"
 input:
  backgroundColor: "{colors.neutral}"
  border: "1px solid rgba(0,0,0,0.1)"
  rounded: "{rounded.sm}"
  padding: "10px 14px"
 badge:
  backgroundColor: "{colors.accent}"
  color: "#fff"
  rounded: "{rounded.sm}"
  padding: "4px 8px"
  fontSize: "12px"
---

## Stripe — Design System

**Inspired by:** Stripe (Premium fintech. Payments, banking, money. Trust + precision.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #0A2540 | Primary elements, actions |
| secondary | #635BFF | Secondary text, borders |
| tertiary | #00D4FF | Accents, highlights |
| neutral | #F6F9FC | Neutral backgrounds |
| dark | #1A1F36 | Dark panels |
| accent | #22C55E | CTAs, notifications |
| text | #1A1F36 | Primary text |
| muted | #8898AA | Tertiary text |
| bg | #F6F9FC | Page background |

### Typography

- **Headings:** SF Pro Display, -apple-system, BlinkMacSystemFont, sans-serif · 2rem · 600 weight
- **Body:** SF Pro Text, -apple-system, BlinkMacSystemFont, sans-serif · 1rem · 400 weight
- **Mono:** SF Mono, JetBrains Mono, monospace · 0.875rem

### Spacing (8px base)

| Token | Value | Use |
|-------|-------|-----|
| sm | 8px | Inline elements |
| md | 16px | Components |
| lg | 32px | Sections |
| xl | 64px | Large spacing |

### Border radius

| Token | Value | Use |
|-------|-------|-----|
| sm | 4px | Inputs, badges |
| md | 8px | Buttons, cards |
| lg | 12px | Panels, modals |

### Components

- **Button primary:** bg #0A2540, text #1A1F36, rounded 8px
- **Button secondary:** outline, color #0A2540, rounded 8px
- **Card:** bg #F6F9FC, rounded 12px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #F6F9FC, border rgba(0,0,0,0.1), rounded 4px

### Do's

- Use the SF Pro Text typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #0A2540 for primary actions
- Use rounded 8px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-18_
