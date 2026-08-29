---
name: "3718-snippety-a-native-text-expander-for-mac-and-iphone"
description: "Travel, hospitality, marketplace. Warm, human, trustworthy."
source: "Airbnb"

colors:
 primary:   "#FF385C"
 secondary: "#717166"
 tertiary:  "#00A699"
 neutral:   "#FFFFFF"
 dark:      "#F7F7F7"
 accent:    "#FF385C"
 text:      "#222222"
 muted:     "#717166"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Circular, -apple-system, BlinkMacSystemFont, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "700"
   lineHeight: "1.2"

 body:
   fontFamily: "Circular, -apple-system, BlinkMacSystemFont, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.5"


rounded:
 sm: "8px"
 md: "12px"
 lg: "24px"

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

## Airbnb — Design System

**Inspired by:** Airbnb (Travel, hospitality, marketplace. Warm, human, trustworthy.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #FF385C | Primary elements, actions |
| secondary | #717166 | Secondary text, borders |
| tertiary | #00A699 | Accents, highlights |
| neutral | #FFFFFF | Neutral backgrounds |
| dark | #F7F7F7 | Dark panels |
| accent | #FF385C | CTAs, notifications |
| text | #222222 | Primary text |
| muted | #717166 | Tertiary text |
| bg | #FFFFFF | Page background |

### Typography

- **Headings:** Circular, -apple-system, BlinkMacSystemFont, sans-serif · 1.75rem · 700 weight
- **Body:** Circular, -apple-system, BlinkMacSystemFont, sans-serif · 1rem · 400 weight

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
| lg | 24px | Panels, modals |

### Components

- **Button primary:** bg #FF385C, text #222222, rounded 12px
- **Button secondary:** outline, color #FF385C, rounded 12px
- **Card:** bg #FFFFFF, rounded 24px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 8px

### Do's

- Use the Circular typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #FF385C for primary actions
- Use rounded 12px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-29_
