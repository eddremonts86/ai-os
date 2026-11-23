# Current Spec

# `/aios-ui-form-create`: build forms on the project's design system

## Metadata

- **Date:** 2026-11-23
- **Status:** completed (approved 2026-11-23; all four blocks done, nothing pushed)
- **Blocks:** 4
- **Review:** cold read by a fresh reviewer on 2026-11-23, 6 majors, all addressed
- **Author:** Claude (session design-systems-forms)
- **Reviewer:** Edd

## Objective

Add one command, `/aios-ui-form-create`, that builds a form the same way in every project: on shadcn's `Field`
components, from the project's tokens, with one written set of layout, validation and error rules.

## Context

This is piece 3 of the design-system work; piece 1 (`/aios-ui-system-create`, `-extract`, `-check`) is built
(`archive/2026-11-23-aios-ui-system-core.md`). Piece 2 (sharing a system through a shadcn registry) is still
to come and does not block this one.

AI-OS can audit a form but not build one consistently:

- `optimizing-forms` audits and repairs, and says building belongs to "the project's form-construction skill".
- `react-hook-form-zod` is linked since commit `a56ec1760`, but it is third-party, pins old versions and calls
  shadcn's `Field` "coming soon".
- `shadcn-patterns` still teaches the legacy `<Form>` / `FormField` wrapper. No skill covers shadcn's `Field`
  family, which the current CLI installs (`Field`, `FieldGroup`, `FieldSet`, `FieldLegend`, `FieldLabel`,
  `FieldDescription`, `FieldError`, `FieldContent`, `FieldSeparator`, `FieldTitle`; `InputGroup` with
  `InputGroupAddon`, `InputGroupInput`, `InputGroupText`, `InputGroupButton`, `InputGroupTextarea`).
- Skills disagree on validation timing (Hallmark: on blur, then on every input; `optimizing-forms`: on blur,
  never on keypress), and nothing fixes form layout, the error pattern or submit states per project.

The method comes from the videos studied for piece 1: one input component with slots instead of a component
per case, every state explicit, one column, related fields grouped by spacing, the same edge on every control,
the action last, and a form never left floating in empty space.

## Design

### Command

`/aios-ui-form-create "<what the form collects and what happens on submit>"`, explicit invocation only, in
`ai-config/skills/aios-ui-form-create/` (`SKILL.md`, `references/form-rules.md`, `references/field-recipes.md`).
No new audit command: `optimizing-forms` stays the audit and its `audit-forms.mjs`
(`ai-config/skills/optimizing-forms/audit-forms.mjs`) is this command's gate.

### Steps the skill prescribes

1. **System first.** The project needs a design system (a root `DESIGN.md`). Without one, stop and point at
   `/aios-ui-system-create` or `/aios-ui-system-extract`. Read its `## Forms` section; if the section is
   missing, show the one that would be appended (the defaults in `form-rules.md`) and ask before writing it.
   With no user to answer, append it and say so.
2. **Stack.** Read `package.json`: use the form library the project already has (`react-hook-form` or
   `@tanstack/react-form`); with none, `react-hook-form` with `zod` and `@hookform/resolvers`. Add only the
   shadcn components whose file is absent: `field`, `input-group` and each control the form uses (`checkbox`,
   `select`, `textarea`, ...). An existing file is never overwritten. Move what was added onto the project's
   tokens (rule 27) before using it. A Vue project is sent to
   `shadcn-vue`; this command is React.
3. **Schema.** One `zod` schema per form, written first, shared by client validation and the submit handler.
   Field names, types, required or optional and messages come from it.
4. **Layout**, per `form-rules.md`.
5. **Fields**, per `field-recipes.md`: every control inside `Field`, never the legacy `<Form>` wrapper.
6. **States.** Each control: default, hover, focus, disabled, invalid. The form: idle, submitting, failed
   (field errors and a form-level message), succeeded.
7. **Verify.** `optimizing-forms`' `audit-forms.mjs` reports nothing new, `a11y-auditor` on the form, then
   `/aios-ui-verify`; screenshots of the form empty, with errors, filled, and on a phone are looked at and sent.

### `references/form-rules.md` (the one set of rules)

Layout:
- One column. Two fields share a row only when they are short and read as one thing (city and postcode).
- Width follows the expected answer; the form has a maximum width and sits in a card or beside related
  content, never alone in a wide empty page.
- Related fields are a `FieldSet` with a `FieldLegend`; groups are separated by more space than fields.
- Label above the control. A placeholder is an example, never the label.
- Every control has the same edge (`--input`) and the same height; on a phone, targets are at least 44px.
- Help text sits under the control (`FieldDescription`); consent text is not styled as a label, and its links
  are underlined.
- One primary action, last, aligned with the fields' left edge; a destructive action is apart from it.
- Mark the minority: if most fields are required, mark the optional ones in words, and the reverse.

