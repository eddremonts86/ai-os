---
name: "2569-multi-mailbox-for-developer-inbox-resend"
description: "Developer tools, database, open source. Technical + vibrant."
source: "Supabase"

colors:
 primary:   "#1A1A1A"
 secondary: "#666666"
 tertiary:  "#3ECF8E"
 neutral:   "#FAFAFA"
 dark:      "#1A1A1A"
 accent:    "#3ECF8E"
 text:      "#1A1A1A"
 muted:     "#666666"
 bg:        "#FFFFFF"
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

 mono:
   fontFamily: "JetBrains Mono, SF Mono, monospace"
   fontSize: "0.875rem"
   fontWeight: "400"

rounded:
 sm: "6px"
 md: "8px"
 lg: "16px"

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

## Supabase — Design System

**Inspirado en:** Supabase (Developer tools, database, open source. Technical + vibrant.)

### Colour palette

| Token | Hex | Uso |
|-------|-----|-----|
| primary | #1A1A1A | Elementos principales, acciones |
| secondary | #666666 | Texto secundario, bordes |
| tertiary | #3ECF8E | Acentos, highlights |
| neutral | #FAFAFA | Fondos neutros |
| dark | #1A1A1A | Paneles oscuros |
| accent | #3ECF8E | CTAs, notificaciones |
| text | #1A1A1A | Texto principal |
| muted | #666666 | Texto terciario |
| bg | #FFFFFF | Fondo página |

### Typography

- **Headings:** Inter, system-ui, sans-serif · 1.75rem · 600 weight
- **Body:** Inter, system-ui, sans-serif · 1rem · 400 weight
- **Mono:** JetBrains Mono, SF Mono, monospace · 0.875rem

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
| lg | 16px | Paneles, modales |

### Components

- **Button primary:** bg #1A1A1A, text #1A1A1A, rounded 8px
- **Button secondary:** outline, color #1A1A1A, rounded 8px
- **Card:** bg #FAFAFA, rounded 16px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #FAFAFA, border rgba(0,0,0,0.1), rounded 6px

### Do's

- Usar la tipografía Inter de forma consistente
- Aplicar spacing según la escala de 8px / 16px / 32px
- Priorizar #1A1A1A para acciones principales
- Usar rounded 8px en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · 2026-08-17_
