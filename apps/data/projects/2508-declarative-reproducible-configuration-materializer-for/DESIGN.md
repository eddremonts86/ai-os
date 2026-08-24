---
name: "2508-declarative-reproducible-configuration-materializer-for"
description: "Personal workspace, notes, wiki, knowledge. Warm + calm."
source: "Notion"

colors:
 primary:   "#1A1A1A"
 secondary: "#9B9A97"
 tertiary:  "#EB5757"
 neutral:   "#FFFFFF"
 dark:      "#F7F6F3"
 accent:    "#2383E2"
 text:      "#37352F"
 muted:     "#9B9A97"
 bg:        "#F7F6F3"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.5rem"
   fontWeight: "600"
   lineHeight: "1.4"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"


rounded:
 sm: "4px"
 md: "6px"
 lg: "0px"

spacing:
 sm: "4px"
 md: "12px"
 lg: "24px"
 xl: "48px"

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

## Notion — Design System

**Inspired by:** Notion (Personal workspace, notes, wiki, knowledge. Warm + calm.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #1A1A1A | Primary elements, actions |
| secondary | #9B9A97 | Secondary text, borders |
| tertiary | #EB5757 | Accents, highlights |
| neutral | #FFFFFF | Neutral backgrounds |
| dark | #F7F6F3 | Dark panels |
| accent | #2383E2 | CTAs, notifications |
| text | #37352F | Primary text |
| muted | #9B9A97 | Tertiary text |
| bg | #F7F6F3 | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.5rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight

### Spacing (8px base)

| Token | Value | Use |
|-------|-------|-----|
| sm | 4px | Inline elements |
| md | 12px | Components |
| lg | 24px | Sections |
| xl | 48px | Large spacing |

### Border radius

| Token | Value | Use |
|-------|-------|-----|
| sm | 4px | Inputs, badges |
| md | 6px | Buttons, cards |
| lg | 0px | Panels, modals |

### Components

- **Button primary:** bg #1A1A1A, text #37352F, rounded 6px
- **Button secondary:** outline, color #1A1A1A, rounded 6px
- **Card:** bg #FFFFFF, rounded 0px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 4px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 4px / 12px / 24px scale
- Favour #1A1A1A for primary actions
- Use rounded 6px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-24_
