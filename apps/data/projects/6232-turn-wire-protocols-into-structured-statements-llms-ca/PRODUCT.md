# PRODUCT.md — Turn wire protocols into structured statements LLMs can understand

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, we built an extension to Envoy proxy that parses and sends contents of requests to an LLM at runtime.<p>We do that by adding a deterministic SQL parser, gGRPC payload inspection and LLM analysis of the payload before upstream call.<p>Users are proxying headless agents traffic with it so that sec teams can have their prompts blocking harmful actions via network traffic before it leaves the agent.<p>When you tell the LLM analyzing the traffic to block writes, it will spot it across the different protocols by looking at the structured payload we build from parsing the binary protocol.<p>It runs as a UDS upstream, and we&#x27;re exploring bundling it inside envoy to remove the UDS hop.<p>Envoy is incredible, but it has limited support for anything outside http. Basic database query parsing, little policy enforcement on request contents, most of the stuff happens on HTTP and gRPC headers or metadata.<p>Would love to hear any feedback: <a href="https:&#x2F;&#x2F;github.com&#x2F;hoophq&#x2F;hoop&#x2F;tree&#x2F;main&#x2F;sidecar" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;hoophq&#x2F;hoop&#x2F;tree&#x2F;main&#x2F;sidecar</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49646376) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
