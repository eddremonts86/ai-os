# PRODUCT.md — Skillzero – save tokens by omitting skills from agent context

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, this is a first for me. I use agents for multiple things, from daily life, fitness, video editing, to (performance) engineering. For some of those I have skills globally installed, because I may need them across different projects. But this means in any unrelated task, all skill names + descriptions will still make it into the agent context [1]. 
This is not the end of the world, but also not great as it could lead to your agent no longer invoking skills reliably (see Addy Osmani&#x27;s <a href="https:&#x2F;&#x2F;addyo.substack.com&#x2F;p&#x2F;audit-your-agent-files" rel="nofollow">https:&#x2F;&#x2F;addyo.substack.com&#x2F;p&#x2F;audit-your-agent-files</a>).<p>With skillzero, you can manage the skills via CLI. It splits them in 3 categories:
- hidden skills (entirely removed from context) → they now behave like &#x2F;-commands
- collection skills (bundled into <i>one</i> skill, so the agent sees only one name + description) → agent can still invoke these when it thinks it should use them
- regular skills (untouched by skillzero)<p>You can install it via `npx skillzero` (or `pnpx` or whatever you prefer).<p>[1]: Actually Claude Code &amp; Codex have an optimization, if the name+desc&#x27;s exceed 1%&#x2F;2% of the context window, both will omit some skills entirely.<p>Happy to hear any feedback!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49698184) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
