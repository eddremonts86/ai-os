---
name: aios-ui-system-check
description: Verify a project's design system mechanically - every shadcn token defined for light and dark, WCAG contrast on each text pair, and DESIGN.md matching the stylesheet. Read-only, exits non-zero on a failure. Explicit invocation, /aios-ui-system-check [dir].
disable-model-invocation: true
---

# aios-ui-system-check

`T="$AI_OS_ROOT/ai-config/skills/aios-ui-system-check/scripts/tokens.py"`, run as `python3 "$T" <cmd>`
(`python` on Windows) (standard library only, same
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
  `ring` (on `background` and `card`) and for `input` (the field's edge) on `background`, `card`, `popover` and
  `muted`: a control sits on whichever surface holds it, and a dark card is lighter than the page.
- **`DESIGN.md`** at the project root, in the canonical format, with colours equal to the stylesheet.

## Run

1. `python3 "$T" check [<dir>]` from the project. It finds the stylesheet through `components.json` (`tailwind.css`),
   else `src/index.css`, `src/styles/globals.css`, `app/globals.css`, `src/app/globals.css`. To check files in
   two places: `python3 "$T" check --stylesheet <css> --design <DESIGN.md>`.
2. Report each failure line as it is printed. Do not fix anything: a missing or failing token is fixed in the
   stylesheet by `/aios-ui-system-create` or `/aios-ui-system-extract`, or by hand, then checked again.
3. For drift in the code that uses the system (literals, arbitrary values, one-off copies of components), run
   the `design-system-keeper` agent and `/aios-ui-verify`; `python3 "$T" scan <dir>` gives the counts.

`python3 "$T" contrast <stylesheet>` prints every pair's ratio on its own when only that is wanted, and
`python3 "$T" frontmatter <stylesheet>` prints the `colors:` block for `DESIGN.md`.

Limits: the script reads source, not the built CSS, so it cannot tell that Tailwind inlined a variable away;
`primary` used as text (a link variant) is not a checked pair; `scan` does not see Tailwind's paren values
(`gap-(--x)`) and counts a grid template like any other arbitrary value. A grid template has no token equivalent: keep it and note
`ds-allow: grid template` beside it (rule 27's one exception), or use `col-span` instead.

## What a script cannot see

axe and `check` passed a shadcn-style app that a manual audit still failed in seven places. After adding the
shadcn components, look for these (each was a default, not a bug in the project):

- **Focus halo.** `focus-visible:ring-3 ring-ring/50` measures about 2:1 even when `--ring` itself passes. Use
  `outline-2 outline-offset-2 outline-ring` (or `ring-ring` at full opacity) on every focusable component,
  Switch and scrollable regions included (WCAG 1.4.11).
- **Variant surfaces.** `--input` on a `muted` or `popover` surface can sit at 3.00:1 while it passes on the page;
  that is why the pairs above include them. A translucent fill (`dark:bg-input/80`) lowers it again: use the token.
- **Headings.** `CardTitle` renders a `div`; make it an `h2` (or take an `as` prop) so heading navigation finds it.
- **Progress.** Base UI's `aria-labelledby` wins over `aria-label`, so the reader hears only a percentage: pass
  `getAriaValueText` with the real value ("6.71 KB"). `aria-label` on a plain `span` is ignored: add `role="img"`.
- **Dialogs at 400% zoom** (320×256): the popup needs `max-h-[calc(100dvh-2rem)] overflow-y-auto` or its buttons
  fall off the screen.
- **Hash-routed pages** keep one `<title>`: set `document.title` per route (WCAG 2.4.2).
- **WebKit and VoiceOver.** In WebKit with VoiceOver, Base UI marks its modal focus guards (`span[data-base-ui-focus-guard]`)
  `role="button"` with no name so VoiceOver's cursor cannot leave a dialog, and axe reports `aria-command-name` on them
  (two per open dialog). It is the library's choice, not a bug in the project: exclude `[data-base-ui-focus-guard]` from
  axe in a WebKit run and say so. A focus outline also reads as translucent for the first ~100 ms of its transition; wait
  400 ms before measuring it.

An `a11y-auditor` pass (keyboard, zoom, reduced motion, every state) is the check for these; `/aios-ui-verify`
is not.

To reuse a system that passes in another project, `/aios-ui-system-share` publishes it as a shadcn registry and installs
or updates it there; run `check` on both sides.
