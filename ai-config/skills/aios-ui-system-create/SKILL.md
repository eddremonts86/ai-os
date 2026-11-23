---
name: aios-ui-system-create
description: Create a complete design system from a brief for a project that has none - three directions to pick from, the full shadcn token set in OKLCH for light and dark, component variants, DESIGN.md and a specimen page, contrast-checked. Explicit invocation, /aios-ui-system-create "<brief>".
disable-model-invocation: true
---

# aios-ui-system-create

`T="$AI_OS_ROOT/ai-config/skills/aios-ui-system-check/scripts/tokens.py"`, run as `python3 "$T" <cmd>`
(`python` on Windows). The contract and the
`DESIGN.md` format are in `aios-ui-system-check` (`SKILL.md`, `references/design-md.md`): read both first.

shadcn is not a component library to restyle from outside; it is the base of a system the project owns. So
the look is decided in this order, and each decision is written down:

1. a **token** in the global stylesheet (semantic name, OKLCH; never a name like `--blue`);
2. a **variant** inside the component (cva) for a reusable style;
3. a **wrapper component** for a product pattern (a metric card, a form field);
4. `className` from outside only for a true one-off.

## Steps

1. **Scope and state.** `ai-os scope which`: stop only when the scope it names has its own design system
   (that system wins on its surfaces); a scope without one continues. A root `DESIGN.md` means the project has
   a system: stop and offer `/aios-ui-system-check`. UI code but no `DESIGN.md`: say that
   `/aios-ui-system-extract` keeps what exists and ask which they want. A fresh shadcn scaffold with default
   tokens continues, after deleting the scaffold's demo page and its CSS.
2. **References.** With ui-indexador enabled: `design_notes` and `list_captures` for the kind of surface,
   `search_themes` by a one-word `vibe` (a whole brief as `q` finds nothing), `get_theme` for the close ones.
   If the gallery has nothing for this kind of surface, say so and go on. Without ui-indexador: shadcn's own
   theme presets. Name the sources; take proportion and structure from them, never the values.
3. **Three directions, far apart.** Per direction: a name, the idea in one line, neutrals (hue and warmth),
   the one accent, type, radius, density, and how depth is shown (hairlines or shadows). Where pictures help,
   `/aios-ui-themes deal "<brief>"` supplies them (send them: the user often follows from the phone). Say
   which fits the brief and why, and wait for the pick. With no user to answer, take your pick and say so.
4. **Tokens.** Write the whole contract into the project's global stylesheet, replacing same-named variables
   in place and leaving other project variables alone. Under Tailwind v4:
   - colours and `--radius` go in `:root` and `.dark`;
   - `--font-sans` and `--font-mono` go in `@theme inline`;
   - `--shadow-sm|md|lg` and `--ease-out` go in `@theme` (in `:root` the `shadow-md` utility ignores them);
   - `--duration-fast|base` go in `:root`, with `--transition-duration-fast: var(--duration-fast)` (and
     `-base`) in `@theme inline` so `duration-fast` exists as a class.

   One accent colour, in `--primary` and `--ring`; shadcn's `--accent` is a hover surface and stays neutral.
   Neutrals share one hue. Then `python3 "$T" contrast <stylesheet>` and adjust until every pair passes.
5. **Components.** Use the project's `components.json`, or initialise shadcn per `shadcn-patterns`. Carry the
   direction through tokens first, then variants, then wrappers. Stock components ship arbitrary colour and
   length values and `transition-all`: rewrite those onto tokens (rule 27); grid templates may stay.
6. **`DESIGN.md`.** Write it from the template. Generate the `colors` block with `python3 "$T" frontmatter <stylesheet>`,
   never by retyping. Include `## System` and one line per added token, variant and wrapper in
   `## Variants and patterns`.
7. **Specimen page.** With a router, the route `/specimen`; without, `src/specimen.tsx` rendered by the app
   root. It shows the palette of both modes side by side (declare the light block as `:root, .light` so a
   light panel can sit inside the dark page), the type scale, radius, shadows, and the button, input and card
   variants. Default, disabled and invalid states are rendered; hover and focus are triggered when the
   screenshots are taken. No marketing content.
8. **Verify.** `python3 "$T" check` must exit 0. Then `/aios-ui-verify` on the specimen page, served from the production
   build, with `--slices 4` so the phone shot is readable. Before it runs: make `<html>` follow
   `prefers-color-scheme` (shadcn's dark is the `.dark` class, and without that every "dark" shot is the light
   page), and add `axe-core` as a dev dependency or the accessibility verdict is not checked. Run `antislop.py`
   on `src`, not on one file; its words-per-screen gate does not apply to a specimen. Look at the screenshots
   (light and dark, desktop and phone), check every wrapper there and not only in the code (a `className` can
   lose to a part's own size classes), fix what is off and shoot again, then send them.

Fonts from Google Fonts or Fontshare: say so, and self-host them for anything that ships.
