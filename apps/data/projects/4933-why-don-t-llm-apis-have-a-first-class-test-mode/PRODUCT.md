# PRODUCT.md — Why don't LLM APIs have a first-class test mode?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Context: At work, we’re getting ready to stress-test a chatbot for scalability.<p>One fairly obvious issue came up: if our load tests exercise the real OpenAI&#x2F;Claude APIs, a scalability test can quickly turn into a token-spending test.<p>Fair enough. We shouldn’t burn real inference just to test whether our own gateways, queues, WebSockets, streaming paths, retries, etc. can handle load.<p>The proposed solution was to mock all communication between our backend and the LLM provider.<p>Also reasonable.<p>What surprised me was the next step: we have to build and maintain that mocking service ourselves.<p>We can certainly do that. But should every company integrating with LLM APIs have to reinvent this?<p>Stripe solved a similar developer-experience problem years ago. They provide test mode, test data, test helpers, and even stripe-mock. It isn’t intended to perfectly reproduce Stripe’s backend behavior, but that’s okay. For many tests, you just need something API-compatible and predictable.<p>I’d love to see OpenAI, Anthropic, and other LLM providers offer something similar: an official API-compatible test endpoint that doesn’t invoke a model or consume billable tokens.<p>Ideally it could support things like:<p>* deterministic canned responses
* streaming responses
* configurable latency &#x2F; time-to-first-token
* configurable token counts
* tool-call responses
* 429s, 5xx errors and timeouts
* malformed&#x2F;interrupted streams
* rate-limit simulation<p>The goal wouldn’t be to benchmark the LLM provider. You’d still need the real API for that. The goal would be to stress-test everything around the model without paying for thousands or millions of unnecessary inference calls.<p>What’s slightly ironic is that both OpenAI and Anthropic appear to use OpenAPI-based mock servers in their own SDK test suites. But, as far as I can tell, neither exposes that concept as a first-class public service for customers.<p>Am I missing something?<p>For teams running LLM applications at scale, how are you handling this today — homegrown mock server, generic HTTP mocking, record&#x2F;replay, or just putting a budget cap on real API load tests?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49556909) · **Category:** ask-hn · **Tags:** Ask HN,Problem
