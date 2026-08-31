---
name: "3923-skud"
description: "Delivery, logistics, food. Dark mode + orange energy."
source: "DoorDash"

colors:
 primary:   "#FF3008"
 secondary: "#909090"
 tertiary:  "#00F1D4"
 neutral:   "#FFFFFF"
 dark:      "#1C1C1C"
 accent:    "#FF3008"
 text:      "#1C1C1C"
 muted:     "#909090"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "700"
   lineHeight: "1.2"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.5"


rounded:
 sm: "6px"
 md: "10px"
 lg: "16px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#FF3008"
  textColor: "{colors.text}"
  rounded: "{rounded.md}"
  padding: "12px 24px"
  borderRadius: "{rounded.md}"
 button-secondary:
  backgroundColor: "transparent"
  textColor: "{colors.primary}"
  rounded: "{rounded.md}"
  border: "1.5px solid {colors.primary}"
 card:
  backgroundColor: "{colors.dark}"
  rounded: "{rounded.lg}"
  shadow: "0 1px 3px rgba(0,0,0,0.08)"
 input:
  backgroundColor: "{colors.neutral}"
  border: "1.5px solid {colors.border}"
  rounded: "{rounded.sm}"
  padding: "10px 14px"
---

## DoorDash — Design System

**Inspired by:** DoorDash (Delivery, logistics, food. Dark mode + orange energy.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #FF3008 | Primary elements, actions |
| secondary | #909090 | Secondary text, borders |
| tertiary | #00F1D4 | Accents, highlights |
| neutral | #FFFFFF | Neutral backgrounds |
| dark | #1C1C1C | Dark panels |
| accent | #FF3008 | CTAs, notifications |
| text | #1C1C1C | Primary text |
| muted | #909090 | Tertiary text |
| bg | #FFFFFF | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 700 weight
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
| sm | 6px | Inputs, badges |
| md | 10px | Buttons, cards |
| lg | 16px | Panels, modals |

### Components

- **Button primary:** bg #FF3008, text #1C1C1C, rounded 10px
- **Button secondary:** outline, color #FF3008, rounded 10px
- **Card:** bg #FFFFFF, rounded 16px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #FF3008 for primary actions
- Use rounded 10px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-30_
