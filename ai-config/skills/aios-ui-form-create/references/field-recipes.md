# Field recipes

Complete, short examples on shadcn's `Field` family. Each was built and run on shadcn's `base-nova` style,
which uses Base UI primitives (React 19, `react-hook-form` 7, `@tanstack/react-form` 1.33, `zod` 4). In a
Radix or React Aria project the `Field` parts are the same, but check each control's props (`checked` /
`onCheckedChange`, `value` / `onValueChange`, `focusableWhenDisabled`) against the project's own
`components/ui` files before copying.

Every control goes inside a `Field`. The legacy form wrapper (`components/ui/form`) is not used.

**Id convention:** every control's `id` is `<form>-<field name>` (`invoice-email`), so labels, `aria-describedby`
and the error summary's links all find it. A group (radio buttons) puts that id on the group.

**Imports:** a snippet that uses `Button`, `Textarea`, `Checkbox`, `RadioGroup`, `RadioGroupItem`, `Select*`,
`Switch` imports it from the matching `@/components/ui/<name>` file, as `Input` and `Button` are imported in the
first example.

**Required fields:** a required control also carries `required` (the form is `noValidate`, so the browser shows
no bubbles of its own) or, for a group, `aria-required` on the group, so a screen reader hears what the visual
mark says.

## Schema first

```ts
import { z } from "zod"

export const invoiceSchema = z.object({
  client: z.string().trim().min(1, "Enter the client's name."),
  email: z.email("Enter an email address, like name@company.com."),
  amount: z.coerce
    .number<string>("Enter the amount in figures, like 1250.50.")
    .positive("Enter an amount above zero."),
  terms: z.enum(["14", "30"], "Choose the payment terms."),
  notes: z.string().max(500, "Keep notes under 500 characters.").optional(),
  sendCopy: z.boolean(),
})
export type Invoice = z.infer<typeof invoiceSchema>
```

An unanswered radio group or select has no value: default it to `undefined` and type the form values from
`z.input<typeof invoiceSchema>`, or cast the empty string (`"" as "14"`). A schema message is always written
for the person, never zod's default ("Invalid input").

## A text field with `react-hook-form`

```tsx
import { Controller, useForm } from "react-hook-form"
import { zodResolver } from "@hookform/resolvers/zod"
import { Field, FieldDescription, FieldError, FieldGroup, FieldLabel } from "@/components/ui/field"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export function InvoiceForm({ onSave }: { onSave: (values: Invoice) => Promise<void> }) {
  const form = useForm({
    resolver: zodResolver(invoiceSchema),
    mode: "onTouched", // first blur, then every change
    defaultValues: { client: "", email: "", amount: "", notes: "", sendCopy: false },
  })
  const { isSubmitting, errors } = form.formState

  return (
    <form noValidate onSubmit={form.handleSubmit(onSave)} className="max-w-xl">
      <FieldGroup>
        <Controller
          name="email"
          control={form.control}
          render={({ field, fieldState }) => (
            <Field data-invalid={fieldState.invalid}>
              <FieldLabel htmlFor="invoice-email">Client email</FieldLabel>
              <Input
                {...field}
                id="invoice-email"
                type="email"
                autoComplete="email"
                inputMode="email"
                required
                aria-invalid={fieldState.invalid}
                aria-describedby={fieldState.invalid ? "invoice-email-help invoice-email-error" : "invoice-email-help"}
              />
              <FieldDescription id="invoice-email-help">The invoice is sent here.</FieldDescription>
              {fieldState.invalid && <FieldError id="invoice-email-error" errors={[fieldState.error]} />}
            </Field>
          )}
        />
        {errors.root && <FieldError errors={[errors.root]} />}
        <Field orientation="horizontal">
          {/* never disabled because the form is invalid; disabled only while a request is in flight, and it
              keeps keyboard focus (Base UI: focusableWhenDisabled; otherwise aria-disabled plus an early return) */}
          <Button type="submit" aria-busy={isSubmitting} disabled={isSubmitting} focusableWhenDisabled>
            {isSubmitting ? "Sending…" : "Send invoice"}
          </Button>
          <Button type="button" variant="ghost" onClick={() => form.reset()}>Cancel</Button>
        </Field>
      </FieldGroup>
    </form>
  )
}
```

`handleSubmit` focuses the first invalid field (`shouldFocusError`, on by default) provided every control
receives `field.ref`. Server errors:

```ts
form.setError("email", { message: "This address cannot receive email." }, { shouldFocus: true }) // one field
form.setError("root", { message: "We could not reach the server. Try again." })                  // anything else
```

