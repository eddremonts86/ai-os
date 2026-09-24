# PRODUCT.md — Automatically keep track of all features implemented in a project

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built this because I wanted to automate my least favourite part of documentation writing - expressing at a high level what was implemented. There are a couple of situations where you could need that:
- to show to the client what changed since the last update
- to show to an executive, where the fucus went lately
- to explain to a new team member, what the project is about<p>Because the report (you can see how it looks here: <a href="https:&#x2F;&#x2F;github.com&#x2F;netizer&#x2F;feature-ledger&#x2F;blob&#x2F;main&#x2F;docs&#x2F;client&#x2F;feature-ledger-Feature-Ledger_2.pdf" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;netizer&#x2F;feature-ledger&#x2F;blob&#x2F;main&#x2F;docs&#x2F;cli...</a>) is automated, I also use it as a discovery tool in projects I just started working on.<p>The way it works:
- `ledger init` - creates a `.ledger` directory; descriptions of all new features will be stored there
- `ledger bootstrap` - prints out a prompt to be used in a coding agent; it will analyse a new codebase and create the JSON files describing all features
- `ledger audit` - when you usa a coding agent it will automatically keep the feature list up-to-date, audit is to discover features implemented without a coding agent
- `ledger release cut --name &quot;Release name&quot; --date 2026-09-11` - run it after you&#x27;ve just shown to the client what had changed and you want to start working on a new set of features; in the new ledger you will see new features in green, updated features with blue, and deleted ones in red
- `ledger build` - run it whenever you want to see the report of new features; there are 3 files generated based on JSON files describing features: a PDF for the client, FEATURES.md (the same but in an MD format), FEATURES_EXTENDED.md (the same but including implementation details - this is for the dev team)

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49654287) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
