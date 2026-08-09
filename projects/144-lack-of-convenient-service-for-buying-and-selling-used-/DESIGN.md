---
name: "144-lack-of-convenient-service-for-buying-and-selling-used-"
description: "Travel, hospitality, marketplace. Warm, human, trustworthy."
source: "Airbnb"

colors:
 primary:   "#FF385C"
 secondary: "#717166"
 tertiary:  "#00A699"
 neutral:   "#FFFFFF"
 dark:      "#F7F7F7"
 accent:    "#FF385C"
 text:      "#222222"
 muted:     "#717166"
 bg:        "#FFFFFF"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Circular, -apple-system, BlinkMacSystemFont, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "700"
   lineHeight: "1.2"

 body:
   fontFamily: "Circular, -apple-system, BlinkMacSystemFont, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.5"


rounded:
 sm: "8px"
 md: "12px"
 lg: "24px"

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

## Airbnb — Design System

**Inspirado en:** Airbnb (Travel, hospitality, marketplace. Warm, human, trustworthy.)

### Paleta de colores

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #FF385C | Elementos principales, acciones |
| secondary | #717166 | Texto secundario, bordes |
| tertiary | #00A699 | Acentos, highlights |
| neutral | #FFFFFF | Fondos neutros |
| dark | #F7F7F7 | Paneles oscuros |
| accent | #FF385C | CTAs, notificaciones |
| text | #222222 | Texto principal |
| muted | #717166 | Texto terciario |
| bg | #FFFFFF | Fondo página |

### Tipografía

- **Headings:** Circular, -apple-system, BlinkMacSystemFont, sans-serif · 1.75rem · 700 weight
- **Body:** Circular, -apple-system, BlinkMacSystemFont, sans-serif · 1rem · 400 weight


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
| lg | 24px | Paneles, modales |

### Componentes

- **Button primary:** bg #FF385C, text #222222, rounded 12px
- **Button secondary:** outline, color #FF385C, rounded 12px
- **Card:** bg #FFFFFF, rounded 24px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FFFFFF, border rgba(0,0,0,0.1), rounded 8px

### Do's

- Usar la tipografía Circular de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #FF385C para acciones principales
- Usar rounded 12px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-08_
