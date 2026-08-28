---
name: optimizing-forms
description: >
  Use when auditing or improving the UX quality of an existing form — wizard steps,
  admin editors, settings panels, dialogs, checkout, signup. Triggers on "optimize
  this form", "improve the form", "form UX", "form accessibility", "validation feels
  wrong", "errors not showing", "too many columns", "field labels", "screen reader",
  "form audit", or a form that works but is hard to fill in. For BUILDING a new form,
  use the host project's form-construction skill instead; this skill judges quality.
license: MIT
metadata:
  hermes:
    tags: [forms, ux, accessibility, audit, wcag, validation]
    related_skills: [antfu-web-design, react-hook-form-zod, fix-ui-ux]
---

# Optimizing Forms

Judge and repair form quality against universal UX rules, satisfied through whatever
mechanism the host project already has.

## Overview

Form quality has two independent failure modes, and fixing one does not fix the other:

1. **The UX rule is violated** — no label association, errors in a toast instead of beside the field, three columns of unrelated fields.
2. **The mechanism is reinvented** — controls hand-composed per screen, so every field re-implements labels, errors and widths slightly differently.

**A form is optimized when a universal UX rule is satisfied _through the project's own mechanism_, not around it.**

These usually fail together, and causally: hand-composed controls inherit none of the label/error/required affordances the project's form abstraction already provides. So fixing mode 1 field-by-field is almost always the wrong move — it hides mode 2 and multiplies the divergence.

## Step 0 — Profile the project first

**Do not prescribe anything before you know what the project already has.** The most common failure of this skill is recommending a generic fix ("add `htmlFor`", "use `fieldset`") when the project has an abstraction that would have supplied it.

```bash
# The form abstraction: is there one component every form goes through?
grep -rl "FormProvider\|useForm(\|Formik\|createForm" src --include=*.tsx | head
find src -iname "*FormContainer*" -o -iname "*FormField*" -o -iname "*FormItem*" | head

# The type scale and colour tokens (decides whether arbitrary px/hex are defects)
grep -rn "text-size-\|fontSize" tailwind.config.* 2>/dev/null | head -5

# The i18n mechanism (decides whether a literal string is a defect)
grep -rl "useTranslation\|selectedTranslations" src --include=*.tsx | head -3

# The test-id convention (you must preserve these when refactoring)
grep -rho "data-test-id\|data-testid" src --include=*.tsx | sort -u
```

Write down four answers before continuing: **form abstraction**, **token system**, **i18n**, **test-id attribute**. If a file under `references/profiles/` matches the stack, read it — the traps are already mapped there.

## Step 1 — Classify the form

This decides which rules apply. Getting it wrong is the second most common failure.

| Class | Marks | Conversion advice applies? |
| ----- | ----- | -------------------------- |
| **Lead capture** — signup, contact, newsletter, checkout, landing page | The user chose to start it; abandoning costs them nothing; the business wants completion rate | **Yes** — minimize fields, defer collection, persuasive CTA copy, A/B test |
| **Line-of-business** — internal tools, admin, wizards over records, compliance and legal data entry | It is the user's job; the data is mandated by a process or regulation; abandoning is not an option | **No** — see below |

## Authority hierarchy — apply in this order

When guidance conflicts, higher wins.

| Rank | Source | Governs | Example |
| ---- | ------ | ------- | ------- |
| 1 | **Host project conventions** (its `CLAUDE.md`/`AGENTS.md`, its form skill, its token system) | _How_ — the mechanism | Route every field through the project's form abstraction; use its tokens and its i18n |
| 2 | **Universal form UX** (WCAG 2.1 AA, label/validation/grouping research) | _What_ — the required behaviour | Persistent associated labels; validate on blur; error adjacent to the field |
| 3 | **Conversion-optimization advice** | Lead-capture forms only (Step 1) | "Cut to 2 fields"; "Create My Account!" |

### Rank 3 on a line-of-business form

Most public form-design writing optimizes lead capture — its success metric is completion rate on a form a stranger chose to start. On an LOB form, **reject**:

- **Field minimization** — fields are mandated by the process, not chosen for conversion.
- **Progressive profiling** ("collect the rest later") — often there is no later; the record locks.
- **Persuasive CTA copy** — the user is doing a job. `Next: Coverage` beats `Get Started!`.
- **Completion-rate and revenue arguments** — no funnel exists, and "improving" them means deleting required data.

**What transfers to both classes** is everything about human perception rather than funnels: single-column layout, persistent labels, validation timing, error specificity, input types, grouping, progress indication, and every accessibility rule.

Rule-by-rule sources and transfer verdicts: `references/rule-provenance.md`.

## Rule → mechanism map

