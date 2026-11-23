---
name: aios-ui-system-create
description: Create a complete design system from a brief for a project that has none - three directions to pick from, the full shadcn token set in OKLCH for light and dark, component variants, DESIGN.md and a specimen page, contrast-checked. Explicit invocation, /aios-ui-system-create "<brief>".
disable-model-invocation: true
---

# aios-ui-system-create

`T="python3 $AI_OS_ROOT/ai-config/skills/aios-ui-system-check/scripts/tokens.py"`. The contract and the
`DESIGN.md` format are in `aios-ui-system-check` (`SKILL.md`, `references/design-md.md`): read both first.

shadcn is not a component library to restyle from outside; it is the base of a system the project owns. So
the look is decided in this order, and each decision is written down:

1. a **token** in the global stylesheet (semantic name, OKLCH; never a name like `--blue`);
2. a **variant** inside the component (cva) for a reusable style;
3. a **wrapper component** for a product pattern (a metric card, a page header);
4. `className` from outside only for a true one-off.

## Steps

1. **Scope and state.** `ai-os scope which`: a scope or brand system wins on its own surfaces, so stop there
   unless the user asks. A root `DESIGN.md` means the project has a system: stop and offer
   `/aios-ui-system-check`. Code but no `DESIGN.md`: say that `/aios-ui-system-extract` keeps what exists and
   ask which they want. A fresh shadcn scaffold with default tokens is fine to continue.
2. **References.** With ui-indexador enabled: `design_notes`, `list_captures`, `search_themes` and `get_theme`
   for the brief. Without it: shadcn's own theme presets. Name the sources to the user; take structure and
   proportion from them, never a copy.
3. **Three directions.** Deal and show them as pictures the way `/aios-ui-design` step 2 does (send them: the
   user often follows from the phone), say which fits the brief and why, and wait for the pick.
4. **Tokens.** Write the whole contract into the project's global stylesheet, replacing same-named variables in
   place and leaving other project variables alone. One accent; neutrals share a hue. Then `$T contrast
   <stylesheet>` and adjust until every pair passes.
5. **Components.** Use the project's `components.json`, or initialise shadcn per `shadcn-patterns`. Carry the
   direction through tokens first, then variants, then wrappers; never a literal value in a component
   (rule 27).
6. **`DESIGN.md`.** Write it from the template, including `## System` and one line per variant and wrapper in
   `## Variants and patterns`.
7. **Specimen page.** One page in the project's own stack: the palette in both modes, the type scale, radius,
   shadows, and the button, input and card variants with their states.
8. **Verify.** `$T check` must exit 0, then `/aios-ui-verify` on the specimen page. Look at the screenshots
   (light and dark, desktop and mobile) and send them.

Fonts from Google Fonts or Fontshare: say so, and self-host them for anything that ships.
