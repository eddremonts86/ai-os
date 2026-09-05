# PRODUCT.md — A Context Registry for AI coding agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN. We built an API context registry to help coding agents (like Claude Code) generate production-ready API integration code without blowing through token limits.<p>We build a lot of API integrations. In our experience, most coding agents write basic client calls fine, but consistently stumble on details that make code shippable, like idempotent retries, rate-limiting and Auth token management.<p>We tried all the existing approaches of injecting context into coding sessions:<p>- Markdown dumps delivered via MCP (think Context7 or Mintlify Docs MCP)
- API behaviour described in prose using AGENTS.md and skills.
- OpenAPI specs<p>However, all of them left the same production-readiness gaps.<p>So we came up with our own approach that combines prose with typed SDK reference code into a &quot;Context Plugin&quot;. You install the plugin into your coding agent and it automatically injects language-specific context whenever the agent works on an API.<p>Across our benchmarks, Context Plugins boosted one-shot production readiness by up to 34%, allowing Sonnet to match or beat baseline Opus on the same integration tasks. You can read more about our experiments here <a href="https:&#x2F;&#x2F;www.apimatic.io&#x2F;blog&#x2F;working-api-call-is-not-production-ready-integration" rel="nofollow">https:&#x2F;&#x2F;www.apimatic.io&#x2F;blog&#x2F;working-api-call-is-not-product...</a><p>We have published Context Plugins for 24 APIs for the community to try out, including Slack, Google Maps, and Notion.<p>We&#x27;d love for you to give them a go and share your feedback on our plugins as well as our evaluation methodology.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49552209) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
