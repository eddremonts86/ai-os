# Field recipes

Complete, short examples on shadcn's `Field` family. They were built on shadcn's `base-nova` style, which
uses Base UI primitives. In a Radix or React Aria project the `Field` parts are the same, but check each
control's props (`checked` / `onCheckedChange`, `value` / `onValueChange`) against the project's own
`components/ui` files before copying.

Every control goes inside a `Field`. The legacy form wrapper (`components/ui/form`) is not used.

## Schema first

```ts
import { z } from "zod"

export const invoiceSchema = z.object({
  client: z.string().trim().min(1, "Enter the client's name."),
  email: z.email("Enter an email address, like name@company.com."),
  amount: z.coerce.number<string>().positive("Enter an amount above zero."),
  notes: z.string().max(500, "Keep notes under 500 characters.").optional(),
  sendCopy: z.boolean(),
})
export type Invoice = z.infer<typeof invoiceSchema>
```

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
                aria-invalid={fieldState.invalid}
                aria-describedby="invoice-email-help invoice-email-error"
              />
              <FieldDescription id="invoice-email-help">The invoice is sent here.</FieldDescription>
              {fieldState.invalid && <FieldError id="invoice-email-error" errors={[fieldState.error]} />}
            </Field>
          )}
        />
        {errors.root && <FieldError errors={[errors.root]} />}
        <Field orientation="horizontal">
          <Button type="submit" aria-busy={isSubmitting} disabled={isSubmitting}>
            {isSubmitting ? "Sending…" : "Send invoice"}
          </Button>
          <Button type="button" variant="ghost" onClick={() => form.reset()}>Cancel</Button>
        </Field>
      </FieldGroup>
    </form>
  )
}
```

`handleSubmit` focuses the first invalid field when `shouldFocusError` is on (the default) and every control
receives `field.ref`. A server error for one field: `form.setError("email", { message })`. Any other failure:
`form.setError("root", { message })`, shown above the actions as in the example.

## The same field with `@tanstack/react-form`

```tsx
import { useForm } from "@tanstack/react-form"
import { Field, FieldError, FieldLabel } from "@/components/ui/field"
import { Input } from "@/components/ui/input"

const form = useForm({
  defaultValues: { email: "" },
  onSubmit: async ({ value }) => onSave(invoiceSchema.pick({ email: true }).parse(value)),
})

<form.Field
  name="email"
  validators={{
    onBlur: invoiceSchema.shape.email,
    onChange: ({ value, fieldApi }) =>
      fieldApi.state.meta.isBlurred ? invoiceSchema.shape.email.safeParse(value).error?.issues[0] : undefined,
  }}
>
  {(field) => {
    const invalid = field.state.meta.isBlurred && !field.state.meta.isValid
    return (
      <Field data-invalid={invalid}>
        <FieldLabel htmlFor={field.name}>Client email</FieldLabel>
        <Input
          id={field.name}
          name={field.name}
          type="email"
          autoComplete="email"
          value={field.state.value}
          onBlur={field.handleBlur}
          onChange={(e) => field.handleChange(e.target.value)}
          aria-invalid={invalid}
          aria-describedby={`${field.name}-error`}
        />
        {invalid && <FieldError id={`${field.name}-error`} errors={field.state.meta.errors} />}
      </Field>
    )
  }}
</form.Field>
```

## One input, many jobs: `InputGroup`

A prefix, suffix, icon or button belongs inside the control's own border. Never a `div` around an input.

```tsx
import { InputGroup, InputGroupAddon, InputGroupButton, InputGroupInput, InputGroupText } from "@/components/ui/input-group"

// amount with currency
<InputGroup>
  <InputGroupInput {...field} id="invoice-amount" inputMode="decimal" className="text-right tabular-nums" />
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
  <InputGroupInput {...field} id="site-url" inputMode="url" autoComplete="url" />
  <InputGroupAddon align="inline-end"><InputGroupButton onClick={copy}>Copy</InputGroupButton></InputGroupAddon>
</InputGroup>
```

Inside a `Field`, `InputGroup` takes the place of `Input`; the `id`, `aria-invalid` and `aria-describedby` go
on `InputGroupInput`.

## Textarea, checkbox, switch, radio group, select

The `Field` shell is the same; only the control and the orientation change.

```tsx
// textarea
<Field data-invalid={fieldState.invalid}>
  <FieldLabel htmlFor="invoice-notes">Notes <span className="text-muted-foreground">(optional)</span></FieldLabel>
  <Textarea {...field} id="invoice-notes" rows={4} aria-invalid={fieldState.invalid} />
</Field>

// checkbox or switch: control first, label beside it
<Field orientation="horizontal">
  <Checkbox id="invoice-copy" name={field.name} checked={field.value} onCheckedChange={field.onChange} />
  <FieldLabel htmlFor="invoice-copy" className="font-normal">Send me a copy</FieldLabel>
</Field>

// radio group: a FieldSet names the question, each option is a horizontal Field
<FieldSet>
  <FieldLegend variant="label">Payment terms</FieldLegend>
  <RadioGroup name={field.name} value={field.value} onValueChange={field.onChange}>
    {["14 days", "30 days"].map((term) => (
      <Field key={term} orientation="horizontal">
        <RadioGroupItem id={`terms-${term}`} value={term} />
        <FieldLabel htmlFor={`terms-${term}`} className="font-normal">{term}</FieldLabel>
      </Field>
    ))}
  </RadioGroup>
</FieldSet>

// select: the trigger carries the id and the invalid state
<Field data-invalid={fieldState.invalid}>
  <FieldLabel htmlFor="invoice-currency">Currency</FieldLabel>
  <Select name={field.name} value={field.value} onValueChange={field.onChange}>
    <SelectTrigger id="invoice-currency" aria-invalid={fieldState.invalid}><SelectValue /></SelectTrigger>
    <SelectContent>
      <SelectItem value="EUR">EUR</SelectItem>
      <SelectItem value="DKK">DKK</SelectItem>
    </SelectContent>
  </Select>
  {fieldState.invalid && <FieldError errors={[fieldState.error]} />}
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
      <div className="grid gap-4 sm:grid-cols-2">{/* issue date, due date: short and one thing */}</div>
      {/* amount */}
    </FieldGroup>
  </FieldSet>
</FieldGroup>
```

## Error summary, for a form longer than one screen

```tsx
const invalid = Object.entries(form.formState.errors).filter(([name]) => name !== "root")

{form.formState.isSubmitted && invalid.length > 0 && (
  <div role="alert" tabIndex={-1} ref={summaryRef} className="rounded-md border border-destructive p-4 text-sm">
    <p className="font-medium">Fix {invalid.length} {invalid.length === 1 ? "field" : "fields"} to continue</p>
    <ul className="mt-2 list-disc pl-5">
      {invalid.map(([name, error]) => (
        <li key={name}><a className="underline" href={`#invoice-${name}`}>{error?.message as string}</a></li>
      ))}
    </ul>
  </div>
)}
```
