---
name: "4448-waseigo"
description: "Landing pages, creative web, prototyping. Bold + modern."
source: "Framer"

colors:
 primary:   "#000000"
 secondary: "#636366"
 tertiary:  "#0066FF"
 neutral:   "#FAFAFA"
 dark:      "#0A0A0A"
 accent:    "#0A0A0A"
 text:      "#000000"
 muted:     "#636366"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "2.5rem"
   fontWeight: "800"
   lineHeight: "1.1"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"


rounded:
 sm: "8px"
 md: "12px"
 lg: "24px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "40px"
 xl: "80px"

components:
 button-primary:
  backgroundColor: "{colors.primary}"
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
 input:
  backgroundColor: "{colors.neutral}"
  border: "1.5px solid {colors.border}"
  rounded: "{rounded.sm}"
  padding: "10px 14px"
---

## Framer — Design System

**Inspired by:** Framer (Landing pages, creative web, prototyping. Bold + modern.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #000000 | Primary elements, actions |
| secondary | #636366 | Secondary text, borders |
| tertiary | #0066FF | Accents, highlights |
| neutral | #FAFAFA | Neutral backgrounds |
| dark | #0A0A0A | Dark panels |
| accent | #0A0A0A | CTAs, notifications |
| text | #000000 | Primary text |
| muted | #636366 | Tertiary text |
| bg | #FFFFFF | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 2.5rem · 800 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight

### Spacing (8px base)

| Token | Value | Use |
|-------|-------|-----|
| sm | 8px | Inline elements |
| md | 16px | Components |
| lg | 40px | Sections |
| xl | 80px | Large spacing |

### Border radius

| Token | Value | Use |
|-------|-------|-----|
| sm | 8px | Inputs, badges |
| md | 12px | Buttons, cards |
| lg | 24px | Panels, modals |

### Components

- **Button primary:** bg #000000, text #000000, rounded 12px
- **Button secondary:** outline, color #000000, rounded 12px
- **Card:** bg #FAFAFA, rounded 24px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FAFAFA, border rgba(0,0,0,0.1), rounded 8px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 8px / 16px / 40px scale
- Favour #000000 for primary actions
- Use rounded 12px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-09-01_