The `root` error is shown above the actions, as in the example. Cross-field rules (due date after issue date):
re-check the dependent field in `onChange` only when `form.getFieldState("dueDate").isTouched`; `deps` would
validate it before it was ever visited, and a `zod` object `.refine` does not run while other fields are
invalid.

## The same field with `@tanstack/react-form`

The blur error would otherwise stay until the next blur, so one `onChange` validator does the work and
`onBlur` only marks the field as seen and re-runs it.

```tsx
import { useForm } from "@tanstack/react-form"
import { Field, FieldError, FieldLabel } from "@/components/ui/field"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

const form = useForm({
  defaultValues: { email: "" },
  onSubmit: async ({ value }) => onSave(invoiceSchema.pick({ email: true }).parse(value)),
  onSubmitInvalid: ({ formApi }) => {
    const first = Object.entries(formApi.state.fieldMeta).find(([, meta]) => !meta.isValid)?.[0]
    if (first) document.getElementById(`invoice-${first}`)?.focus()
  },
})

<form onSubmit={(e) => { e.preventDefault(); void form.handleSubmit() }} noValidate>
  <form.Field name="email" validators={{ onChange: invoiceSchema.shape.email }}>
    {(field) => {
      const shown = field.state.meta.isBlurred || field.form.state.submissionAttempts > 0
      const invalid = shown && !field.state.meta.isValid
      return (
        <Field data-invalid={invalid}>
          <FieldLabel htmlFor="invoice-email">Client email</FieldLabel>
          <Input
            id="invoice-email"
            name={field.name}
            type="email"
            autoComplete="email"
            inputMode="email"
            required
            value={field.state.value}
            onBlur={() => { field.handleBlur(); void field.validate("change") }}
            onChange={(e) => field.handleChange(e.target.value)}
            aria-invalid={invalid}
            aria-describedby={invalid ? "invoice-email-error" : undefined}
          />
          {invalid && <FieldError id="invoice-email-error" errors={field.state.meta.errors} />}
        </Field>
      )
    }}
  </form.Field>
  <Button type="submit">Send invoice</Button>
</form>
```

## One input, many jobs: `InputGroup`

A prefix, suffix, icon or button belongs inside the control's own border. Never a `div` around an input. Inside
a `Field`, `InputGroup` takes the place of `Input`, and the `id`, `aria-invalid` and `aria-describedby` go on
`InputGroupInput`.

```tsx
import { InputGroup, InputGroupAddon, InputGroupButton, InputGroupInput, InputGroupText } from "@/components/ui/input-group"

// amount with currency
<InputGroup>
  <InputGroupInput
    {...field}
    id="invoice-amount"
    inputMode="decimal"
    required
    className="text-right tabular-nums"
    aria-invalid={fieldState.invalid}
    aria-describedby={fieldState.invalid ? "invoice-amount-error" : undefined}
  />
  <InputGroupAddon align="inline-end"><InputGroupText>EUR</InputGroupText></InputGroupAddon>
</InputGroup>

// search
<InputGroup>
  <InputGroupAddon><SearchIcon aria-hidden="true" /></InputGroupAddon>
  <InputGroupInput type="search" name="q" aria-label="Search clients" />
</InputGroup>

// URL with a fixed scheme, and an action
<InputGroup>
  <InputGroupAddon><InputGroupText>https://</InputGroupText></InputGroupAddon>
  <InputGroupInput {...field} id="invoice-site" inputMode="url" autoComplete="url" />
  <InputGroupAddon align="inline-end"><InputGroupButton onClick={copy}>Copy</InputGroupButton></InputGroupAddon>
</InputGroup>
```

## Textarea, checkbox, switch, radio group, select

The `Field` shell is the same; only the control and the orientation change. Every control receives
`ref={field.ref}` and its blur (`onBlur={field.onBlur}`), or it cannot be the first invalid field and is
validated only on submit.