Behaviour:
- Validate a field when it first loses focus, not on the first keystrokes; from then on re-validate it on
  every change so an error clears the moment it is fixed. In `react-hook-form` that is `mode: "onTouched"`
  (not `onBlur`, whose re-validation on change only starts after a submit). In `@tanstack/react-form` it is an
  `onBlur` validator plus an `onChange` validator that returns nothing until the field's `meta.isBlurred`.
  Hallmark's field recipe already says the same; `optimizing-forms` gets a one-line edit to match.
- The error is text under the field (`FieldError`), tied with `aria-describedby`, with `aria-invalid` on the
  control and `data-invalid` on the `Field`. It says what to do, not only what is wrong.
- Submit stays enabled. On submit with errors, focus moves to the first invalid field; a form longer than
  one screen also gets a summary at the top that links to each field.
- While submitting, the button shows it and cannot fire twice; inputs keep their values on failure.
- Server errors map onto fields where they belong and into one form-level alert otherwise.
- Native types, `autocomplete`, `inputmode` and `name` are set so the browser and password managers help.
- More than about eight fields: split into steps with progress, validation per step, and Back keeping data.

### `references/field-recipes.md`

Short, complete examples against the current shadcn components. Every recipe is built in block 3 on a
recipes page of the Ledger project, which uses shadcn's `base-nova` style on Base UI primitives; the file says
so, and that a Radix or React Aria project must check the control props against its own components:
`Field` with `react-hook-form`'s `Controller` and a `zod` resolver; the same with `@tanstack/react-form`;
text, select, checkbox, radio group, switch and textarea; one input with a prefix, suffix, icon or button
through `InputGroup` (search, amount with currency, URL); a `FieldSet` group; the submit button's states; the
error summary.

### Changes outside the new skill

- `ai-config/skills/aios-ui-system-check/references/design-md.md`: a `## Forms` section in the canonical
  template (control height, label position, required marking, validation timing, error pattern, maximum
  width, action alignment), appended after `## Variants and patterns` so the eight sections `impeccable`
  reads stay as they are; the file's introduction then says three AI-OS sections instead of two.
- `ai-config/skills/aios-ui-system-create/SKILL.md`: the specimen page also shows one short form built by
  these rules.
- `ai-config/skills/shadcn-patterns/SKILL.md`: the legacy `<Form>` / `FormField` section is replaced by a
  short `Field` pointer to this skill; its anti-pattern list gains "the legacy `<Form>` wrapper".
- `ai-config/skills/optimizing-forms/SKILL.md` and `ai-config/skills/pick-ui-library/SKILL.md`: name
  `/aios-ui-form-create` as the form-construction skill. In `optimizing-forms`, the "Validation on blur" row of
  its rule table gets the same timing rule (one line); nothing else in that skill changes. `react-hook-form-zod` is not edited (third-party).
- `rules/always_do.md` rule 26 row, `README.md`, `docs/skills-catalog.md`, `setup/skills-routing-bank.json`,
  then `python3 setup/ai-os-stats.py --write` (219 to 220 skills).

## Acceptance criteria

- [x] `ai-config/skills/aios-ui-form-create/SKILL.md` exists, description at most 350 characters;
      `ai-os-skills.py lint --strict` exits 0 and a routing-bank request for it lands in the top 3.
- [x] `setup/tests/test_aios_ui_form.py` passes and asserts: neither recipe file nor `shadcn-patterns` uses
      `<FormField`, `<FormItem` or `FormMessage`; every component name the recipes import from
      `@/components/ui/field` and `@/components/ui/input-group` is in the list of exports recorded in the test;
      the canonical template has `## Forms`; `optimizing-forms` and `pick-ui-library` name the command.
- [x] In the scratch "Ledger" project from piece 1, a subagent that follows the skill as written builds a
      "New invoice" form (client, email, issue and due date, amount with currency, VAT number, notes, a
      send-me-a-copy checkbox). It type-checks and builds; validation fires on blur and clears on change;
      submitting with errors focuses the first invalid field. `tokens.py scan` is recorded before and after:
      `literals` and `tailwind.palette` stay empty and `tailwind.arbitrary` gains no entry.
- [x] A recipes page in the same project renders every recipe in `field-recipes.md`, including the
      `@tanstack/react-form` variant, and builds without type errors.
