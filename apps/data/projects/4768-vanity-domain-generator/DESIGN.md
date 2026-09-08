---
name: "4768-vanity-domain-generator"
description: "Deployment, developer tools, cloud. Minimal + precise."
source: "Vercel"

colors:
 primary:   "#FFFFFF"
 secondary: "#666666"
 tertiary:  "#FF5B4F"
 neutral:   "#000000"
 dark:      "#171717"
 accent:    "#0072F5"
 text:      "#171717"
 muted:     "#666666"
 bg:        "#000000"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "2rem"
   fontWeight: "600"
   lineHeight: "1.2"
   letterSpacing: "-0.02em"
 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"

 mono:
   fontFamily: "Geist Mono, JetBrains Mono, monospace"
   fontSize: "0.875rem"
   fontWeight: "400"

rounded:
 sm: "4px"
 md: "6px"
 lg: "8px"

spacing:
 sm: "4px"
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

## Vercel — Design System

**Inspired by:** Vercel (Deployment, developer tools, cloud. Minimal + precise.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #FFFFFF | Primary elements, actions |
| secondary | #666666 | Secondary text, borders |
| tertiary | #FF5B4F | Accents, highlights |
| neutral | #000000 | Neutral backgrounds |
| dark | #171717 | Dark panels |
| accent | #0072F5 | CTAs, notifications |
| text | #171717 | Primary text |
| muted | #666666 | Tertiary text |
| bg | #000000 | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 2rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight
- **Mono:** Geist Mono, JetBrains Mono, monospace · 0.875rem

### Spacing (8px base)

| Token | Value | Use |
|-------|-------|-----|
| sm | 4px | Inline elements |
| md | 16px | Components |
| lg | 32px | Sections |
| xl | 64px | Large spacing |

### Border radius

| Token | Value | Use |
|-------|-------|-----|
| sm | 4px | Inputs, badges |
| md | 6px | Buttons, cards |
| lg | 8px | Panels, modals |

### Components

- **Button primary:** bg #FFFFFF, text #171717, rounded 6px
- **Button secondary:** outline, color #FFFFFF, rounded 6px
- **Card:** bg #000000, rounded 8px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #000000, border rgba(0,0,0,0.1), rounded 4px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 4px / 16px / 32px scale
- Favour #FFFFFF for primary actions
- Use rounded 6px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-09-03_
