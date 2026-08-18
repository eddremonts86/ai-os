---
name: "582-spent-5000-on-ugc-for-my-saas-here-is-what-i-learned"
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

**Inspirado en:** Loom (Video messaging, async comms, screen recording. Fun + fast.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #625DF5 | Elementos principales, acciones |
| secondary | #7B799C | Texto secundario, bordes |
| tertiary | #EE4D3A | Acentos, highlights |
| neutral | #FFFFFF | Fondos neutros |
| dark | #1D1D1F | Paneles oscuros |
| accent | #625DF5 | CTAs, notificaciones |
| text | #1D1D1F | Texto principal |
| muted | #7B799C | Texto terciario |
| bg | #F7F7F7 | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight

### Spacing (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 8px | Elementos inline |
| md | 16px | Componentes |
| lg | 32px | Secciones |
| xl | 64px | Espaciado grande |

### Border radius

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 6px | Inputs, badges |
| md | 12px | Botones, cards |
| lg | 20px | Paneles, modales |

### Components

- **Button primary:** bg #625DF5, text #1D1D1F, rounded 12px
- **Button secondary:** outline, color #625DF5, rounded 12px
- **Card:** bg #FFFFFF, rounded 20px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #625DF5 para acciones principales
- Usar rounded 12px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-15_
