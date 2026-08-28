# Stack profiles

A profile records what a specific form stack provides, so the skill can prescribe
"use the mechanism you already have" instead of generic advice — and so
`audit-forms.mjs` can enable stack-specific rules without guessing.

Without a matching profile the skill still works: Step 0 of `SKILL.md` walks you
through discovering the same facts by hand, and the audit runs its universal rules
only. A profile turns that discovery into something reusable.

## Existing profiles

| Profile | Detected by | Enables |
| ------- | ----------- | ------- |
| [`wave-schilling.md`](wave-schilling.md) | `src/components/globals/form/types/index.ts` exists | A4, A6, A7, A9 |

## Writing a new one

Answer the four Step 0 questions, then verify each answer **against the code** rather
than against the project's own documentation. Documentation drift is the single
biggest source of wrong prescriptions here — see trap 2 in the wave profile for a
case where a skill documented six field types that did not exist.

Record:

1. **The form wrapper** — what owns the form instance, so you know what feature code must not call.
2. **The per-field wrapper** — what emits label, description, error and required affordance together.
3. **The config → component mapping** — and critically, **what it does with an unknown type**. If it ends in a silent `default: return null`, say so; that is a whole class of invisible bug.
4. **Which prop each renderer actually reads** for its options list. Grep the components; do not assume one answer holds for all field types.
5. **Token names** for widths, type scale and colour.
6. **Any local fork** of the shared framework, and why.

Then add an entry to `PROFILES` in `audit-forms.mjs`:

```js
{
  name: 'my-stack',
  detect: (root) => existsSync(join(root, 'path/that/only/this/stack/has')),
  types: 'path/to/field-type/enum.ts',   // read at runtime; never hand-copied
  typesEnum: 'FieldTypes',
  frameworkPath: 'components/form',       // files allowed to call the form library
  abstraction: /MyFormContainer/,          // presence means labels are handled
  itemsFamily: ['select', 'radio'],        // types whose renderer reads `items`
}
```

Keep `types` pointing at real source. The whole point of reading the enum at runtime
is that a profile cannot rot the way a markdown listing does.

## When a stack has no abstraction

Some projects genuinely compose controls per screen. Then failure mode 2 in
`SKILL.md` is the finding: recommend introducing a per-field wrapper before fixing
individual fields, because otherwise every fix is applied N times and drifts.
