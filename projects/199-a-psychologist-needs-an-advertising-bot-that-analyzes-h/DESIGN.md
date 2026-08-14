---
name: "a-psychologist-needs-an-advertising-bot-that-analyzes-h"
description: "Design tokens for plan 199 (marketing, Russia)."
source: "AI-OS enrich"
---

## A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.

**Design direction:** Russian-language UI; calm low-saturation palette. Read-mostly dashboard (today's calendar load, today's ad spend, last 5 changes) with a single primary action: pause automation.

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

_Generated for plan 199 on 2026-07-20._
