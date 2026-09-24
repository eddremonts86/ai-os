# PRODUCT.md — 1Baton – a no-code tool for chaining API calls

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN!<p>I&#x27;ve been building a no-code tool for authoring and running API integration tests called 1Baton.<p>I work with APIs on a daily basis, building and testing them. In the services I work on, a single API endpoint often represents only a small action in a larger process, so testing a complete flow usually means calling several endpoints in sequence.<p>When I started testing these flows, I found myself spending too much time setting up and reusing the same multi-step processes across different tests. I wanted to define a flow once, reuse it as a building block, and avoid having to manually maintain the connections and data passed between requests.<p>This is what led me to build 1Baton.<p>The basic idea is to define HTTP requests once, compose them into reusable sequences, and then use those sequences to create runnable scenarios, without writing glue code to pass data between requests.<p>A request or sequence is also flagged as invalid as soon as a required parameter is missing or becomes stale, directly in the editor, before you run the scenario.<p>There are three building blocks:
- Requests - HTTP requests with defined inputs and outputs.
- Sequences - reusable groups of requests, where outputs from one request can be passed to later requests without writing glue code.
- Scenarios - runnable test cases composed from requests and sequences, with a run monitor showing the result of each step.<p>The runner is an npm package, while the authoring experience is browser-based. You can currently use it to test public APIs without setting up anything locally.<p>It&#x27;s still an MVP and there are definitely things missing. I&#x27;m mainly interested in finding out whether this workflow is actually useful to other developers and QA engineers, and how you currently solve this kind of problem.<p>I&#x27;d be very interested in hearing what you think, including reasons why you wouldn&#x27;t use it.<p>Try it here: <a href="https:&#x2F;&#x2F;app.1baton.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;app.1baton.com&#x2F;</a>
The landing page is here: <a href="https:&#x2F;&#x2F;1baton.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;1baton.com&#x2F;</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49686047) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
