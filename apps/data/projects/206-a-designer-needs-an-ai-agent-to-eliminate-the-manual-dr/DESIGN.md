---
name: "206-a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr"
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

**Inspirado en:** Figma (Creative tool, design, collaboration. Bold + expressive.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #A259FF | Elementos principales, acciones |
| secondary | #959595 | Texto secundario, bordes |
| tertiary | #00D4AA | Acentos, highlights |
| neutral | #1E1E1E | Fondos neutros |
| dark | #2C2C2C | Paneles oscuros |
| accent | #FF6B00 | CTAs, notificaciones |
| text | #FFFFFF | Texto principal |
| muted | #959595 | Texto terciario |
| bg | #1E1E1E | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 2rem · 700 weight
- **Body:** Inter, system-ui, sans-serif · 0.9375rem · 400 weight

### Spacing (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 8px | Elementos inline |
| md | 16px | Componentes |
| lg | 32px | Secciones |
| xl | 48px | Espaciado grande |

### Border radius

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 6px | Inputs, badges |
| md | 8px | Botones, cards |
| lg | 12px | Paneles, modales |

### Components

- **Button primary:** bg #A259FF, text #FFFFFF, rounded 8px
- **Button secondary:** outline, color #A259FF, rounded 8px
- **Card:** bg #1E1E1E, rounded 12px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #1E1E1E, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #A259FF para acciones principales
- Usar rounded 8px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-14_
