---
name: "121-problem-of-finding-a-workout-partner-in-a-new-gym"
description: "Fintech premium. Pagos, bancos, dinero. Confianza + precisión."
source: "Stripe"

colors:
 primary:   "#0A2540"
 secondary: "#635BFF"
 tertiary:  "#00D4FF"
 neutral:   "#F6F9FC"
 dark:      "#1A1F36"
 accent:    "#22C55E"
 text:      "#1A1F36"
 muted:     "#8898AA"
 bg:        "#F6F9FC"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "SF Pro Display, -apple-system, BlinkMacSystemFont, sans-serif"
   fontSize: "2rem"
   fontWeight: "600"
   lineHeight: "1.2"

 body:
   fontFamily: "SF Pro Text, -apple-system, BlinkMacSystemFont, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"

 mono:
   fontFamily: "SF Mono, JetBrains Mono, monospace"
   fontSize: "0.875rem"
   fontWeight: "400"

rounded:
 sm: "4px"
 md: "8px"
 lg: "12px"

spacing:
 sm: "8px"
 md: "16px"
 lg: "32px"
 xl: "64px"

components:
 button-primary:
  backgroundColor: "#635BFF"
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

## Stripe — Design System

**Inspirado en:** Stripe (Fintech premium. Pagos, bancos, dinero. Confianza + precisión.)

### Paleta de colores

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #0A2540 | Elementos principales, acciones |
| secondary | #635BFF | Texto secundario, bordes |
| tertiary | #00D4FF | Acentos, highlights |
| neutral | #F6F9FC | Fondos neutros |
| dark | #1A1F36 | Paneles oscuros |
| accent | #22C55E | CTAs, notificaciones |
| text | #1A1F36 | Texto principal |
| muted | #8898AA | Texto terciario |
| bg | #F6F9FC | Fondo página |

### Tipografía

- **Headings:** SF Pro Display, -apple-system, BlinkMacSystemFont, sans-serif · 2rem · 600 weight
- **Body:** SF Pro Text, -apple-system, BlinkMacSystemFont, sans-serif · 1rem · 400 weight
- **Mono:** SF Mono, JetBrains Mono, monospace · 0.875rem

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
| sm | 4px | Inputs, badges |
| md | 8px | Botones, cards |
| lg | 12px | Paneles, modales |

### Componentes

- **Button primary:** bg #0A2540, text #1A1F36, rounded 8px
- **Button secondary:** outline, color #0A2540, rounded 8px
- **Card:** bg #F6F9FC, rounded 12px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #F6F9FC, border rgba(0,0,0,0.1), rounded 4px

### Do's

- Usar la tipografía SF Pro Text de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #0A2540 para acciones principales
- Usar rounded 8px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-08_
