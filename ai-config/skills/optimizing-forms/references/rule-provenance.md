# Rule provenance and transfer verdicts

Where each rule in `SKILL.md` comes from, and the condition under which it applies.

## Sources

| #   | Source                                                                                                | Domain it was written for                                                     |
| --- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| S1  | landy-ai, "Mejores Prácticas de Diseño de Formularios: 12 Reglas UX/UI para Mayores Conversiones" (Feb 2026) | Landing-page / lead-capture forms, optimized for conversion rate        |
| S2  | La Bitácora de UX, "Diseño UX para formularios complejos" (May 2025)                                  | Long, complex forms — fiscal, legal, technical                                |
| S3  | Microsoft Learn, "Creación y diseño de formularios de aplicaciones controladas por modelos" (Power Apps) | Line-of-business data entry                                                 |

**Why the domain matters.** S1 is the most detailed source and the least universally
transferable: its success metric is completion rate on a form a stranger chose to
start. S3 is the least prescriptive but covers internal tools. S2 sits between and
transfers to both. This is why `SKILL.md` Step 1 makes you classify the form before
applying anything.

## Universal — apply to every form class

| Rule                                                                                                                                          | Source        | Note                                                                                                                            |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Single-column layout; multi-column only for short _related_ fields (City/State, First/Last)                                                    | S1 #1         | Perception, not conversion. Audit rule A5. The "related" carve-out is why A5 is a prompt to look, not an automatic defect.       |
| Persistent labels, never placeholder-only                                                                                                      | S1 #3         | Strengthened here to _programmatic association_, not just visible text. Audit rules A8 and A10.                                  |
| Mark required fields consistently; label optional ones                                                                                        | S1 #3         | Declare it in the abstraction so the visual mark and `aria-required` are emitted together.                                       |
| Validation on blur; not on keypress; not only on submit                                                                                       | S1 #4, S2     | Both sources agree. Validating only on submit is the most common real-world violation.                                          |
| Specific, actionable error messages                                                                                                            | S1 #4, S2     | Judgment call — no audit rule can score message quality.                                                                        |
| Error adjacent to the field it concerns                                                                                                        | S1 #4         | Hard constraint 1. A toast detaches the message from its cause.                                                                 |
| Correct input types (`email`, `tel`, `url`, `date`, `number`)                                                                                   | S1 #5         | Plus `inputMode` — audit rule A3. S1 overstates what `type` alone does on mobile.                                               |
| Placeholders as _examples_, not instructions; helper text for format rules                                                                     | S1 #6         | Helper text belongs in the field's description slot, wired to `aria-describedby`.                                               |
| Group related fields with visual **and** semantic grouping                                                                                     | S1 #7, S2, S3 | All three agree. S3 frames it as tabs/sections, S1 as `fieldset`/`legend`. A heading alone satisfies neither.                    |
| Smart defaults; autocomplete attributes; progressive _disclosure_ of irrelevant fields                                                        | S1 #9, S2     | Progressive **disclosure** (hide what does not apply) is universal. Progressive **profiling** (defer collection) is not — below. |
| Progress indicator in multi-step; allow going back; save progress                                                                              | S1 #10, S2    | S2 frames it as reducing cognitive load; S1 as reducing abandonment. Same mechanism.                                            |
| Confirmation feedback after submit                                                                                                             | S1 #11, S2    | Say what happened and what comes next.                                                                                         |
| WCAG 2.1 AA: label association, keyboard navigation, 4.5:1 contrast, error not conveyed by colour alone, visible focus, `aria-required` / `aria-invalid` / `aria-describedby`, live regions | S1, S2 | Non-negotiable, and often a legal requirement (EN 301 549, ADA, EAA). |
| Touch targets ≥44×44 px; ≥16 px font to prevent mobile zoom                                                                                    | S1 #12        | Applies wherever the form actually renders on touch. On a desktop-only internal tool, treat as a floor, not a mandate to enlarge everything. |
| Simplify language; define domain terms                                                                                                         | S2            | Especially in domain-heavy internal tools, where the vocabulary is the barrier.                                                 |
| Split complex forms into logical, manageable sections                                                                                          | S2, S3        | The structural argument behind multi-step wizards.                                                                              |
| Decide you have the right data model before designing the form; form complexity mirrors data + process complexity                              | S3            | The counterweight to S1: complexity is sometimes inherent, not a defect.                                                        |

## Lead-capture only — reject on line-of-business forms

| Rule                                                                        | Source        | Why it fails on an LOB form                                                                   |
| --------------------------------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------- |
| Minimize required fields; drop anything not "absolutely necessary"          | S1 #2         | Fields are mandated by a process or a regulation, not chosen for conversion.                   |
| Progressive profiling — collect basics now, the rest later                   | S1 #2, #9     | Often there is no later: the record locks, or the downstream process needs it all at once.      |
| Action-oriented persuasive CTA copy ("Create My Account", "Get My Free Trial") | S1 #8       | Wrong register. The user is doing their job, not being converted.                              |
| Conversion-rate framing (120% lift, 14% multi-step advantage, revenue-per-form) | S1 throughout | No funnel exists, and "improving" these numbers means deleting required data.                |
| "Reducing 11 fields to 4 increases conversions 120%"                        | S1 FAQ        | Cited as justification for field removal. Not applicable to mandatory data entry.              |
| Confirmation emails with upsells or related offers                          | S1 #11        | Not applicable to internal flows.                                                              |
| A/B test both approaches to see which converts                              | S1 FAQ        | Usually no traffic to test, and the structure is a business requirement.                       |
| Multi-step for >10 fields, single page for ≤5                               | S1 FAQ        | Useful heuristic for a **new** form. On an existing LOB wizard, step count reflects a lifecycle, not field count. |

## Where the sources disagree

**S1: "fewer fields always wins." S3: "complexity mirrors your process."**
On an LOB form S3 wins. When someone proposes cutting fields for simplicity, the
question is whether the _data_ is required downstream — check the schema and the
domain rules, not a conversion heuristic.

**S1 recommends `fieldset`/`legend`. Your project may have its own section primitive.**
Rank 1 of the hierarchy wins on _how_: satisfy the grouping requirement through the
framework's mechanism rather than hand-writing `fieldset` inside a hand-rolled form.
If the framework has no accessible grouping primitive, that is a gap to fix in the
framework, not to work around per feature.
