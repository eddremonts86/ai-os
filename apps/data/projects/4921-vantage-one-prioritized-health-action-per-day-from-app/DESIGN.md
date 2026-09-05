---
name: "4921-vantage-one-prioritized-health-action-per-day-from-app"
description: "Video messaging, async comms, screen recording. Fun + fast."
source: "Loom"

colors:
 primary:   "#625DF5"
 secondary: "#7B799C"
 tertiary:  "#EE4D3A"
 neutral:   "#FFFFFF"
 dark:      "#1D1D1F"
 accent:    "#625DF5"
 text:      "#1D1D1F"
 muted:     "#7B799C"
 bg:        "#F7F7F7"
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
   lineHeight: "1.5"


rounded:
 sm: "6px"
 md: "12px"
 lg: "20px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#EE4D3A"
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

## Loom — Design System

**Inspired by:** Loom (Video messaging, async comms, screen recording. Fun + fast.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #625DF5 | Primary elements, actions |
| secondary | #7B799C | Secondary text, borders |
| tertiary | #EE4D3A | Accents, highlights |
| neutral | #FFFFFF | Neutral backgrounds |
| dark | #1D1D1F | Dark panels |
| accent | #625DF5 | CTAs, notifications |
| text | #1D1D1F | Primary text |
| muted | #7B799C | Tertiary text |
| bg | #F7F7F7 | Page background |

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
| sm | 6px | Inputs, badges |
| md | 12px | Buttons, cards |
| lg | 20px | Panels, modals |

### Components

- **Button primary:** bg #625DF5, text #1D1D1F, rounded 12px
- **Button secondary:** outline, color #625DF5, rounded 12px
- **Card:** bg #FFFFFF, rounded 20px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #625DF5 for primary actions
- Use rounded 12px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-09-03_
