---
name: saas-onboarding-activation
description: Design onboarding that reaches first real value fast, around a defined activation event — instead of a feature tour nobody finishes. Use when asked to "design/fix the onboarding", "improve activation", "users sign up and never come back", "add a setup checklist", "reduce time to value", or when reviewing signup, first-run, empty states or the first session of a product. Covers activation definition, linear vs exploratory onboarding, friction reduction, the welcome message and the onboarding funnel metrics.
---

# Onboarding and activation

Onboarding is not a guided tour of every button. It is the shortest path from signup to concrete
evidence of value.

## Step 1 — define the activation event

Pick an event that represents **value**, not activity. Everything else follows from this choice, so do
not delegate it to an agent — it is a product decision.

| Not activation | Activation |
| --- | --- |
| Created an account | Imported data and got the first useful result |
| Visited the dashboard | Detected, resolved or shared an issue |
| Invited a teammate | The team completed the first collaborative flow |

Write it down as one sentence, instrumented as one event.

## Step 2 — linear or exploratory

**Linear onboarding** is right when a mandatory sequence exists: connect a source → verify the data →
run the first process. Order is not optional, so do not pretend it is.

**Exploratory interface** is right *after* minimum setup, when the user needs to navigate by their own
context.

Never force a linear tour through features that have no meaning yet.

## Step 3 — the first-use checklist

Three to five steps, no more:

1. Configure the bare minimum
2. Enter or connect data
3. Run the core action
4. Review the first result
5. Invite or share — **only** if it expands the value

Each step must: have a visible reason · show progress · be resumable · confirm completion · lead
directly to the action it describes.

## Step 4 — remove friction

- Ask only for the data the next step needs.
- Let non-critical personalisation questions be skipped.
- Use safe defaults.
- Offer sample data when an empty product cannot demonstrate value.
- Explain why a permission or integration is requested, before requesting it.
- Do not ask for a card before demonstrating value, unless the model requires it.
- Save progress. Always.
- Never put a wall of configuration before the first reward.

## Step 5 — the welcome message

Treat it as a short letter of intent:

- What outcome the product will help achieve
- What happens next
- What the user needs to have ready
- How much effort it takes — without promising times the system does not control
- Where to get help

**Continuity test:** the first message inside the product must continue the sentence that convinced the
user on the landing page. See `saas-landing-continuity`.

## Empty states are onboarding

An empty state is the most-visited screen of a new account. It must carry: what this screen is for ·
what to do first (one primary action) · a realistic sample or preview of what it will look like when
populated · why it is empty, if that is not obvious.

An empty state that only says "No data" is a dead end and a P1 finding.

## Metrics

- Time to activation
- Percentage completing each step
- Abandonment per step
- Errors per step
- Percentage using sample vs real data
- Retention after activation
- Help or support usage

## Onboarding funnel to instrument

1. Landing visit
2. Signup started
3. Signup completed
4. Minimum setup completed
5. **Activation event**
6. Second meaningful use
7. Recurring use
8. Conversion to paid or expansion

Events worth instrumenting throughout the product: critical screen view · flow start and completion ·
validation error · server error · filter use · search with no results · primary CTA · onboarding
abandonment · help use · undone action · export or share · plan change or cancellation intent.

For each event document: stable name · definition · actor · affected object · relevant context ·
allowed properties · data that must **not** be captured · owner · the dashboard or decision it feeds.

## Weekly loop

1. Review the funnel and errors
2. Pick one high-impact friction point
3. Watch sessions or talk to affected users
4. Form a concrete hypothesis
5. Change the minimum necessary
6. Measure the result
7. Keep, iterate or revert

## Checklist

- [ ] An activation event is defined and instrumented
- [ ] Onboarding leads to that event
- [ ] Only necessary information is requested
- [ ] Progress is saved
- [ ] Optional steps can be skipped
- [ ] Permission requests are explained
- [ ] Sample data exists where it helps
- [ ] The user can return to the checklist
- [ ] Abandonment and time-to-value are measured
- [ ] The first message continues the landing promise

## Related skills

`saas-expensive-ui` · `saas-ui-audit` · `saas-landing-continuity` · `saas-data-trust` (progress display).
