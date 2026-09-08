---
name: "4930-both-recent-gcp-outages-caused-by-fiber-optic-maintena"
description: "Scheduling, booking, calendar. Clean + professional."
source: "Cal.com"

colors:
 primary:   "#000000"
 secondary: "#666666"
 tertiary:  "#2563EB"
 neutral:   "#FAFAFA"
 dark:      "#111111"
 accent:    "#EA580C"
 text:      "#000000"
 muted:     "#666666"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.5rem"
   fontWeight: "600"
   lineHeight: "1.3"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "0.9375rem"
   fontWeight: "400"
   lineHeight: "1.6"


rounded:
 sm: "6px"
 md: "8px"
 lg: "12px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

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

## Cal.com — Design System

**Inspired by:** Cal.com (Scheduling, booking, calendar. Clean + professional.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #000000 | Primary elements, actions |
| secondary | #666666 | Secondary text, borders |
| tertiary | #2563EB | Accents, highlights |
| neutral | #FAFAFA | Neutral backgrounds |
| dark | #111111 | Dark panels |
| accent | #EA580C | CTAs, notifications |
| text | #000000 | Primary text |
| muted | #666666 | Tertiary text |
| bg | #FFFFFF | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.5rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 0.9375rem · 400 weight

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
| md | 8px | Buttons, cards |
| lg | 12px | Panels, modals |

### Components

- **Button primary:** bg #000000, text #000000, rounded 8px
- **Button secondary:** outline, color #000000, rounded 8px
- **Card:** bg #FAFAFA, rounded 12px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FAFAFA, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #000000 for primary actions
- Use rounded 8px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-09-03_
