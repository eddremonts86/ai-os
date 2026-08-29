---
name: "797-its-difficult-for-parents-of-newborns-in-india-to-organ"
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
status: enriched
tech: [TypeScript, Bun runtime, Hono, PostgreSQL, Drizzle ORM, Redis, Practo / Indian doctor-directory API (or licensed equivalent), WhatsApp Business API, Razorpay or UPI payment integration, Cowin-style vaccination-schedule lookup (open data), Coolify]
---

## Headspace — Design System

**Inspired by:** Headspace (Mental health, therapy, wellness. Calm + approachable.)

### Colour palette

| Token | Hex | Use |
|-------|-----|-----|
| primary | #FFFFFF | Primary elements, actions |
| secondary | #B0B8C1 | Secondary text, borders |
| tertiary | #F7C59F | Accents, highlights |
| neutral | #3C3C3C | Neutral backgrounds |
| dark | #1F1F1F | Dark panels |
| accent | #83C586 | CTAs, notifications |
| text | #3C3C3C | Primary text |
| muted | #B0B8C1 | Tertiary text |
| bg | #F7F7F7 | Page background |

### Typography

- **Headings:** Nunito, Inter, system-ui, sans-serif · 1.75rem · 700 weight
- **Body:** Nunito, Inter, system-ui, sans-serif · 1rem · 400 weight

### Spacing (8px base)

| Token | Value | Use |
|-------|-------|-----|
| sm | 8px | Inline elements |
| md | 16px | Components |
| lg | 32px | Sections |
| xl | 64px | Large spacing |

### Border radius

| Token | Value | Use |
|-------|-------|-----|
| sm | 12px | Inputs, badges |
| md | 20px | Buttons, cards |
| lg | 32px | Panels, modals |

### Components

- **Button primary:** bg #FFFFFF, text #3C3C3C, rounded 20px
- **Button secondary:** outline, color #FFFFFF, rounded 20px
- **Card:** bg #3C3C3C, rounded 32px, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg #3C3C3C, border rgba(0,0,0,0.1), rounded 12px

### Do's

- Use the Nunito typeface consistently
- Apply spacing on the 8px / 16px / 32px scale
- Favour #FFFFFF for primary actions
- Use rounded 20px on every interactive element

### Don'ts

- Do not use more than 2 type weights in the same context
- Do not apply shadows above 0.1 opacity
- Do not mix palettes from different systems

---

_Generado por ProblemHunt Design DNA · 2026-08-18_
