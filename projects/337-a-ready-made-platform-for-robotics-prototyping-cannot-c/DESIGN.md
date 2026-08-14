---
name: "337-a-ready-made-platform-for-robotics-prototyping-cannot-c"
description: "Landing pages, creative web, prototyping. Bold + modern."
source: "Framer"

colors:
 primary:   "#000000"
 secondary: "#636366"
 tertiary:  "#0066FF"
 neutral:   "#FAFAFA"
 dark:      "#0A0A0A"
 accent:    "#0A0A0A"
 text:      "#000000"
 muted:     "#636366"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "2.5rem"
   fontWeight: "800"
   lineHeight: "1.1"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"


rounded:
 sm: "8px"
 md: "12px"
 lg: "24px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "40px"
 xl: "80px"

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

## Framer — Design System

**Inspirado en:** Framer (Landing pages, creative web, prototyping. Bold + modern.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #000000 | Elementos principales, acciones |
| secondary | #636366 | Texto secundario, bordes |
| tertiary | #0066FF | Acentos, highlights |
| neutral | #FAFAFA | Fondos neutros |
| dark | #0A0A0A | Paneles oscuros |
| accent | #0A0A0A | CTAs, notificaciones |
| text | #000000 | Texto principal |
| muted | #636366 | Texto terciario |
| bg | #FFFFFF | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 2.5rem · 800 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight

### Spacing (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 8px | Elementos inline |
| md | 16px | Componentes |
| lg | 40px | Secciones |
| xl | 80px | Espaciado grande |

### Border radius

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 8px | Inputs, badges |
| md | 12px | Botones, cards |
| lg | 24px | Paneles, modales |

### Components

- **Button primary:** bg #000000, text #000000, rounded 12px
- **Button secondary:** outline, color #000000, rounded 12px
- **Card:** bg #FAFAFA, rounded 24px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FAFAFA, border rgba(0,0,0,0.1), rounded 8px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 40px
- Priorizar #000000 para acciones principales
- Usar rounded 12px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-14_
