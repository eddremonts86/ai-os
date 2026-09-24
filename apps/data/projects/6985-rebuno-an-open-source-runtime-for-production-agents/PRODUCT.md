# PRODUCT.md — Rebuno - An open-source runtime for production agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have been building Rebuno, an open-source execution runtime for operating AI agents in production. It manages execution state and guardrails across agents built with different frameworks.<p>Agents run as HTTP services. Rebuno dispatches work through signed webhooks and keeps execution state in Postgres. Agents submit tool and model calls to Rebuno as steps before executing them.<p>For each new step, Rebuno evaluates per-agent YAML policies, independently of the model&#x27;s prompt. It can allow the call, deny it, or hold it for human approval. The agent executes permitted calls and reports their outcomes. Policy decisions and step outcomes are both recorded in one append-only event log.<p>After an interruption, the agent starts its handler from the top. Steps with recorded outcomes return those outcomes instead of executing again. A crash can also leave a tool with no recorded outcome. Tools marked safe_to_retry run again, and tools marked at_most_once fail as indeterminate. How the agent handles an indeterminate step is up to its implementation.<p>There are Python and TypeScript SDKs, and the repo includes examples using LangChain, CrewAI, Pydantic AI, Vercel AI SDK, and Mastra.<p>Rebuno is free to self-host and released under the MIT licensed.<p>I&#x27;d be interested in hearing how others are running or operating agents in production.<p>Blog post with diagrams: <a href="https:&#x2F;&#x2F;rebuno.io&#x2F;blog&#x2F;introducing-rebuno" rel="nofollow">https:&#x2F;&#x2F;rebuno.io&#x2F;blog&#x2F;introducing-rebuno</a><p>Getting started: <a href="https:&#x2F;&#x2F;docs.rebuno.io&#x2F;getting-started" rel="nofollow">https:&#x2F;&#x2F;docs.rebuno.io&#x2F;getting-started</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49699591) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