```tsx
// textarea
<Field data-invalid={fieldState.invalid}>
  <FieldLabel htmlFor="invoice-notes">Notes <span className="text-muted-foreground">(optional)</span></FieldLabel>
  <Textarea
    {...field}
    id="invoice-notes"
    rows={4}
    aria-invalid={fieldState.invalid}
    aria-describedby={fieldState.invalid ? "invoice-notes-error" : undefined}
  />
  {fieldState.invalid && <FieldError id="invoice-notes-error" errors={[fieldState.error]} />}
</Field>

// checkbox or switch: control first, label beside it
<Field orientation="horizontal">
  <Checkbox
    id="invoice-sendCopy"
    name={field.name}
    ref={field.ref}
    checked={field.value}
    onCheckedChange={field.onChange}
    onBlur={field.onBlur}
  />
  <FieldLabel htmlFor="invoice-sendCopy" className="font-normal">Send me a copy</FieldLabel>
</Field>

// radio group: a FieldSet names the question, each option is a horizontal Field.
// Option ids carry no spaces (Base UI builds aria-labelledby from them): use a key, not the label text.
<FieldSet data-invalid={fieldState.invalid}>
  <FieldLegend variant="label">Payment terms</FieldLegend>
  <RadioGroup
    id="invoice-terms"
    name={field.name}
    value={field.value}
    onValueChange={field.onChange}
    onBlur={field.onBlur}
    aria-required
    aria-invalid={fieldState.invalid}
    aria-describedby={fieldState.invalid ? "invoice-terms-error" : undefined}
  >
    {(["14", "30"] as const).map((days, index) => (
      <Field key={days} orientation="horizontal">
        <RadioGroupItem id={`invoice-terms-${days}`} value={days} ref={index === 0 ? field.ref : undefined} />
        <FieldLabel htmlFor={`invoice-terms-${days}`} className="font-normal">{days} days</FieldLabel>
      </Field>
    ))}
  </RadioGroup>
  {fieldState.invalid && <FieldError id="invoice-terms-error" errors={[fieldState.error]} />}
</FieldSet>

// select: the trigger carries the id and the invalid state; closing the popup is its blur
<Field data-invalid={fieldState.invalid}>
  <FieldLabel htmlFor="invoice-currency">Currency</FieldLabel>
  <Select
    name={field.name}
    value={field.value}
    onValueChange={field.onChange}
    onOpenChange={(open) => { if (!open) field.onBlur() }}
  >
    <SelectTrigger
      id="invoice-currency"
      ref={field.ref}
      aria-invalid={fieldState.invalid}
      aria-describedby={fieldState.invalid ? "invoice-currency-error" : undefined}
    >
      <SelectValue />
    </SelectTrigger>
    <SelectContent>
      <SelectItem value="EUR">EUR</SelectItem>
      <SelectItem value="DKK">DKK</SelectItem>
    </SelectContent>
  </Select>
  {fieldState.invalid && <FieldError id="invoice-currency-error" errors={[fieldState.error]} />}
</Field>
```

## A group of related fields

```tsx
import { FieldGroup, FieldLegend, FieldSet } from "@/components/ui/field"

<FieldGroup className="gap-10">          {/* between groups */}
  <FieldSet>
    <FieldLegend>Client</FieldLegend>
    <FieldGroup>{/* name, email */}</FieldGroup>
  </FieldSet>
  <FieldSet>
    <FieldLegend>Payment</FieldLegend>
    <FieldGroup>
      {/* a short field and its partner share the same two-column grid; a short field alone sits in it too,
          so every edge lines up. Do not cap a single control with max-w-*. */}
      <div className="grid gap-4 sm:grid-cols-2">{/* issue date, due date */}</div>
      <div className="grid gap-4 sm:grid-cols-2">{/* amount */}</div>
    </FieldGroup>
  </FieldSet>
</FieldGroup>
```

## Error summary, for a form that does not fit the phone viewport

Shown after the first submit with errors, above the first group. It is not a live region (each `FieldError`
already announces itself, and focus goes to the first invalid field), and its links focus the control rather
than change the URL.

```tsx
const invalid = Object.entries(form.formState.errors).filter(([name]) => name !== "root")

{form.formState.isSubmitted && invalid.length > 0 && (
  <div className="rounded-lg border border-destructive p-4 text-sm">
    <p className="font-medium">Fix {invalid.length} {invalid.length === 1 ? "field" : "fields"} to continue</p>
    <ul className="mt-2">
      {invalid.map(([name, error]) => (
        <li key={name}>
          <a
            className="flex min-h-11 items-center underline"
            href={`#invoice-${name}`}
            onClick={(event) => { event.preventDefault(); form.setFocus(name as keyof Invoice) }}
          >
            {error?.message as string}
          </a>
        </li>
      ))}
    </ul>
  </div>
)}
```

## After a successful submit

Show what happened and where the result is, and move focus to that message (`tabIndex={-1}` on its heading,
then `.focus()`), so keyboard and screen-reader users land on it rather than on a button that has gone.
