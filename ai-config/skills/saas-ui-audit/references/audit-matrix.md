# The audit matrix

Score each criterion per flow (or per screen for critical screens).

| Score | Meaning |
| --- | --- |
| 0 | Critical failure — blocks, confuses, or destroys trust |
| 1 | Weak — works, but costs effort or is inconsistent |
| 2 | Correct — meets the need clearly |
| 3 | Excellent — reduces effort, prevents errors, reinforces value |

| # | Criterion | Audit question | Red flag | Target |
| --- | --- | --- | --- | --- |
| 1 | Main job | Does the screen help complete a defined outcome? | A collection of features with no priority | One dominant goal |
| 2 | Hierarchy | Is it obvious what to look at and do first? | Several primary CTAs | One dominant action |
| 3 | Clarity | Do the terms match the customer's language? | Internal or vague names | Domain language |
| 4 | Colour | Does every colour have a stable function? | Arbitrary palette | Tokens plus semantics |
| 5 | Typography | Does the scale allow scanning and comparing? | Improvised sizes and weights | Documented scale |
| 6 | Spacing | Is there visual rhythm? | Different margins per screen | A 4/8 system or equivalent |
| 7 | Containers | Do surfaces group useful information? | Nested cards | Fewer boxes, more structure |
| 8 | Data | Does each visualisation answer a question? | Filler metrics | Actionable data |
| 9 | Duplication | Is information repeated with no new reading? | The same KPI in several modules | One primary representation |
| 10 | States | Are loading, empty, error, permission and success designed? | Blank screen or generic message | Complete states |
| 11 | Onboarding | Is first value reached quickly? | A long tour before acting | Early activation |
| 12 | Progress | Can the user see the value obtained? | Activity with no outcome | Progress toward an outcome |
| 13 | Speed | Does the interface confirm and respond immediately? | Waiting with no feedback | Perceptual continuity |
| 14 | Safety | Do risky actions show their consequences? | Generic "Are you sure?" | Specific confirmation |
| 15 | Consistency | Does a learned rule hold product-wide? | Arbitrary variants | A stable UI language |
| 16 | Brand | Does the experience express its own attributes? | Interchangeable template | Functional identity |
| 17 | Accessibility | Usable with keyboard, zoom and screen readers? | Invisible focus, low contrast | Equivalent access |
| 18 | Responsive | Is priority preserved on small screens? | The desktop, shrunk | Reordered by task |
| 19 | Trust | Does information carry source, date and state? | Data with no context | Visible traceability |
| 20 | Analytics | Can the flow's success be measured? | Page views only | Outcome events |
| 21 | Landing ↔ product | Does the first experience keep the commercial promise? | A break between marketing and product | Message continuity |

## Calculation

1. Score each criterion 0–3.
2. Multiply by the flow's impact weight: 1 (low), 2 (medium), 3 (high).
3. Sort by potential value lost — `(3 − score) × impact`.
4. Fix the 0s first, then everything tied to activation, trust or revenue.

## Recording format

```markdown
| Flow | Impact | C1 | C2 | ... | C21 | Weighted loss | Top 3 gaps |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Signup → activation | 3 | 1 | 0 | | 2 | 42 | hierarchy, states, analytics |
```

Keep the raw scores. A second audit after the fixes is the only honest before/after.
