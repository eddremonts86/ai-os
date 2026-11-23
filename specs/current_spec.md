# Current Spec

# `/aios-ui-system`: create or extract a design system (core)

## Metadata

- **Date:** 2026-11-23
- **Status:** draft
- **Blocks:** 6
- **Author:** Claude (session design-systems-forms)
- **Reviewer:** Eduardo

## Objective

Add one command, `/aios-ui-system`, that gives any project a complete shadcn-based design system, created from
a brief or extracted from what the app already has, written in one canonical `DESIGN.md` format.

## Context

The owner wants every project to share one visual identity, built the way shadcn/ui is meant to be used: you
own the tokens and the components, and you customise in a fixed order. Five videos were studied (notes:
`design-systems-forms-study.md` in the session notes folder). The method they agree on:

1. Semantic tokens first, in OKLCH, in the global stylesheet. Never a literal name such as `--blue`.
2. A reusable style is a variant inside the component (cva).
3. A product-specific pattern is a wrapper component.
4. `className` from outside only for a true one-off.

AI-OS has the pieces but not the flow. `/aios-ui-themes` deals Hallmark's editorial themes; `impeccable
document` scans a codebase; rule 27 and `design-system-keeper` enforce a system once it exists. Nothing produces
a complete shadcn variable set (light and dark, radius, type, shadow, motion), nothing maps an existing app's de
facto values onto shadcn names, and nothing checks contrast across a whole system.

Two `DESIGN.md` formats are in use and disagree: Hallmark's short one
(`ai-config/skills/hallmark/references/design-md.md`) and impeccable's Google DESIGN.md shape
(`ai-config/skills/impeccable/reference/document.md`). `/aios-ui-design` calls both. Both skills are vendored,
so the fix must live in AI-OS-owned files.

This Spec is piece 1 of 3. Piece 2 (share a system across projects through a shadcn registry) and piece 3 (a
form-building skill on shadcn `Field`, plus a `## Forms` section) each get their own Spec afterwards.

## Design

### Command

`/aios-ui-system <create "<brief>" | extract [<dir>] | check [<dir>]>`, explicit invocation only
(`disable-model-invocation: true`), in `ai-config/skills/aios-ui-system/`.

For this command a project **has a system** when a `DESIGN.md` exists at its root. A `components.json` or a
default shadcn token block alone does not count (rule 27 uses a wider definition for enforcement; a freshly
scaffolded shadcn project must still be able to run `create`).

### The contract (what `create` and `extract` both leave in the project)

1. **Token block** in the project's global stylesheet, values in OKLCH, shadcn's own variable names so shadcn,
   shadcn-vue and any CSS can read them. The stylesheet is the source of truth for values.
   - Colour variables, required in both `:root` and `.dark`: `--background`, `--foreground`, `--card`,
     `--popover`, `--primary`, `--secondary`, `--muted`, `--accent` (each of the last six with its
     `-foreground`), `--destructive`, `--border`, `--input`, `--ring`, `--chart-1` to `--chart-5`, and
     `--sidebar`, `--sidebar-foreground`, `--sidebar-primary`, `--sidebar-primary-foreground`,
     `--sidebar-accent`, `--sidebar-accent-foreground`, `--sidebar-border`, `--sidebar-ring`.
   - Single-mode variables, required once in `:root` or `@theme`: `--radius`, `--font-sans`, `--font-mono`,
     `--shadow-sm`, `--shadow-md`, `--shadow-lg`, `--ease-out`, `--duration-fast`, `--duration-base`.
   - It replaces same-named variables in place, adds the missing ones and leaves every other project
     variable untouched.
2. **`DESIGN.md`** at the project root, in the canonical format below.
3. **Specimen page**: one page in the project's own stack showing the palette in both modes, the type scale,
   radius, shadows, and the button, input and card variants. It is what gets screenshotted and verified.

### Canonical `DESIGN.md`

`ai-config/skills/aios-ui-system/references/design-md.md` owns the template. It is the Google DESIGN.md shape
impeccable already reads and writes (frontmatter `name, description, colors, typography, rounded, spacing,
components`; sections Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, Do's and
Don'ts), with two AI-OS sections appended:

- `## System`: how it was made (created or extracted, date), the component base (shadcn family and
  primitive library), the theme source, and the stylesheet path that holds the token block. When the
  direction came from a Hallmark theme it also carries Hallmark's own four lines (Genre, Shape, Theme,
  Axes) so Hallmark's pre-flight finds them.
