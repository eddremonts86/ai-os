---
name: "2210-problem-of-finding-and-obtaining-grants-for-small-busin"
description: "Banking for small business, emerging markets. Warm + accessible."
source: "Northone"

colors:
 primary:   "#1A1A1A"
 secondary: "#6B6B6B"
 tertiary:  "#7B61FF"
 neutral:   "#FFFFFF"
 dark:      "#F5F5F0"
 accent:    "#00E5BE"
 text:      "#1A1A1A"
 muted:     "#6B6B6B"
 bg:        "#F5F5F0"
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


rounded:
 sm: "8px"
 md: "12px"
 lg: "20px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#6B6B6B"
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
  border: "1px solid rgba(0,0,0,0.06)"
 input:
  backgroundColor: "{colors.neutral}"
  border: "1px solid rgba(0,0,0,0.1)"
  rounded: "{rounded.sm}"
  padding: "10px 14px"
 badge:
  backgroundColor: "{colors.accent}"
  color: "#fff"
  rounded: "{rounded.sm}"
  padding: "4px 8px"
  fontSize: "12px"
---

## Northone — Design System

**Inspirado en:** Northone (Banking for small business, emerging markets. Warm + accessible.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #1A1A1A | Elementos principales, acciones |
| secondary | #6B6B6B | Texto secundario, bordes |
| tertiary | #7B61FF | Acentos, highlights |
| neutral | #FFFFFF | Fondos neutros |
| dark | #F5F5F0 | Paneles oscuros |
| accent | #00E5BE | CTAs, notificaciones |
| text | #1A1A1A | Texto principal |
| muted | #6B6B6B | Texto terciario |
| bg | #F5F5F0 | Fondo página |

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
| sm | 8px | Inputs, badges |
| md | 12px | Botones, cards |
| lg | 20px | Paneles, modales |

### Components

- **Button primary:** bg #1A1A1A, text #1A1A1A, rounded 12px
- **Button secondary:** outline, color #1A1A1A, rounded 12px
- **Card:** bg #FFFFFF, rounded 20px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 8px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #1A1A1A para acciones principales
- Usar rounded 12px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
