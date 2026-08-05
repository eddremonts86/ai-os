# Anti-slop prompting contract

AI produces generic design when it is given a generic brief. "Make a modern SaaS dashboard" almost
guarantees slop. The fix is context, constraints and references — plus a demand for reasoning you can
verify.

## Context the brief must carry

- User type and their real working context
- The job they need to complete (the outcome, not the feature)
- Data actually available: fields, formats, ranges, edge cases
- The single primary action
- Risks and permissions involved
- Devices and viewports that matter
- Existing components and design tokens
- States required (loading, empty, error, permission, success)
- Accessibility constraints
- Examples of real content — real names, real lengths
- Visual references, each with a note on *which pattern* interests you and why

## Explicit blocklist

State these as hard constraints, every time:

- No emojis as interface icons
- No colours outside the tokens
- No gradients, glassmorphism or glows without a stated justification
- No cards nested inside cards
- No repeating the same datum across components
- No invented metrics, activity or testimonials
- No multiple primary CTAs
- No important action hidden behind an ambiguous icon
- No skipping loading, empty, error, permission and responsive
- No new component when an equivalent already exists

## Demand verifiable design reasoning

Do not ask for "a nice UI". Ask for:

1. The proposed hierarchy
2. The primary action
3. What information is deferred, and why
4. How state is communicated
5. Which existing system pattern is reused
6. How the edge cases behave
7. Which decisions need validation with real users

## Prompt template

```text
Act as a senior product designer working inside an existing SaaS.

Primary user:
[role and context]

Job to be done:
[the outcome, not the feature]

Screen or flow:
[entry point and exit point]

Primary action:
[exactly one]

Real data available:
[fields, formats, ranges, edge cases]

Existing system:
[components, tokens, navigation, conventions]

Constraints:
- Reuse the existing system.
- Exactly one primary action.
- Colour only for brand, interaction or state.
- No emojis as icons.
- No repeated data.
- No nested cards, no decoration without function.
- Include loading, empty, error, permission and responsive.
- Preserve entered data after an error.
- Meet contrast, visible focus and keyboard navigation.

References:
[attach screenshots; for each, state which pattern matters and why]

Deliver:
1. Information architecture
2. Visual hierarchy
3. Components reused
4. States and edge cases
5. Key microcopy
6. Risks or hypotheses that need testing
7. Proposed implementation, introducing no styles outside the system
```

## Audit prompt (for an agent with repo access)

```text
Audit this SaaS for the problems that make an interface look generic, inconsistent or untrustworthy.

Do not change code yet. Deliver a verifiable report first.

Look specifically for: emojis as functional icons; colours outside the tokens; gradients, glows or
glassmorphism with no function; nested cards; repeated data; multiple primary CTAs; duplicated
components; inconsistent terminology; metrics with no unit, period or source; screens with no
loading/empty/error/permission/success state; risky actions without a specific confirmation; waits
with no feedback; critical routes with unnecessary payload or requests; onboarding that teaches
features before producing value; contrast, focus, keyboard, zoom or responsive problems; analytics
events missing for the primary outcome.

For each finding, deliver: file and line or component; the route where it appears; the user job it
damages; observable evidence; severity P0/P1/P2; a concrete recommendation; the component or token to
reuse; an acceptance criterion; the regression risk.

Then produce: an executive summary of at most 15 findings; a full prioritised table; a change plan in
small batches; a list of decisions that need a human or user validation.

Do not propose a full redesign if hierarchy, content, tokens or existing components can solve it. Do
not invent metrics, users or requirements.
```