- [x] On that form: `audit-forms.mjs` reports no finding (it runs the rules that apply to the project's stack), axe reports no violation, `/aios-ui-verify` passes,
      and four screenshots (empty, errors, filled, phone) were looked at and sent.
- [x] The full `setup/tests` suite passes with PyYAML, `ai-os-stats.py --check` passes, and the pre-push hook
      fed the commit on stdin (no push) passes.

## Non-goals (explicit)

- A new audit command, or changes to `optimizing-forms` beyond the one timing line and the pointer.
- Editing third-party `react-hook-form-zod`, or vendored `hallmark/` and `impeccable/`.
- Vue, Nuxt and native forms.
- Tables (the other half of the "Forms & Tables" material) and multi-step wizards beyond the rule above.
- Server-side frameworks: the recipes stop at a typed submit handler.
- Piece 2 (registry).

## Plan (blocks)

### Block 1: rules, recipes and skill (estimated: 60 min)

**Status:** done (2026-11-23)

- [x] Write `setup/tests/test_aios_ui_form.py` first and see it fail.
- [x] Write `references/form-rules.md`, `references/field-recipes.md` and `SKILL.md`.
- [x] **Verify:** the new test passes except the checks that depend on block 2; lint exits 0.

### Block 2: template, sibling skills and wiring (estimated: 30 min)

**Status:** done (2026-11-23)

- [x] `## Forms` in the canonical template; the specimen line in `aios-ui-system-create`; the `shadcn-patterns`
      replacement; pointers in `optimizing-forms` and `pick-ui-library`; rule 26, `README.md`, catalogue,
      routing bank; `ai-os-stats.py --write` and the two PNGs rendered with installed Chrome.
- [x] Commit blocks 1 and 2.
- [x] **Verify:** full suite passes with PyYAML; `ai-os-stats.py --check` passes; bank above 70 % with the
      new request in the top 3.

### Block 3: proof on the Ledger project (estimated: 60 min)

**Status:** done (2026-11-23)

- [x] A subagent builds the "New invoice" form and the recipes page by following the skill as written and
      reports every place the text was unclear or wrong.
- [x] **Verify:** build and type-check pass; the behaviour in the third acceptance criterion is exercised in
      a real browser; audit, axe and `/aios-ui-verify` results recorded; the four screenshots looked at.
- Result: on Ledger the `react-hook-form` path worked as written; the form passes `tsc`, build, axe in four
  states, `audit-forms.mjs`, `/aios-ui-verify` 12/12 and `tokens.py check`; `tokens.py scan` gained no literal
  and no arbitrary value. The run found 27 friction points: the `@tanstack/react-form` timing recipe was wrong,
  five recipes (amount message, textarea, radio, select, error summary) compiled but misbehaved on Base UI,
  and the rules lacked focus handling, cross-field and summary guidance. All folded back into the skill.
  Not done: `a11y-auditor` was replaced by axe plus a scripted keyboard pass; `/aios-ui-verify` ran on the dev
  server; Chrome only; radio and switch hit areas stay 32px on a phone.

### Block 4: fold back, review, commit (estimated: 30 min)

**Status:** done (2026-11-23)

- [x] Fold the proof's findings into the skill; `aios-reviewer` on the diff; fix what it confirms.
- [x] Commit, then feed the pre-push hook the commit on stdin without pushing.
- [x] **Verify:** the hook prints every check and exits 0; the branch is clean; nothing pushed.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| The recipes drift from shadcn's real `Field` API | med | high | Every recipe is built in block 3 against components the CLI installs today (Base UI family); the test pins the export names |
| A third opinion on forms next to `optimizing-forms` and Hallmark | med | med | `form-rules.md` states the one timing rule; Hallmark's recipe already matches and `optimizing-forms`' row is edited to match; the audit script stays the gate |
| The scratch Ledger project was cleaned up | low | low | Recreate it with `/aios-ui-system-create` (commands recorded in the archived Spec) |
| `audit-forms.mjs` assumes a project shape the proof does not have | med | low | Run it early in block 3; if it cannot run, say so and rely on axe and the browser checks |
| `shadcn-patterns` readers lose the legacy section they need for an old project | low | low | The replacement says the legacy wrapper still exists and names `react-hook-form-zod` for it |

## Verification (end-to-end)

- [x] `/aios-ui-form-create` on the Ledger project ends with a working form, clean audits and screenshots.
- [x] All acceptance criteria met; pre-push hook passes locally.

## References

- `archive/2026-11-23-aios-ui-system-core.md` (piece 1 and its proof).
- `ai-config/skills/optimizing-forms/SKILL.md` and `audit-forms.mjs` beside it.
- `ai-config/skills/shadcn-patterns/SKILL.md` (legacy `<Form>` section, `InputGroup` anti-pattern line).
- `ai-config/skills/react-hook-form-zod/` (third-party; `references/shadcn-integration.md`).
- `ai-config/skills/hallmark/references/interaction-and-states.md` (field recipe and timing).
- `ai-config/agents/a11y-auditor.md`.

## Notes

- Decisions the owner can still change before block 1: no separate `/aios-ui-form-check` (the audit stays
  `optimizing-forms`); `react-hook-form` plus `zod` as the default when a project has no form library.
