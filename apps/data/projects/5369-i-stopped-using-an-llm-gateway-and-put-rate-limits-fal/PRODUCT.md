# PRODUCT.md — I stopped using an LLM gateway and put rate-limits/fallback in-process

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Sup HN. I built VernLLM cuz every LLM gateaway I looked at, meant adding a network hop just to get rate limiting, multi provider fallback, circuit breaking and other features.<p>Needing to take a whole seperate service just to deploy, monitor and trust with my API keys is just annoying since my whole tech stack was just TypeScript and Node.<p>VernLLM does the same job within your LLM calls, but its in process instead. Its supports OpenAI-compatible APIs, Anthropic, Gemini and Bedrock providers.<p>I would also argue that the features VernLLM provides is more developed then any other gateaway out there when it comes to resilience and customization.<p>The tradeoff vs a gateaway is that it has no centralized policy across multiple apps or languages so if you want that then its better to use a gateaway instead.<p>Here is the docs for more info: <a href="https:&#x2F;&#x2F;vernllm.dev" rel="nofollow">https:&#x2F;&#x2F;vernllm.dev</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49585787) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