Left column is the requirement — it does not vary. Right column is how to satisfy it; resolve the specifics from your Step 0 profile.

| UX requirement | How to satisfy it |
| -------------- | ----------------- |
| Persistent label, programmatically associated | The project's form-item wrapper, or `<label for>` / `aria-labelledby`. Never a bare `<span>` beside an input. |
| Required-field affordance | The abstraction's validation declaration, so the visual mark and `aria-required` are emitted together. Never a hand-typed asterisk in the label string. |
| Helper / format text | The field's description slot, wired to `aria-describedby`. |
| Validation on blur | Not on keypress (hostile), not only on submit (too late). |
| Error adjacent to its field | The field's message slot, plus `aria-invalid`. A toast is for form-level or save failures only. |
| Specific, actionable error text | Name the constraint and the fix. "Invalid input" is a defect. |
| Correct input type | `email`, `tel`, `url`, `date`, `number` — plus `inputMode`; `type` alone does not settle the mobile keyboard. |
| Single column | One field per row by default. Side by side only for short **and** genuinely related fields (from/to, city/state). |
| Consistent field widths | The project's width tokens or scale. Never per-field hardcoded px. |
| Logical grouping | A heading **and** a real grouping element (`fieldset`/`legend`, or the abstraction's section). A heading alone gives sighted structure and nothing to assistive tech. |
| Progress in multi-step | A step indicator, back navigation, and saved progress. |
| Consistent type scale | The project's type tokens. Never arbitrary `text-[13px]`. |
| Colour in both themes | Semantic tokens. A hex literal cannot invert for dark mode. |
| Confirmation after submit | Say what happened and what comes next. |

## Auditing

Run the mechanical checks first, so your attention goes to judgment:

```bash
node <skill-dir>/audit-forms.mjs src
```

```bash
node <skill-dir>/audit-forms.mjs --json src
```

```bash
node <skill-dir>/audit-forms.mjs --rule A3 src
```

It detects the stack and self-disables rules it cannot judge for that project — no type scale means no arbitrary-font-size rule, rather than a wall of false positives. Exit 1 means violations were found.

**It cannot judge these — inspect them yourself:**

- Is this grouping _logical_, or just visually convenient?
- Is this error message specific and actionable?
- Are these side-by-side fields genuinely related?
- Does the field need to exist at all — and on an LOB form, is it mandated?

## Hard constraints

1. **Never** put a field-level validation error in a toast.
2. **Never** render an input's label as a `<span>`/`<div>`.
3. **Never** hardcode field widths, font sizes, or colours when the project has tokens.
4. **Never** bypass the project's form abstraction in feature code.
5. **Never** treat `type="number"` as sufficient — add `inputMode`.
6. **Always** preserve `data-test-id`s when refactoring; E2E specs bind to them.
7. **Never** apply conversion advice to a line-of-business form (Step 1).

## Common mistakes

**Skipping Step 0.** Prescribing `htmlFor` on a hand-rolled field when the project has a wrapper that would have supplied label, description, error and `aria-required` together. You fixed one field and entrenched the divergence.

**Trusting a project's form skill without checking it against source.** Hand-copied enum listings and file paths drift. When a form abstraction maps a `type` field to a component through a `switch`, an unknown member usually falls through to `default: return null` — **the field silently does not render**, with no error and no type complaint. Verify member names against the real enum. Audit rule A9 does this automatically for detected profiles.

**Treating an internal tool like a landing page.** Suggesting field cuts on a compliance form. Classify first.

**Adding a section heading and calling it grouping.** Sighted users get structure; screen-reader users get an undifferentiated run of inputs.

**Tidying hand-rolled controls instead of migrating.** Fixes mode 1, preserves mode 2.

**Assuming every screen is a form.** Galleries, approval panels and editable data grids are not field lists. Use the project's primitives and tokens there instead of forcing a form abstraction onto them.

## Red flags — stop and re-read the hierarchy

- "Let's reduce the fields to improve completion" → Step 1. Is this lead capture?
- "The toast tells them what's wrong" → constraint 1.
- "It's just a label, a span is fine" → constraint 2.
- "`text-[13px]` matches the mockup" → the mockup has a token.
- "I'll add the aria attribute to this one field" → you are polishing mode 2.

## Cross-references

- **The host project's own form-construction skill** — mechanics. Verify its claims against source.
- **`react-hook-form-zod`** — construction for React Hook Form + Zod stacks.
- **`antfu-web-design`** — broader web interface guideline review.
- **`fix-ui-ux`** — full-product interface remediation, when forms are one part of a larger pass.
- **`references/profiles/`** — per-stack specifics; add one when you profile a new stack.
