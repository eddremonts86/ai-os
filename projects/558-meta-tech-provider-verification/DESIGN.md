---
name: "558-meta-tech-provider-verification"
description: "Auth, identity, security. Dark + trustworthy."
source: "Clerk"

colors:
 primary:   "#7435F1"
 secondary: "#5E60CE"
 tertiary:  "#00C9C7"
 neutral:   "#151515"
 dark:      "#1F1F1F"
 accent:    "#7435F1"
 text:      "#FFFFFF"
 muted:     "#8A8A8A"
 bg:        "#0F0F0F"
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
 lg: "16px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#00C9C7"
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

## Clerk — Design System

**Inspirado en:** Clerk (Auth, identity, security. Dark + trustworthy.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #7435F1 | Elementos principales, acciones |
| secondary | #5E60CE | Texto secundario, bordes |
| tertiary | #00C9C7 | Acentos, highlights |
| neutral | #151515 | Fondos neutros |
| dark | #1F1F1F | Paneles oscuros |
| accent | #7435F1 | CTAs, notificaciones |
| text | #FFFFFF | Texto principal |
| muted | #8A8A8A | Texto terciario |
| bg | #0F0F0F | Fondo página |

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
| lg | 16px | Paneles, modales |

### Components

- **Button primary:** bg #7435F1, text #FFFFFF, rounded 12px
- **Button secondary:** outline, color #7435F1, rounded 12px
- **Card:** bg #151515, rounded 16px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #151515, border rgba(0,0,0,0.1), rounded 8px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #7435F1 para acciones principales
- Usar rounded 12px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-14_
