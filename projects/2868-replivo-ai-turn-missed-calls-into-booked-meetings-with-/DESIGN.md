---
name: "2868-replivo-ai-turn-missed-calls-into-booked-meetings-with-"
description: "Scheduling, booking, calendar. Clean + professional."
source: "Cal.com"

colors:
 primary:   "#000000"
 secondary: "#666666"
 tertiary:  "#2563EB"
 neutral:   "#FAFAFA"
 dark:      "#111111"
 accent:    "#EA580C"
 text:      "#000000"
 muted:     "#666666"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.5rem"
   fontWeight: "600"
   lineHeight: "1.3"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "0.9375rem"
   fontWeight: "400"
   lineHeight: "1.6"


rounded:
 sm: "6px"
 md: "8px"
 lg: "12px"

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

## Cal.com — Design System

**Inspirado en:** Cal.com (Scheduling, booking, calendar. Clean + professional.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #000000 | Elementos principales, acciones |
| secondary | #666666 | Texto secundario, bordes |
| tertiary | #2563EB | Acentos, highlights |
| neutral | #FAFAFA | Fondos neutros |
| dark | #111111 | Paneles oscuros |
| accent | #EA580C | CTAs, notificaciones |
| text | #000000 | Texto principal |
| muted | #666666 | Texto terciario |
| bg | #FFFFFF | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.5rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 0.9375rem · 400 weight

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
| md | 8px | Botones, cards |
| lg | 12px | Paneles, modales |

### Components

- **Button primary:** bg #000000, text #000000, rounded 8px
- **Button secondary:** outline, color #000000, rounded 8px
- **Card:** bg #FAFAFA, rounded 12px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FAFAFA, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #000000 para acciones principales
- Usar rounded 8px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
