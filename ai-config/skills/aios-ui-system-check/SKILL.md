---
name: aios-ui-system-check
description: Verify a project's design system mechanically - every shadcn token defined for light and dark, WCAG contrast on each text pair, and DESIGN.md matching the stylesheet. Read-only, exits non-zero on a failure. Explicit invocation, /aios-ui-system-check [dir].
disable-model-invocation: true
---

# aios-ui-system-check

`T="python3 $AI_OS_ROOT/ai-config/skills/aios-ui-system-check/scripts/tokens.py"` (standard library only, same
on macOS and Windows). This skill owns what the three `aios-ui-system-*` commands share: that script and the
canonical format in `references/design-md.md`.

## The contract a system must meet

- **Colour variables, in both `:root` and `.dark`:** `--background`, `--foreground`, `--card`, `--popover`,
  `--primary`, `--secondary`, `--muted`, `--accent` (the last six each with `-foreground`), `--destructive`,
  `--border`, `--input`, `--ring`, `--chart-1` to `--chart-5`, `--sidebar`, `--sidebar-foreground`,
  `--sidebar-primary`, `--sidebar-primary-foreground`, `--sidebar-accent`, `--sidebar-accent-foreground`,
  `--sidebar-border`, `--sidebar-ring`.
- **Single-mode variables, once in `:root` or `@theme`:** `--radius`, `--font-sans`, `--font-mono`,
  `--shadow-sm`, `--shadow-md`, `--shadow-lg`, `--ease-out`, `--duration-fast`, `--duration-base`. A shadow may
  reference a per-mode `--shadow-color`; on dark surfaces depth comes from a lighter surface, not a shadow.
- **Contrast:** 4.5:1 for every `X` / `X-foreground` pair, `foreground` on `background`, and
  `muted-foreground` on `background` and on `card`, and `destructive` on `background` (error text); 3:1 for
  `ring` and for `input` (the field's edge) on `background`.
- **`DESIGN.md`** at the project root, in the canonical format, with colours equal to the stylesheet.

## Run

1. `$T check [<dir>]` from the project. It finds the stylesheet through `components.json` (`tailwind.css`),
   else `src/index.css`, `src/styles/globals.css`, `app/globals.css`, `src/app/globals.css`. To check files in
   two places: `$T check --stylesheet <css> --design <DESIGN.md>`.
2. Report each failure line as it is printed. Do not fix anything: a missing or failing token is fixed in the
   stylesheet by `/aios-ui-system-create` or `/aios-ui-system-extract`, or by hand, then checked again.
3. For drift in the code that uses the system (literals, arbitrary values, one-off copies of components), run
   the `design-system-keeper` agent and `/aios-ui-verify`; `$T scan <dir>` gives the counts.

`$T contrast <stylesheet>` prints every pair's ratio on its own when only that is wanted, and
`$T frontmatter <stylesheet>` prints the `colors:` block for `DESIGN.md`.

Limits: the script reads source, not the built CSS, so it cannot tell that Tailwind inlined a variable away;
`primary` used as text (a link variant) is not a checked pair; `scan` does not see Tailwind's paren values
(`gap-(--x)`) and counts a grid template like any other arbitrary value.
