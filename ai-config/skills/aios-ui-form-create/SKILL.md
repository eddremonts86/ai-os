---
name: aios-ui-form-create
description: Build a form on the project's design system - a zod schema first, shadcn Field components, one column, validation on first blur then on change, error text under each field, submit and server-error states, audited and screenshotted. React. Explicit invocation, /aios-ui-form-create "<what it collects and what submit does>".
disable-model-invocation: true
---

# aios-ui-form-create

Every form in every project is built the same way: the rules in `references/form-rules.md`, the code shapes in
`references/field-recipes.md`. Read both before writing anything. Auditing an existing form is
`optimizing-forms`; this command builds.

## Steps

1. **System first.** The project needs a design system: a root `DESIGN.md`. Without one, stop and point at
   `/aios-ui-system-create` (nothing yet) or `/aios-ui-system-extract` (an app with UI). Read its `## Forms`
   section. If the section is missing, show the one that would be appended (the defaults at the end of
   `form-rules.md`, filled in for this project) and ask before writing it; with no user to answer, append it
   and say so.
2. **Stack.** Read `package.json`. Use the form library the project already has (`react-hook-form` or
   `@tanstack/react-form`); with none, add `react-hook-form`, `zod` and `@hookform/resolvers`. Add only the
   shadcn components whose file is absent: `field`, `input-group` and each control the form uses (`checkbox`,
   `select`, `textarea`, `radio-group`, `switch`). Never overwrite an existing component file: answer no to
   the CLI's overwrite question. Run `tokens.py scan` right after the CLI: every new `tailwind.arbitrary`
   entry is the to-do list. Move what was added onto the project's tokens (rule 27: no literal colour or
   length, no `transition-all`) and onto the `DESIGN.md` Shapes and Motion rules too (a system with square
   corners and colour-only transitions does not keep the stock switch's pill and transform).
   If the controls are under 44px, the phone rule needs one height token (for example 2.75rem below `md`)
   used by the input, input group, select trigger, textarea and the default button: editing those existing
   files for it is expected. If `DESIGN.md` already names a form pattern (an older `FormField` wrapper),
   say whether `Field` replaces it and update that line, so the document does not contradict itself.
   A Vue project goes to `shadcn-vue`; this command is React.
3. **Schema.** One `zod` schema for the form, written first: field names, types, required or optional, and a
   message for each rule that tells the person what to do. The submit handler receives the parsed type.
4. **Layout.** Per `form-rules.md`: one column, groups as `FieldSet`, label above, widths that follow the
   answer, a maximum width, one primary action last.
5. **Fields.** Per `field-recipes.md`: every control inside a `Field`; a prefix, suffix, icon or button through
   `InputGroup`; `id` (`<form>-<field>`), `name`, `type`,
   `autocomplete`, `required` (or `aria-required` on a group) and, on text-like inputs, `inputmode` set; `aria-invalid` and
   `aria-describedby` wired to `FieldError` and `FieldDescription`.
6. **States.** Each control: default, hover, focus, disabled, invalid. The form: idle, submitting (button says
   so and cannot fire twice), failed (field errors, one form-level message for the rest, values kept),
   succeeded (say what happened and where the result is, and move focus to that message).
7. **Verify.**
   - It type-checks and builds.
   - In a real browser: type a wrong value and leave the field (the error appears), fix it (the error goes
     while typing), submit with an empty required field (focus lands on the first invalid field), submit
     twice quickly (one request).
   - From the project root, `node "$AI_OS_ROOT/ai-config/skills/optimizing-forms/audit-forms.mjs"` per that
     skill: no finding. A
     finding on a layout grid that is not a field row, or on a select placeholder that is labelled a few
     lines up, is dismissed with the reason written down.
   - `python3 "$AI_OS_ROOT/ai-config/skills/aios-ui-system-check/scripts/tokens.py" scan <dir>` before and
     after: no new colour, radius, shadow or font literal, no palette class, no new arbitrary value.
   - The `a11y-auditor` agent on the form, then `/aios-ui-verify`. `verify.py` names its screenshots by host,
     width and scheme only, so give each hash route its own output folder or the second overwrites the first.
   - Screenshots of the form empty, with errors, filled, and on a phone: look at them, fix what is off, send
     them.

## What not to do

- No legacy shadcn form wrapper (`components/ui/form`); `Field` replaced it.
- No placeholder as a label, no submit button disabled because the form is invalid (disabled only while a
  request is in flight, and still focusable), no error that only says "Invalid".
- No second column to fill space, and no form floating alone in a wide page.
- No value outside the tokens: a control that needs a new look gets a variant in its component.
