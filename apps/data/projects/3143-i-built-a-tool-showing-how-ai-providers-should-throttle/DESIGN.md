---
name: "3143-i-built-a-tool-showing-how-ai-providers-should-throttle"
description: "Creative tool, design, collaboration. Bold + expressive."
source: "Figma"

colors:
 primary:   "#A259FF"
 secondary: "#959595"
 tertiary:  "#00D4AA"
 neutral:   "#1E1E1E"
 dark:      "#2C2C2C"
 accent:    "#FF6B00"
 text:      "#FFFFFF"
 muted:     "#959595"
 bg:        "#1E1E1E"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "2rem"
   fontWeight: "700"
   lineHeight: "1.2"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "0.9375rem"
   fontWeight: "400"
   lineHeight: "1.5"


rounded:
 sm: "6px"
 md: "8px"
 lg: "12px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "48px"

components:
 button-primary:
  backgroundColor: "#00D4AA"
  textColor: "{colors.text}"
  rounded: "{rounded.md}"
  padding: "12px 24px"
 button-secondary:
  backgroundColor: "transparent"
  textColor: "{colors.primary}"
  rounded: "{rounded.md}"
  border: "1.5px solid {colors.primary}"
 card:
  backgroundColor: "{colors.dark}"
  rounded: "{rounded.lg}"
  shadow: "0 1px 3px rgba(0,0,0,0.08)"
  border: "1px solid {colors.border}"
 input:
  backgroundColor: "{colors.dark}"
  border: "1px solid {colors.border}"
  rounded: "{rounded.sm}"
  padding: "10px 14px"
---

## Figma — Design System

**Inspired by:** Figma (Creative tool, design, collaboration. Bold + expressive.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #A259FF | Primary elements, actions |
| secondary | #959595 | Secondary text, borders |
| tertiary | #00D4AA | Accents, highlights |
| neutral | #1E1E1E | Neutral backgrounds |
| dark | #2C2C2C | Dark panels |
| accent | #FF6B00 | CTAs, notifications |
| text | #FFFFFF | Primary text |
| muted | #959595 | Tertiary text |
| bg | #1E1E1E | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 2rem · 700 weight
- **Body:** Inter, system-ui, sans-serif · 0.9375rem · 400 weight

### Spacing (8px base)

| Token | Value | Use |
|-------|-------|-----|
| sm | 8px | Inline elements |
| md | 16px | Components |
| lg | 32px | Sections |
| xl | 48px | Large spacing |

### Border radius

| Token | Value | Use |
|-------|-------|-----|
| sm | 6px | Inputs, badges |
| md | 8px | Buttons, cards |
| lg | 12px | Panels, modals |

### Components

- **Button primary:** bg #A259FF, text #FFFFFF, rounded 8px
- **Button secondary:** outline, color #A259FF, rounded 8px
- **Card:** bg #1E1E1E, rounded 12px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #1E1E1E, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #A259FF for primary actions
- Use rounded 8px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-26_
