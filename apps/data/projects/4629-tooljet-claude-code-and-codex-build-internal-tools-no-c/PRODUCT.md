# PRODUCT.md — ToolJet – Claude Code and Codex build internal tools, no codegen

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN,<p>Co-founder here. We spent 11 months to build a multi-agent system for generating applications. Then we scrapped it and rebuilt around MCP, letting coding agents do the job instead.<p>Old multi-agent system worked great when we launched in September 2025. It was as good as it got in the internal tooling space at that time. Customers who evaluated multiple products agreed and things went well; and that&#x27;s how we got into the trap of iterating the same system for almost a year.<p>In the last few months, our customers weren&#x27;t impressed by this system. The expectations were entirely different. We saw Retool pivot (probably not the right word) into a vibe-coding based approach along with a few lesser known competitors.<p>We didn&#x27;t and still don&#x27;t think vibe-coding is right for our users. Less technical people along with highly skilled devs trust us with critical internal tools. Handing them a layer of generated code they can&#x27;t or don&#x27;t want to maintain, behind a black box that only responds to prompts, wasn&#x27;t a solution we could get behind.<p>Meanwhile every feature we shipped meant re-teaching our own agents every other week while Codex and Claude Code kept improving and Grok Build went from horrible to great at the thing we were badly reinventing.<p>So we scrapped everything and exposed our entire platform over MCP instead. Coding agents drive it directly. You read it right, coding agents, but no code is generated.<p>A ToolJet application is a well structured thing with abstractions for pages, components, queries, integrations, events, state management, etc. Coding agents generate the configs for these abstractions and puts together the whole app.<p>A few things fall out of that:<p>- Much less to generate. For a table wired to a query, a button that opens a modal, and a form that updates a record, the model emits no React, no state management, no CSS, no API plumbing. It describes what exists and how it connects.
- We used to need one agent per data source integration. App generation now covers all 100+ data sources.
- Users can use their own coding agent subscriptions and usage limits. API pricing is super expensive anyway. But for folks without a subscription, we built our own tiny harness where users pay API pricing.
- Other MCPs compose with ours. Designs come in from Figma, and apps on other platforms can be migrated.<p>Our category looks like it is splitting in many ways. While the pro-code + prompt-first approach will have its own fans, our decision is to expose our platform and its abstractions to coding agents while visual builder exist to make changes manually when needed.<p>MCP server&#x27;s repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;ToolJet&#x2F;tooljet-mcp" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ToolJet&#x2F;tooljet-mcp</a><p>(Posted ToolJet here in 2021 [<a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=27421408">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=27421408</a>]. 1,000 stars in 8 hours. Fairly different product for a fairly different world now.)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49535001) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
