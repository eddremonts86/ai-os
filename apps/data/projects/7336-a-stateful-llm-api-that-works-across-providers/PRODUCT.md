# PRODUCT.md — A Stateful LLM API that works across providers

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ For the last year we&#x27;ve been building AI workspaces. With every new product, we found ourselves rebuilding the same context layer and infrastructure. We tried existing solutions, but we&#x27;d either have to lock into one provider or have to manage the storage infrastructure.<p>What we wanted was an API that&#x27;s stateful and isn&#x27;t tied to a specific provider. So that we didn&#x27;t have to think about compaction, differing schemas, or running the infrastructure ourselves.<p>Since we&#x27;d already built most of the constituent parts, we’ve decided to release Twigg.<p>The API is deliberately simple. You create a chat and get back an ID. When you have a new prompt or tool result, you send that plus the ID. There&#x27;s no need to store or manage context yourself. It appends the new prompt and assembles the history for you. To switch models, you change one field in the next request.<p>The dashboard covers most of what you&#x27;d want to configure: tool schemas, system prompts, context window limits and retention settings.<p>We&#x27;d like to hear from anyone who has run into the same problems. How are you hosting your context right now, and what would make you not want to hand it to a third party?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49727072) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
