---
name: aios-ui-system-extract
description: Turn what an existing app already uses into its design system - inventory the CSS variables, literals and Tailwind classes, map them onto shadcn token names for approval, then write the token block, DESIGN.md and a specimen page. Explicit invocation, /aios-ui-system-extract [dir].
disable-model-invocation: true
---

# aios-ui-system-extract

`T="$AI_OS_ROOT/ai-config/skills/aios-ui-system-check/scripts/tokens.py"`, run as `python3 "$T" <cmd>`
(`python` on Windows). The contract and the
`DESIGN.md` format are in `aios-ui-system-check` (`SKILL.md`, `references/design-md.md`): read both first.

Detection, not invention: the values the app already uses become the system. Nothing new is designed here;
a project that wants a new look uses `/aios-ui-redesign` or `/aios-ui-system-create`.

## Steps

1. **Inventory.** `python3 "$T" scan <dir>` lists the custom properties per selector, the colour, radius, shadow and
   font literals with counts and files, the Tailwind palette classes and arbitrary values, and which contract
   variables exist or are missing. Read the main button, input, card, dialog and navigation components for
   their variants (the scan order in `impeccable`'s `reference/document.md`).
2. **Running app.** If the project's own dev server is up (localhost), sample the computed styles of `body`,
   headings, links, buttons, inputs and cards in the browser and add them: they catch values the files hide.
   Other people's sites are out of scope here.
3. **Mapping, approved once.** Assign de facto values to the contract by role and frequency, and show one
   table: role, chosen value (in OKLCH), where it came from, how often it is used, and its contrast. Flag
   what you had to derive because the app has no value for it (a dark mode, a missing `-foreground`).
   Write nothing before the user approves the table. With no user to answer (a loop), take the mapping and say so.
4. **Write.** Put the token block in the global stylesheet, replacing same-named variables in place, adding
   the missing ones, leaving every other variable untouched (where each kind goes under Tailwind v4 is in
   `/aios-ui-system-create` step 4). Write `DESIGN.md` from the template, its `colors` block from
   `python3 "$T" frontmatter <stylesheet>`; if one exists, show what would change and ask.
5. **Specimen page** and 6. **Verify**, exactly as `/aios-ui-system-create` steps 7 and 8 describe them.
7. **Report what is left.** From `python3 "$T" scan`: how many literals and arbitrary values still sit in the code.
   Moving them onto the tokens is `/aios-ui-improve`, not this command.

Called by `/aios-ui-themes lock` and `/aios-ui-design` in a project that has a `components.json`, so one
`DESIGN.md` format is written there.
