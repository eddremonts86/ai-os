# PRODUCT.md — A Proxy between LLMs and MCP servers with policy the model cannot reach

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi, this is Banu. I am a cofounder at sentelabs.ai.<p>We are developing extensible-mcp as an open-source proxy that sits between LLMs and MCP servers. The idea behind extensible-mcp is that the model shouldn&#x27;t have to load every available tool, and policy enforcement shouldn&#x27;t live in anything the model can access.<p>As the agent can be influenced by any input it reads, a prompt cannot be fully trusted, and this layer restricts the agent&#x27;s capabilities to only what is allowed by a deterministic policy. Also, every loaded tool is both added context and additional attack surface; extensible-mcp lets the model discover capabilities on demand, reducing context overhead and limiting what the model can access at any given time.<p>It&#x27;s available now as a self-hosted, Apache-2.0 open-source project. 
It runs as a stdio MCP server itself, so any MCP client can connect to it like any other server. 
104 tests are currently passing, and the example configurations work against the official GitHub MCP server.<p>In future updates, we plan to make human approvals cryptographically verifiable, which proves a real person approved this exact action. And, the policies will be written in Lean, a proof assistant, and translated to Rego for execution, so you can mathematically prove the rules behave as claimed.<p>My co-founder Matthew Fuchs came up with the idea, designed the architecture, and built it. I support the product, design, human-trust and authority side.<p>I wanted to post this here as we need your honest feedback and opinions. I am very curious about what the HN community thinks about it.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49520552) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
