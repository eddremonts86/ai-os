---
name: "2085-students-between-two-provinces-depend-on-unpredictable-"
description: "Delivery, logistics, food. Dark mode + orange energy."
source: "DoorDash"

colors:
 primary:   "#FF3008"
 secondary: "#909090"
 tertiary:  "#00F1D4"
 neutral:   "#FFFFFF"
 dark:      "#1C1C1C"
 accent:    "#FF3008"
 text:      "#1C1C1C"
 muted:     "#909090"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "700"
   lineHeight: "1.2"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.5"


rounded:
 sm: "6px"
 md: "10px"
 lg: "16px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#FF3008"
  textColor: "{colors.text}"
  rounded: "{rounded.md}"
  padding: "12px 24px"
  borderRadius: "{rounded.md}"
 button-secondary:
  backgroundColor: "transparent"
  textColor: "{colors.primary}"
  rounded: "{rounded.md}"
  border: "1.5px solid {colors.primary}"
 card:
  backgroundColor: "{colors.dark}"
  rounded: "{rounded.lg}"
  shadow: "0 1px 3px rgba(0,0,0,0.08)"
 input:
  backgroundColor: "{colors.neutral}"
  border: "1.5px solid {colors.border}"
  rounded: "{rounded.sm}"
  padding: "10px 14px"
---

## DoorDash — Design System

**Inspirado en:** DoorDash (Delivery, logistics, food. Dark mode + orange energy.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #FF3008 | Elementos principales, acciones |
| secondary | #909090 | Texto secundario, bordes |
| tertiary | #00F1D4 | Acentos, highlights |
| neutral | #FFFFFF | Fondos neutros |
| dark | #1C1C1C | Paneles oscuros |
| accent | #FF3008 | CTAs, notificaciones |
| text | #1C1C1C | Texto principal |
| muted | #909090 | Texto terciario |
| bg | #FFFFFF | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 700 weight
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
| md | 10px | Botones, cards |
| lg | 16px | Paneles, modales |

### Components

- **Button primary:** bg #FF3008, text #1C1C1C, rounded 10px
- **Button secondary:** outline, color #FF3008, rounded 10px
- **Card:** bg #FFFFFF, rounded 16px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #FF3008 para acciones principales
- Usar rounded 10px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
