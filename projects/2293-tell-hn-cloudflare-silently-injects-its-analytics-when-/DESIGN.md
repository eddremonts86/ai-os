---
name: "2293-tell-hn-cloudflare-silently-injects-its-analytics-when-"
description: "Deployment, developer tools, cloud. Minimal + precise."
source: "Vercel"

colors:
 primary:   "#FFFFFF"
 secondary: "#666666"
 tertiary:  "#FF5B4F"
 neutral:   "#000000"
 dark:      "#171717"
 accent:    "#0072F5"
 text:      "#171717"
 muted:     "#666666"
 bg:        "#000000"
 border:    "rgba(0,0,0,0.1)"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "2rem"
   fontWeight: "600"
   lineHeight: "1.2"
   letterSpacing: "-0.02em"
 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1rem"
   fontWeight: "400"
   lineHeight: "1.6"

 mono:
   fontFamily: "Geist Mono, JetBrains Mono, monospace"
   fontSize: "0.875rem"
   fontWeight: "400"

rounded:
 sm: "4px"
 md: "6px"
 lg: "8px"

spacing:
 sm: "4px"
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

## Vercel — Design System

**Inspirado en:** Vercel (Deployment, developer tools, cloud. Minimal + precise.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #FFFFFF | Elementos principales, acciones |
| secondary | #666666 | Texto secundario, bordes |
| tertiary | #FF5B4F | Acentos, highlights |
| neutral | #000000 | Fondos neutros |
| dark | #171717 | Paneles oscuros |
| accent | #0072F5 | CTAs, notificaciones |
| text | #171717 | Texto principal |
| muted | #666666 | Texto terciario |
| bg | #000000 | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 2rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight
- **Mono:** Geist Mono, JetBrains Mono, monospace · 0.875rem

### Spacing (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 4px | Elementos inline |
| md | 16px | Componentes |
| lg | 32px | Secciones |
| xl | 64px | Espaciado grande |

### Border radius

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 4px | Inputs, badges |
| md | 6px | Botones, cards |
| lg | 8px | Paneles, modales |

### Components

- **Button primary:** bg #FFFFFF, text #171717, rounded 6px
- **Button secondary:** outline, color #FFFFFF, rounded 6px
- **Card:** bg #000000, rounded 8px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #000000, border rgba(0,0,0,0.1), rounded 4px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 4px / 16px / 32px
- Priorizar #FFFFFF para acciones principales
- Usar rounded 6px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
