# PRODUCT.md — Casefile – Git why for AI-assisted development

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ During my work at Brokk last year we developed a task-slicing system. The idea was to have a bunch of tasks where each task can be implemented and verified in isolation. So I can mentally focus only on one task at a time with checking the evidence it works as expected. Most follow-up tasks are based on their predecessor(s).<p>After my time at Brokk I picked up this idea and developed Casefile. To avoid loading the entire previous session context, the agent creates a task log. So a follow-up task only needs to load the necessary task logs + git state as the base to implement its task. Each log is linked to its commit, so git blame on a line leads back to the decision behind it. Another advantage of this approach is that you can retrieve the intent why a code change was made and which alternative solutions were skipped. You can see the workflow in the open at <a href="https:&#x2F;&#x2F;github.com&#x2F;native-federation&#x2F;devtools" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;native-federation&#x2F;devtools</a>.<p>Last month I extended the system to store the plan and task logs in a non-public Casefile repository because my enterprise customers don&#x27;t allow work artifacts like these in their repositories.<p>Give it a shot if you think it&#x27;s useful. I would like to hear your feedback!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49564994) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