- `## Variants and patterns`: each variant added to a component and each wrapper component, one line each,
  so the customisation order above is recorded and reviewable.

Frontmatter `colors` is a flat map of strings, because that is what impeccable reads: the light value under
the variable's name (`background`) and the dark value under `<name>-dark` (`background-dark`). It mirrors the
stylesheet; `check` converts both sides to sRGB and fails when any channel differs by more than 2/255.

Hallmark treats any root `DESIGN.md` as a locked system and may append its `## Exports` section. That is
accepted: `check` ignores sections it does not own.

In a project that has a `components.json`, this is the only format written. `/aios-ui-themes lock` there
runs `/aios-ui-system extract` (the theme's tokens are already applied, so extracting is what locks them).
`/aios-ui-design` step 1 runs `/aios-ui-system extract` for an existing codebase without a `DESIGN.md`, and
its step 2 ends with `/aios-ui-system extract` instead of `lock`. `/aios-ui-design` step 2 keeps owning the
three-directions mechanics; `/aios-ui-system create` reuses them and never calls back into `/aios-ui-design`.
Hallmark's own format stays for Hallmark's standalone pages (no `components.json`). Vendored `hallmark/` and
`impeccable/` are not edited.

### `scripts/tokens.py` (Python standard library only, so macOS and Windows behave the same)

- `scan <dir>`: JSON inventory of the de facto system. Custom properties per selector (`:root`, `.dark`,
  `@theme`); colour, radius, shadow and font-family literals with counts and files; Tailwind palette classes
  (`bg-blue-500`) and arbitrary values (`p-[13px]`) with counts; which contract variables exist and which are
  missing.
- `contrast <stylesheet>`: WCAG 2.x ratio for every `X` / `X-foreground` pair plus `foreground` on
  `background`, `muted-foreground` on `background` and `card`, in both modes. Reads oklch, hex, rgb and hsl.
  Text pairs need 4.5:1; `ring` on `background` needs 3:1.
- `check [<dir>] [--stylesheet <css>] [--design <md>]`: every colour variable defined in both modes and every
  single-mode variable defined once, `contrast` passes, `DESIGN.md` frontmatter colours match the stylesheet.
  Exit 1 with one line per failure. The two flags let a `DESIGN.md` in one place be checked against a
  stylesheet in another.

Shared rules: the stylesheet is the `tailwind.css` path in `components.json`, else the first that exists of
`src/index.css`, `src/styles/globals.css`, `app/globals.css`, `src/app/globals.css`. When a selector appears
more than once, the last declaration of a variable wins. The frontmatter `colors:` block is parsed by hand
(flat `key: "value"` lines), since the standard library has no YAML reader.

### `create "<brief>"`

1. `ai-os scope which`: a scope or brand system wins on its own surfaces. If the project has a system (a root
   `DESIGN.md`), stop and offer `check`; if it has code but no `DESIGN.md`, say that `extract` keeps what is
   there and ask which the user wants.
2. References: ui-indexador `design_notes`, `list_captures`, `search_themes`/`get_theme` when it is enabled;
   otherwise shadcn's own theme presets. Sources are named to the user.
3. Three directions as pictures (the mechanics `/aios-ui-design` step 2 already has); the user picks one.
4. Write the full token block, run `tokens.py contrast`, fix until it passes.
5. Component base: use the project's `components.json`, or run shadcn init per `shadcn-patterns`. Apply the
   direction through tokens first, then variants; record each in `## Variants and patterns`.
6. Write `DESIGN.md`, build the specimen page, run `tokens.py check` and `/aios-ui-verify`, send screenshots
   (light and dark, desktop and mobile).

### `extract [<dir>]`

1. `tokens.py scan` for the inventory; `impeccable document` scan order for components and prose.
2. If the project's own dev server is running (localhost), sample computed styles of `body`, headings, links,
   buttons, inputs and cards in the browser and add them to the inventory. Other people's sites are out of
   scope here.
3. Map de facto values onto the contract by role and frequency, and show the mapping as one table (role,
   chosen value, where it came from, count, contrast) for a single approval.
4. Write the token block and `DESIGN.md`. An existing `DESIGN.md` is never overwritten silently: show what
   would change and ask.
5. Build the specimen page; run `tokens.py check` and `/aios-ui-verify`.
6. Report how many literals and arbitrary values remain in the code. Migrating them is `/aios-ui-improve`.

### Wiring

- `rules/always_do.md`: rule 26 table row; rule 27 names `/aios-ui-system create` as the start when no system
  exists and states the customisation order in one sentence.
- `ai-config/skills/aios-ui-themes/SKILL.md`: `lock` hands over when `components.json` exists; fix its
  `references/design-md.md` pointer (the file is in `hallmark/references/`).
- `ai-config/skills/aios-ui-design/SKILL.md`: step 1 and step 2 point at `/aios-ui-system`.
- `README.md` (chooser and command table), `docs/skills-catalog.md`, `setup/skills-routing-bank.json`, then
  `python3 setup/ai-os-stats.py --write`.

## Acceptance criteria

- [ ] `ai-config/skills/aios-ui-system/SKILL.md` exists with a top-level layout, description at most 350
      characters; `ai-os-skills.py lint --strict` exits 0 and the new routing-bank request lands in the top 3.
- [ ] `setup/tests/test_aios_ui_system.py` passes and covers: `scan` on a fixture project; `contrast` against
      the ratios published in `context/global/06_brand.md`, computed from its **hex** column (ink 18.26,
      muted 8.01, acid 14.47, and `faint` 4.27 failing 4.5:1); the OKLCH conversion pinned separately to that
      table's oklch-to-hex pairs within 1/255 per channel; `check` failing on a missing variable, a failing
      pair and a `DESIGN.md` mismatch.
- [ ] `extract` on `apps/site` (read-only, output in the scratchpad) produces an inventory, including
      computed styles sampled from its dev server, and a `DESIGN.md` that passes
      `check --stylesheet apps/site/src/index.css --design <scratch>/DESIGN.md` or lists only real findings.
- [ ] `create` on a scratch Vite + shadcn project produces the token block in both modes, `DESIGN.md` and the
      specimen page; `tokens.py check` exits 0; `/aios-ui-verify` passes; four screenshots are sent.
- [ ] A test asserts that `aios-ui-themes` and `aios-ui-design` name `/aios-ui-system` for `components.json`
      projects, so a second format cannot come back unnoticed.
- [ ] `ai-os-stats.py --check` passes, and after the work is committed `setup/hooks/pre-push` passes when fed
      the commit on stdin without pushing (with no stdin it checks nothing and exits 0).

## Non-goals (explicit)

- Sharing a system across projects (registry, package, sync): piece 2.
- Building forms, shadcn `Field`, a `## Forms` section, fixing `shadcn-patterns`' legacy `<Form>`: piece 3.
- Rewriting an app's components to use the new tokens.
- Editing vendored `hallmark/` or `impeccable/`.
- Committing a `DESIGN.md` for `apps/site`; the run there is a read-only proof.
- Extracting from a third-party URL. Hallmark's `brand-truth` already reads colours and fonts off a public site.
- Native (Expo) systems: `expo-design-system` keeps that.

## Plan (blocks)

### Block 1: `tokens.py` with tests (estimated: 60 min)

**Status:** not started

- [ ] Write `setup/tests/test_aios_ui_system.py` first (fixtures in a temp dir), see it fail.
- [ ] Implement `scan`, `contrast`, `check` in `ai-config/skills/aios-ui-system/scripts/tokens.py`.
- [ ] **Verify:** the test file passes; `contrast` reproduces the `06_brand.md` ratios to two decimals from
      the hex values, and the OKLCH conversion matches the table's hex within 1/255 per channel.

### Block 2: template and skill (estimated: 45 min)

**Status:** not started

- [ ] Write `references/design-md.md` (canonical template, both appended sections).
- [ ] Write `SKILL.md` with `create`, `extract`, `check` as designed above.
- [ ] **Verify:** `ai-os-skills.py lint --strict` exits 0; the skill is found by the installer's glob.

### Block 3: wiring (estimated: 30 min)

**Status:** not started

- [ ] Edit rules 26 and 27, `aios-ui-themes`, `aios-ui-design`, `README.md`, `docs/skills-catalog.md`, the
      routing bank; add the hand-over test; run `ai-os-stats.py --write`.
- [ ] The PNGs that `--write` re-renders need Playwright's Chromium, which this machine lacks: render them
      with the installed Chrome as commit `a56ec1760` did.
- [ ] Commit blocks 1 to 3 here, so block 4 starts from a clean tree.
- [ ] **Verify:** full `setup/tests` suite passes with PyYAML; `ai-os-stats.py --check` passes; bank stays
      above 70 % with the new request in the top 3.

### Block 4: proof on an existing app (estimated: 20 min)

**Status:** not started

- [ ] Run `extract` on `apps/site` with its dev server up and output in the scratchpad.
- [ ] **Verify:** inventory lists the variables in `apps/site/src/index.css` and the sampled computed styles;
      `check --stylesheet apps/site/src/index.css --design <scratch>/DESIGN.md` passes or lists real
      findings; `git status` shows no change under `apps/site`.

### Block 5: proof from zero (estimated: 60 min)

**Status:** not started

- [ ] Scaffold a Vite + shadcn project in the scratchpad and run `create` with a written brief.
- [ ] **Verify:** `tokens.py check` exits 0; `/aios-ui-verify` passes; the four screenshots were looked at
      and sent to the user.

### Block 6: review and commit (estimated: 20 min)

**Status:** not started

- [ ] `aios-reviewer` agent on the diff; fix what it confirms.
- [ ] Commit locally, then feed the hook the commit without pushing:
      `echo "refs/heads/<branch> $(git rev-parse HEAD) refs/heads/<branch> $(git rev-parse origin/dev)" | bash setup/hooks/pre-push origin <url>`.
- [ ] **Verify:** the hook prints every check and exits 0; the branch is clean; nothing pushed.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| This becomes a third `DESIGN.md` format instead of the one | med | high | It is a superset of the shape impeccable already reads; themes and design hand over in `components.json` projects; a test guards the hand-over |
| Hallmark's pre-flight misreads the canonical file | low | med | Hallmark only treats the file as a locked system; `## System` carries its four lines when a Hallmark theme was used; an appended `## Exports` is accepted |
| OKLCH to sRGB conversion is wrong and contrast results lie | med | high | The conversion is pinned to the oklch-to-hex pairs in `06_brand.md`, separately from the ratio test |
| `extract` maps a value to the wrong role | med | med | Nothing is written before the mapping table is approved |
| ui-indexador is not enabled on the machine | med | low | `create` falls back to shadcn's presets; block 5 says which path it used |
| One more always-loaded skill description | high | low | Explicit invocation only; description within the 350-character target |

## Verification (end-to-end)

- [ ] From a clean scratch project, `/aios-ui-system create "<brief>"` ends with a passing `check`, a passing
      `/aios-ui-verify` and screenshots.
- [ ] On `apps/site`, `/aios-ui-system extract` reproduces the tokens the stylesheet already has.
- [ ] All acceptance criteria met; pre-push hook passes locally.

## References

- Study notes: `design-systems-forms-study.md` in the session notes folder (videos, inventory, gaps).
- `rules/always_do.md` rules 26 and 27; `context/global/06_brand.md`.
- `ai-config/skills/aios-ui-themes/SKILL.md`, `ai-config/skills/aios-ui-design/SKILL.md`.
- `ai-config/skills/impeccable/reference/document.md`, `ai-config/skills/hallmark/references/design-md.md`,
  `ai-config/skills/hallmark/references/export-formats.md` (shadcn mapping and the `accent`/`muted` name clash).
- `ai-config/skills/aios-ui-verify/scripts/antislop.py` and `setup/tests/test_antislop.py` (script and test
  pattern to follow).

## Notes

- Decisions the owner can still change before block 1: the canonical format (Google DESIGN.md shape plus two
  sections, chosen over Hallmark's short format because it carries components and is already machine-read);
  keeping `apps/site` read-only.
- The branch already carries two unrelated fixes (`a56ec1760` nested skills, `9d38c389a` pre-push hook). They
  are better merged to `dev` as their own PR before this work lands on top.
