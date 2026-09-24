# PRODUCT.md — Why aren't LLM token CDN cache's a thing?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Sorry if this is a stupid question but...<p>Problem:<p>I boot opencode into a codebase. I ask it to do one thing, it has to call 40 tools to &quot;remember&quot; what the codebase looks like relevant to that.<p>It has no memory so every fresh boot is re-explore.<p>My understanding, as an ML n00b, is the GPU have KV states of massive matrices that are multi GB in RAM (e.g., 10-30GB) so dumping to disk and pushing over network (<i>his shoulders shuddered at the thought of egress fees</i>), is not great.<p>So instead we have cache during &quot;work time&quot;, but off &quot;work time&quot;, we have to reboot and build the cache again.<p>But couldn&#x27;t CF or someone setup CDNs to cache token state between days or something like that?<p>Ages ago I was trying to solve part of this problem client side w&#x2F; vectoring a codebase and creating a tool to do quick queries, but I kind of stopped.<p>Curious if LLM token CDNs are gonna be a thing or not

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49714867) · **Category:** ask-hn · **Tags:** Ask HN,Problem
