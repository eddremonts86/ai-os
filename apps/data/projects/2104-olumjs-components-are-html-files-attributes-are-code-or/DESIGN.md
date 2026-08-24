---
name: "2104-olumjs-components-are-html-files-attributes-are-code-or"
description: "Developer tools, database, open source. Technical + vibrant."
source: "Supabase"

colors:
 primary:   "#1A1A1A"
 secondary: "#666666"
 tertiary:  "#3ECF8E"
 neutral:   "#FAFAFA"
 dark:      "#1A1A1A"
 accent:    "#3ECF8E"
 text:      "#1A1A1A"
 muted:     "#666666"
 bg:        "#FFFFFF"
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

 mono:
   fontFamily: "JetBrains Mono, SF Mono, monospace"
   fontSize: "0.875rem"
   fontWeight: "400"

rounded:
 sm: "6px"
 md: "8px"
 lg: "16px"

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

## Supabase — Design System

**Inspired by:** Supabase (Developer tools, database, open source. Technical + vibrant.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #1A1A1A | Primary elements, actions |
| secondary | #666666 | Secondary text, borders |
| tertiary | #3ECF8E | Accents, highlights |
| neutral | #FAFAFA | Neutral backgrounds |
| dark | #1A1A1A | Dark panels |
| accent | #3ECF8E | CTAs, notifications |
| text | #1A1A1A | Primary text |
| muted | #666666 | Tertiary text |
| bg | #FFFFFF | Page background |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight
- **Mono:** JetBrains Mono, SF Mono, monospace · 0.875rem

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
| lg | 16px | Panels, modals |

### Components

- **Button primary:** bg #1A1A1A, text #1A1A1A, rounded 8px
- **Button secondary:** outline, color #1A1A1A, rounded 8px
- **Card:** bg #FAFAFA, rounded 16px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FAFAFA, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Use the Inter typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #1A1A1A for primary actions
- Use rounded 8px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-20_
