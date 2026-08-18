---
name: "need-a-tool-that-automatically-finds-people-in-social-m"
description: "Design tokens for plan 200 (social, USA)."
source: "AI-OS enrich"
---

## Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

**Design direction:** Spreadsheet-density workhorse: dense lists, keyboard navigation, fast filters. Dark by default; one primary CTA: 'Run query'.

### Visual notes

- Use a single, consistent type ramp; do not mix system fonts without reason.
- All interactive elements must show a visible focus state.
- Read density (rows-per-screen) should match the data the user works with, not default to a marketing layout.
- Colour palette is project-specific; tokens live below.

### Tokens (project-level)

| Token | Value |
|-------|-------|
| bg | #FFFFFF |
| fg | #0D0D0F |
| muted | #6B7280 |
| accent | #4F46E5 |
| success | #10B981 |
| warning | #F59E0B |
| danger | #EF4444 |
| border | #E5E7EB |

### Typography

- Body: Inter, system-ui, sans-serif, 0.9rem, line-height 1.5
- Heading: Inter, system-ui, sans-serif, 1.5rem, weight 600
- Mono: JetBrains Mono, SF Mono, monospace, 0.8125rem

### Do's

- Keep navigation predictable; one primary action per screen.
- Show loading and empty states explicitly.

### Don'ts

- Don't reach for icon-only controls when a word would be clearer.
- Don't add marketing-style hero imagery where the data IS the product.

---

_Generated for plan 200 on 2026-04-28._
