---
name: "2256-tildas-terrible-support-and-the-need-for-a-premium-help"
description: "Mental health, therapy, wellness. Calm + approachable."
source: "Headspace"

colors:
 primary:   "#FFFFFF"
 secondary: "#B0B8C1"
 tertiary:  "#F7C59F"
 neutral:   "#3C3C3C"
 dark:      "#1F1F1F"
 accent:    "#83C586"
 text:      "#3C3C3C"
 muted:     "#B0B8C1"
 bg:        "#F7F7F7"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Nunito, Inter, system-ui, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "700"
   lineHeight: "1.3"

 body:
   fontFamily: "Nunito, Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"


rounded:
 sm: "12px"
 md: "20px"
 lg: "32px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#83C586"
  textColor: "{colors.text}"
  rounded: "{rounded.lg}"
  padding: "14px 28px"
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

## Headspace — Design System

**Inspirado en:** Headspace (Mental health, therapy, wellness. Calm + approachable.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #FFFFFF | Elementos principales, acciones |
| secondary | #B0B8C1 | Texto secundario, bordes |
| tertiary | #F7C59F | Acentos, highlights |
| neutral | #3C3C3C | Fondos neutros |
| dark | #1F1F1F | Paneles oscuros |
| accent | #83C586 | CTAs, notificaciones |
| text | #3C3C3C | Texto principal |
| muted | #B0B8C1 | Texto terciario |
| bg | #F7F7F7 | Fondo página |

### Typography

- **Headings:** Nunito, Inter, system-ui, sans-serif · 1.75rem · 700 weight
- **Body:** Nunito, Inter, system-ui, sans-serif · 1rem · 400 weight

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
| sm | 12px | Inputs, badges |
| md | 20px | Botones, cards |
| lg | 32px | Paneles, modales |

### Components

- **Button primary:** bg #FFFFFF, text #3C3C3C, rounded 20px
- **Button secondary:** outline, color #FFFFFF, rounded 20px
- **Card:** bg #3C3C3C, rounded 32px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #3C3C3C, border rgba(0,0,0,0.1), rounded 12px

### Do's

- Usar la tipografía Nunito de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #FFFFFF para acciones principales
- Usar rounded 20px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
