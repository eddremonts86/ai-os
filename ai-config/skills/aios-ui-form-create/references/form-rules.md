# Form rules

The one set of rules a form follows in every project. A project's `DESIGN.md` `## Forms` section records its
own values (control height, maximum width, how required fields are marked); everything else is here.

## Layout

- **One column.** Two fields share a row only when they are short and read as one thing (city and postcode,
  issue date and due date).
- **Width follows the answer.** A postcode field is not as wide as an address field. Get that by putting the
  short control in the same two-column grid its partners use, never by capping one control with `max-w-*`
  (its edge then misses the column above). The form has a maximum
  width (default `max-w-xl`) and sits in a card or beside related content, never alone in a wide empty page.
- **Groups.** Related fields are a `FieldSet` with a `FieldLegend`. The space between groups is larger than
  the space between fields, so the structure is visible without lines.
- **Label above the control.** A placeholder is an example of an answer, never the label.
- **One edge, one height.** Every control uses the same border (`--input`) and the same height. On a phone,
  targets are at least 44px tall.
- **Help text under the control** (`FieldDescription`), before the error. Consent text is not styled as a
  label, and its links are underlined.
- **One primary action, last,** aligned with the fields' left edge. A secondary action sits beside it and looks
  quieter. A destructive action is apart from both.
- **Mark the minority.** If most fields are required, mark the optional ones with the word "optional" in the
  label; if most are optional, mark the required ones with "required". No lone asterisk. The mark is for
  eyes; the control also carries `required` or `aria-required`, so the two always agree.

## Behaviour

- **When to validate.** A field is validated when it first loses focus, not on its first keystrokes. From then
  on it is re-validated on every change, so an error clears the moment it is fixed.
  - `react-hook-form`: `useForm({ mode: "onTouched" })`. Not `onBlur`: its re-validation on change only starts
    after a submit.
  - `@tanstack/react-form`: one `onChange` validator; `onBlur` calls `field.handleBlur()` and then
    `field.validate("change")`; show the error once `field.state.meta.isBlurred` (or a submit was attempted)
    and the field is invalid. An `onBlur` validator alone leaves its error in place until the next blur.
  - A rule across two fields validates the dependent field only once it has been touched.
- **The error** is text under the field in `FieldError`. The control carries `aria-invalid`, the `Field`
  carries `data-invalid`, and the control's `aria-describedby` names the error (and the description). It says
  what to do ("Enter the 8 digits after the country code"), not only what is wrong ("Invalid").
- **Submit stays enabled** (never disabled because the form is invalid). Submitting with errors moves focus to
  the first invalid field. A form that does not fit the phone viewport (about 375 x 667) also shows a summary
  at the top that links to each invalid field. The summary is not a live region: each `FieldError` already
  announces itself, and five alerts at once are noise.
- **While submitting** the button says so, carries `aria-busy`, and cannot fire twice. It keeps keyboard focus
  while it is disabled (a natively disabled button drops focus to the page). On failure every input keeps its
  value.
- **After success** say what happened and where the result is, and move focus to that message.
- **Server errors** go onto the field they belong to and focus it (`setError(name, { message }, { shouldFocus:
  true })`); anything else goes into one form-level alert above the actions.
- **Help the browser.** `name`, `type` and `autocomplete` are set on every input, and `inputmode` on every
  text-like one, so autofill, password managers and phone keyboards work.
- **Long forms.** More than about eight fields: split into steps with visible progress, validate per step, and
  Back keeps what was typed.

## Defaults for a `DESIGN.md` `## Forms` section

```markdown
## Forms
- Controls: <height> tall, `--input` edge, `--ring` focus; at least 44px on a phone
- Labels: above the control; <optional | required> fields are marked in words
- Width: `max-w-xl`, one column
- Validation: on first blur, then on change; error text under the field
- Actions: one primary, last, left-aligned
- Built with `/aios-ui-form-create` (`Field`, <form library>, `zod`)
```
