---
name: "202-need-a-oneclick-solution-that-replaces-a-lecturers-voic"
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

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `202-.../SPEC.md` and the chosen stack (Python, Whisper, Coqui TTS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Hungary.

For Hungary, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.
