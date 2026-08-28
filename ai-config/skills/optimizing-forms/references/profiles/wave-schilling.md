# Profile: wave / Schilling (`FormContainer` + `IData[]`)

Applies to repos containing `src/components/globals/form/types/index.ts` — the wave
template and everything built from it (wave / `schilling-new`, kontrakt-manager, and
other wave-template descendants).

Detected automatically by `audit-forms.mjs`, which then enables rules A4, A6, A7, A9.

## The mechanism

| Concern | Where |
| ------- | ----- |
| Form wrapper (owns the RHF instance) | `src/components/globals/form/components/FormContainer.tsx` |
| Per-field wrapper (label, description, error, required affordance) | `src/components/globals/form/components/FormItemContainer.tsx` |
| Field config → component mapping | `src/components/globals/form/hooks/useInputsFields.tsx` |
| Field config type + enums | `src/components/globals/form/types/index.ts` |
| Base inputs | `src/components/globals/form/components/base/` |
| Combination inputs | `src/components/globals/form/components/combinations/` |
| Validation rules | `src/components/globals/form/validations/validationSchema.ts` |
| Form state helper | `src/components/globals/form/hooks/useForms.tsx` |

Fields are declared as `IData[]` in a feature's `const/` file and rendered by
`FormContainer`. Do not call `useForm()` in feature code.

## Rule → mechanism, concretely

| Requirement | Do this |
| ----------- | ------- |
| Associated label | `IData.label` — `FormItemContainer` emits the association |
| Required | `IData.ruleName: RuleNameTypes.required` |
| Helper text | `IData.description` |
| Validation | `IData.ruleName` for standard rules, `IData.rules` for custom |
| Field width | `className: 'w-full max-w-[var(--field-width-f3)]'` — f1..f6 = 70/100/180/300/500/600px |
| Select options | `items` — but see the trap below |
| Custom render | `type: InputsTypes.customElement` + `customElement: () => JSX` |
| Labels/strings | `selectedTranslations.*` — never hardcode |

## Traps

### 1. `items` vs `options` is per field type, not absolute

`IData` declares **both** `items?: IData[] | IOptions[]` and `options?: IOptions[]`,
so either type-checks. Which one is read depends entirely on the renderer, verified
by grepping the components:

**Reads `item.items`** — passing `options:` renders an empty control, silently:
`SelectBtn` (`select`), `RadioInput` (`radio`), `RadioGroupInput`
(`radioPlusTextInput`), `SelectPaginated` (`selectPaginated`), `CheckboxPlusDate`
(`checkboxPlusDate`), `CheckboxPlusSelect` (`checkboxPlusSelect`), `CombinedInputs`
(`combinedInputs`), `DateInputPlusSelect` (`dateInputPlusSelect`).

**Reads `item.options`** — `options:` is CORRECT here:
`SelectPlusImage` (`languageCode` / `selectPlusImage`), and in wave
`ClientsType` (`clientType`).

A blanket "never use `options`" rule is wrong and produces false positives on the
second group. Audit rule A7 reads the field's declared `type` from its own object
literal before deciding.

*Real instance found by A7:* `wave/src/features/titles/const/titleDetail.const.ts`
declares `FormatCode` as `InputsTypes.select` with `options: []`, while the adjacent
field correctly uses `items: []`.

### 2. An unknown `InputsTypes` member makes the field vanish silently

`useInputsFields` ends in `default: return null`. A `type` that is not a real enum
member yields `undefined`, falls through, and renders nothing — no error, no console
warning, no type error at the call site.

Do not trust hand-copied enum listings in documentation. As of writing, the
`wave-form-builder` skill in kontrakt-manager documents six members that do not
exist (`number`, `date`, `separator`, `roleManager`, `radioGroup`, `dateSelect`) and
two wrong file paths. Audit rule A9 reads the real enum from source at runtime.

### 3. The enum promises more than the renderer delivers

Some descendants inherit the full `InputsTypes` enum but not every renderer, because
the missing ones depend on features that repo does not have (`isbnInput`,
`clientType`, `manageRoles`, `contactCirculation`, `combinedPhone`,
`checkboxPlusDate`, `SelectPlusInfoText`, `warningDateInput` in kontrakt-manager).
Those members type-check and render `null`. A9 catches unknown members; it cannot
catch a known member with no case in the local `useInputsFields`. Check the switch.

### 4. `FormContainer` behaviour may be forked per repo

kontrakt-manager's `FormContainer` propagates every `form.watch()` change
immediately, bypassing the `handleSubmit` gate, to drive debounced autosave. wave's
only seeds `initialValues`. Read the local file before assuming when
`updateFormValues` fires.

## Known divergence: hand-composed forms

`kontrakt-manager/src/features/contracts` does not use `FormContainer` at all — it
hand-composes shadcn controls inside local `Panel`/`Field`/`SectionTitle` primitives
where `Field` renders a `<span>`, not an associated `<label>`.

The measured contrast, same script, same profile:

| Repo / scope | Files | Violations | A10 (unassociated labels) | A5 (3-col field grids) |
| ------------ | ----- | ---------- | ------------------------- | ---------------------- |
| wave `src/features` | 655 | 63 | **0** | **0** |
| kontrakt-manager `src/features` | 275 | 213 | 36 | 9 |

This is the skill's thesis as data: routing fields through the abstraction removes
whole rule classes rather than fixing them field by field.

Migration plan for that repo:
`kontrakt-manager/docs/superpowers/plans/2026-08-19-wave-design-parity.md`, phase 2.
