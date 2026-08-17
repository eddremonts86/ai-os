---
name: "2657-hopsum-making-routers-do-arithmetic-with-expired-packet"
description: "Developer tool, project management, productivity. Dark + precise."
source: "Linear"

colors:
 primary:   "#FFFFFF"
 secondary: "#8A8F98"
 tertiary:  "#655DE6"
 neutral:   "#0D0D0F"
 dark:      "#191919"
 accent:    "#10B981"
 text:      "#FFFFFF"
 muted:     "#8A8F98"
 bg:        "#0D0D0F"
 border:    "#2E2E3A"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "1.75rem"
   fontWeight: "600"
   lineHeight: "1.3"

 body:
   fontFamily: "Inter, system-ui, sans-serif"
   fontSize: "0.9rem"
   fontWeight: "400"
   lineHeight: "1.5"

 mono:
   fontFamily: "JetBrains Mono, SF Mono, monospace"
   fontSize: "0.8125rem"
   fontWeight: "400"

rounded:
 sm: "4px"
 md: "6px"
 lg: "8px"

spacing:
 sm: "4px"
 md: "12px"
 lg: "24px"
 xl: "48px"

components:
 button-primary:
  backgroundColor: "#655DE6"
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

## Linear — Design System

**Inspirado en:** Linear (Developer tool, project management, productivity. Dark + precise.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #FFFFFF | Elementos principales, acciones |
| secondary | #8A8F98 | Texto secundario, bordes |
| tertiary | #655DE6 | Acentos, highlights |
| neutral | #0D0D0F | Fondos neutros |
| dark | #191919 | Paneles oscuros |
| accent | #10B981 | CTAs, notificaciones |
| text | #FFFFFF | Texto principal |
| muted | #8A8F98 | Texto terciario |
| bg | #0D0D0F | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 0.9rem · 400 weight
- **Mono:** JetBrains Mono, SF Mono, monospace · 0.8125rem

### Spacing (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 4px | Elementos inline |
| md | 12px | Componentes |
| lg | 24px | Secciones |
| xl | 48px | Espaciado grande |

### Border radius

| Token | Valor | Uso |
|-------|-------|-----|
| sm | 4px | Inputs, badges |
| md | 6px | Botones, cards |
| lg | 8px | Paneles, modales |

### Components

- **Button primary:** bg #FFFFFF, text #FFFFFF, rounded 6px
- **Button secondary:** outline, color #FFFFFF, rounded 6px
- **Card:** bg #0D0D0F, rounded 8px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #0D0D0F, border #2E2E3A, rounded 4px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 4px / 12px / 24px
- Priorizar #FFFFFF para acciones principales
- Usar rounded 6px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
