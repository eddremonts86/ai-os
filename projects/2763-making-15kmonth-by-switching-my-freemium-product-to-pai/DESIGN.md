---
name: "2763-making-15kmonth-by-switching-my-freemium-product-to-pai"
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

**Inspirado en:** Notion (Personal workspace, notes, wiki, knowledge. Warm + calm.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #1A1A1A | Elementos principales, acciones |
| secondary | #9B9A97 | Texto secundario, bordes |
| tertiary | #EB5757 | Acentos, highlights |
| neutral | #FFFFFF | Fondos neutros |
| dark | #F7F6F3 | Paneles oscuros |
| accent | #2383E2 | CTAs, notificaciones |
| text | #37352F | Texto principal |
| muted | #9B9A97 | Texto terciario |
| bg | #F7F6F3 | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.5rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight

### Spacing (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 4px | Elementos inline |
| md | 12px | Componentes |
| lg | 24px | Secciones |
| xl | 48px | Espaciado grande |

### Border radius

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 4px | Inputs, badges |
| md | 6px | Botones, cards |
| lg | 0px | Paneles, modales |

### Components

- **Button primary:** bg #1A1A1A, text #37352F, rounded 6px
- **Button secondary:** outline, color #1A1A1A, rounded 6px
- **Card:** bg #FFFFFF, rounded 0px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 4px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 4px / 12px / 24px
- Priorizar #1A1A1A para acciones principales
- Usar rounded 6px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
