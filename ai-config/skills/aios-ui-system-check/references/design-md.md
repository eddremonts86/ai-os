# The canonical `DESIGN.md`

The one format `/aios-ui-system-create` and `/aios-ui-system-extract` write, and `/aios-ui-system-check`
verifies. It is the Google DESIGN.md shape that `impeccable` reads (frontmatter plus eight sections) with three
AI-OS sections appended (`System`, `Variants and patterns`, `Forms`). The project's global stylesheet is the source of truth for values; this file mirrors
the colours and records the decisions a stylesheet cannot hold.

## Rules

- **Never overwrite an existing `DESIGN.md` silently.** Show what would change and ask.
- **Frontmatter `colors` is a flat map of strings.** The light value sits under the variable's name without the leading
  dashes (`background`), the dark value under `<name>-dark` (`background-dark`). No nesting: readers of
  this format only see flat entries. Generate the block with `tokens.py frontmatter <stylesheet>`; never retype it.
- **Every contract colour variable appears twice** (light and dark). `tokens.py check` converts both sides to
  sRGB and fails when a channel differs by more than 2/255.
- **Omit a section that has nothing true to say.** No invented rules. The `typography`, `rounded`, `spacing` and
  `components` entries in the template are examples of the shape: write what the project's components really use.
- **Sections this format does not own are left alone** (Hallmark may append `## Exports`).
- Component sub-tokens use only `backgroundColor`, `textColor`, `typography`, `rounded`, `padding`, `size`,
  `height`, `width`, and reference primitives as `{colors.primary}`. Shadows, motion and focus rings are
  described in the body, not in frontmatter.

## Template

```markdown
---
name: <project>
description: <one line: what the product is and how it should feel>
colors:
  background: "oklch(…)"
  background-dark: "oklch(…)"
  foreground: "oklch(…)"
  foreground-dark: "oklch(…)"
  # …every contract colour variable, light then dark
typography:
  display: { fontFamily: "<--font-sans stack>", fontSize: "…", fontWeight: 600, lineHeight: 1.1 }
  body: { fontFamily: "<--font-sans stack>", fontSize: "1rem", fontWeight: 400, lineHeight: 1.5 }
  mono: { fontFamily: "<--font-mono stack>", fontSize: "0.875rem", fontWeight: 400, lineHeight: 1.5 }
rounded:
  base: "<--radius>"
spacing:
  unit: "<the project's spacing step>"
components:
  button-primary: { backgroundColor: "{colors.primary}", textColor: "{colors.primary-foreground}", rounded: "{rounded.base}" }
  input: { backgroundColor: "{colors.background}", textColor: "{colors.foreground}", rounded: "{rounded.base}" }
  card: { backgroundColor: "{colors.card}", textColor: "{colors.card-foreground}", rounded: "{rounded.base}" }
---

# Design: <project>

## Overview
<Two or three sentences: who it is for, the feeling, the one accent and what it is reserved for.>

## Colors
<Role of each colour group. Which pairs carry text. What the accent may and may not be used for.>

## Typography
<Families, the scale, where mono is allowed.>

## Layout
<Max width, grid, spacing rhythm, breakpoints.>

## Elevation & Depth
<The shadow scale (`--shadow-sm|md|lg`) and when each applies; borders versus shadows.>

## Shapes
<`--radius` and how components derive theirs; nothing rounded outside that scale.>

## Components
<Per component: its variants and sizes, and the states every control has (default, hover, focus, disabled,
error). Motion: `--ease-out`, `--duration-fast`, `--duration-base` and what they are for.>

## Do's and Don'ts
- Do change the look in this order: a token in the stylesheet; a variant inside the component; a wrapper
  component for a product pattern; `className` from outside only for a true one-off.
- Don't name a token after how it looks (`--blue`). Name what it is for.
- Don't fight the system: no radius, colour, shadow or spacing value outside its tokens.
<project-specific rules>

## System
- Made: <created | extracted> on <YYYY-MM-DD> with `/aios-ui-system-<create|extract>`
- Component base: <shadcn | shadcn-vue>, primitives <Base UI | Radix | React Aria | Reka>, `components.json` at <path>
- Theme source: <brief and chosen direction | "extracted from the existing code">
- Token block: <path to the stylesheet>
- Specimen page: <route or file>
<Only when the direction came from a Hallmark theme, its four lines:>
- Genre: <…>
- Shape: <…>
- Theme: <slug>
- Axes: <paper / display / accent>

## Variants and patterns
<One line per decision, newest last.>
- token `--<name>`: <why the contract's tokens did not cover it>
- variant `<component>.<variant>`: <what it is for>
- pattern `<WrapperComponent>` (`<path>`): <the product pattern it owns>

## Forms
<Written by `/aios-ui-form-create` the first time the project gets a form; its rules are in that skill's
`references/form-rules.md`. Only the project's own values go here.>
- Controls: <height> tall, `--input` edge, `--ring` focus; at least 44px on a phone
- Labels: above the control; <optional | required> fields are marked in words
- Width: <max width>, one column
- Validation: on first blur, then on change; error text under the field
- Actions: one primary, last, left-aligned
- Built with `/aios-ui-form-create` (`Field`, <form library>, `zod`)
```
