# PRODUCT.md — Orthogonal – One integration for agents to discover and pay for APIs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN, we&#x27;re Bera and Christian, and we&#x27;re building Orthogonal.<p>Orthogonal gives AI agents one integration to discover, access, and pay for APIs. Think OpenRouter for the APIs that AI agents use.<p>We currently have 50+ API providers and 700+ API endpoints across company, people, financial, and web data, available through our MCP server and SDK on a pay-as-you-go basis. We started with GTM related APIs and are now expanding the catalog.<p>You can try at <a href="https:&#x2F;&#x2F;www.orthogonal.com&#x2F;">https:&#x2F;&#x2F;www.orthogonal.com&#x2F;</a>. You&#x27;ll need to create an account to use the chat or connect the MCP&#x2F;SDK.<p>An example prompt for the chat or MCP:
    Find AI infrastructure startups that recently raised a Seed or Series A and return their founders, LinkedIn profiles, and relevant company data.<p>When we heard about <a href="https:&#x2F;&#x2F;x402.org&#x2F;" rel="nofollow">https:&#x2F;&#x2F;x402.org&#x2F;</a>, we saw an opportunity to make APIs easier for agents to pay for. Instead of an agent needing to manage an API key and billing for every API, what if it could just pay for each request?<p>So we started onboarding existing API providers onto x402. Then we realized an agent cannot pay for an API it doesn’t know exists. It also needs to figure out which API can complete the task and how to use it.<p>We also found that putting every small API payment on-chain did not always make sense. If both sides already have accounts with Orthogonal, settling internally is simpler. So we separated API discovery and access from the payment rail.<p>Today, payments can happen through Orthogonal credits, x402, <a href="https:&#x2F;&#x2F;mpp.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;mpp.dev&#x2F;</a>, or <a href="https:&#x2F;&#x2F;www.circle.com&#x2F;nanopayments" rel="nofollow">https:&#x2F;&#x2F;www.circle.com&#x2F;nanopayments</a>.<p>The problem we&#x27;re working on now is API selection.<p>If five APIs can answer the same request, which should the agent use? The cheapest might have worse coverage. Another might be more accurate but slower.<p>We&#x27;re working on using price, latency, reliability, and result quality to help agents make those decisions.<p>How are you currently giving agents access to paid APIs?<p>And if you gave an agent a budget, would you trust it to choose which API provider to spend it on?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49523765) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
