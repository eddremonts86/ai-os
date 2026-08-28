---
name: "1013-ai-contributor-only-projects"
description: "Developer tool, project management, productivity. Dark + precise."
source: "Linear"

colors:
 primary:   "#FFFFFF"
 secondary: "#8A8F98"
 tertiary:  "#655DE6"
 neutral:   "#0D0D0F"
 dark:      "#191919"
 accent:    "#10B981"
 text:      "#FFFFFF"
 muted:     "#8A8F98"
 bg:        "#0D0D0F"
 border:    "#2E2E3A"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "600"
   lineHeight: "1.3"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "0.9rem"
   fontWeight: "400"
   lineHeight: "1.5"

 mono:
   fontFamily: "JetBrains Mono, SF Mono, monospace"
   fontSize: "0.8125rem"
   fontWeight: "400"

rounded:
 sm: "4px"
 md: "6px"
 lg: "8px"

spacing:
 sm: "4px"
 md: "12px"
 lg: "24px"
 xl: "48px"

components:
 button-primary:
  backgroundColor: "#655DE6"
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

## Linear — Design System

**Inspired by:** Linear (Developer tool, project management, productivity. Dark + precise.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #FFFFFF | Primary elements, actions |
| secondary | #8A8F98 | Secondary text, borders |
| tertiary | #655DE6 | Accents, highlights |
| neutral | #0D0D0F | Neutral backgrounds |
| dark | #191919 | Dark panels |
| accent | #10B981 | CTAs, notifications |
| text | #FFFFFF | Primary text |
| muted | #8A8F98 | Tertiary text |
| bg | #0D0D0F | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 0.9rem · 400 weight
- **Mono:** JetBrains Mono, SF Mono, monospace · 0.8125rem

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
| lg | 8px | Panels, modals |

### Components

- **Button primary:** bg #FFFFFF, text #FFFFFF, rounded 6px
- **Button secondary:** outline, color #FFFFFF, rounded 6px
- **Card:** bg #0D0D0F, rounded 8px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #0D0D0F, border #2E2E3A, rounded 4px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 4px / 12px / 24px scale
- Favour #FFFFFF for primary actions
- Use rounded 6px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-18_
