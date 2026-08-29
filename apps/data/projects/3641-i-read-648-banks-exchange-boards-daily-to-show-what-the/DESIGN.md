---
name: "3641-i-read-648-banks-exchange-boards-daily-to-show-what-the"
description: "Banking for small business, emerging markets. Warm + accessible."
source: "Northone"

colors:
 primary:   "#1A1A1A"
 secondary: "#6B6B6B"
 tertiary:  "#7B61FF"
 neutral:   "#FFFFFF"
 dark:      "#F5F5F0"
 accent:    "#00E5BE"
 text:      "#1A1A1A"
 muted:     "#6B6B6B"
 bg:        "#F5F5F0"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "600"
   lineHeight: "1.3"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"


rounded:
 sm: "8px"
 md: "12px"
 lg: "20px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#6B6B6B"
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
status: enriched
tech: [Python, FastAPI, PostgreSQL, Playwright, Pandas, htmx, Tailwind CSS]
---

## Northone — Design System

**Inspired by:** Northone (Banking for small business, emerging markets. Warm + accessible.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #1A1A1A | Primary elements, actions |
| secondary | #6B6B6B | Secondary text, borders |
| tertiary | #7B61FF | Accents, highlights |
| neutral | #FFFFFF | Neutral backgrounds |
| dark | #F5F5F0 | Dark panels |
| accent | #00E5BE | CTAs, notifications |
| text | #1A1A1A | Primary text |
| muted | #6B6B6B | Tertiary text |
| bg | #F5F5F0 | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight

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
| sm | 8px | Inputs, badges |
| md | 12px | Buttons, cards |
| lg | 20px | Panels, modals |

### Components

- **Button primary:** bg #1A1A1A, text #1A1A1A, rounded 12px
- **Button secondary:** outline, color #1A1A1A, rounded 12px
- **Card:** bg #FFFFFF, rounded 20px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 8px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #1A1A1A for primary actions
- Use rounded 12px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-28_
