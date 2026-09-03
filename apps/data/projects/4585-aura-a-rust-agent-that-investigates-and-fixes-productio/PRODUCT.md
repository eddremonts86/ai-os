# PRODUCT.md — Aura – a Rust agent that investigates and fixes production incidents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ We run a SaaS that handles petabytes of data. Our SRE team experimented with using claude, openclaw, langchain, etc. within our incident response workflows. We struggled with overflowing context, lethal trifecta vectors, hallucinations, and burned a lot of frontier tokens mostly on easy work. Approval fatigue was a challenge, and we drew a hard line at relaxing permissions in production.<p>Long story short, we built and open-sourced AURA, a Rust-based harness specifically designed for the type of operations work which routinely involves large volumes of telemetry data and coordinated investigations across many domains of knowledge &#x2F; state. We have found even on open-weights models, root cause accuracy has been very good, and remediation actions are guarded with human-in-the-loop.<p>AURA runs from a centralized configuration file where workers are defined and scoped to task domains, (e.g. logging review, metrics analysis, and git&#x2F;scm related queries). All permissions, tools access, LLM backend(s), worker prompts, and the main coordinator prompt are also defined in code. Permitted tool use is enforced deterministically outside the agent&#x27;s context, so the agent cannot grant itself capabilities through prompting. AURA also handles the rest of the execution layer, such as human approval for sensitive actions and fault tolerance. A lot of thought went into context window management: large tool outputs and worker responses are persisted to disk and agents are given tools to slice&#x2F;read as needed.<p>The project is Apache 2.0. You can install rpm&#x2F;deb&#x2F;brew natively or pull the source and build your own. It runs either as an assistant on your workstation, or as a daemon that you can connect to via any OpenAI-compatible frontend. The GitHub repo is here: <a href="https:&#x2F;&#x2F;github.com&#x2F;mezmo&#x2F;aura&#x2F;" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;mezmo&#x2F;aura&#x2F;</a><p>The whole thing is free&#x2F;Free. No signups or open core trapdoor.<p>Demo: We put together an 8-minute video showing a checkout outage resolved by following evidence from several different systems: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=TERHoRzT8cE" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=TERHoRzT8cE</a><p>tl;dw: 502s from a checkout service cause Grafana to trigger an incident via PagerDuty. AURA (using DeepSeek-V4-Flash) uses its workers and tools to correctly determine root cause as a memory leak in a downstream service, and attributes the incident to a defect in a recently merged PR. The demo then concludes with a human-gated tool call to GitHub, where AURA documents the exact lines of code that are causing the problem, and recommends a fix. Once the PR is deployed, AURA validates that the errors are clearing and transactions are no longer failing. The whole time, AURA’s leaving an audit trail of OTEL events into Phoenix.<p>Technical details:<p>AURA uses an agent coordinator that drafts, executes, and supervises DAG flows through user-defined worker agents to solve complex investigations in parallel. Worker agents are bound to strongly typed durable artifacts used as evidence packets, and the system discourages wasteful recalculation of remote data. AURA also has a powerful header routing system that doesn’t allow the agent to actually touch your keys. HITL interrupts over webhook are first class citizens and have a schema that is easy to adapt to your own workflow. HA deployment options are coming soon.<p>What’s still rocky:<p>- We’re currently working on the async input system for when you’re running AURA as a service. Right now the API just accepts a request, and streams messages until the main loop completes. It’s easy to integrate into a workflow, but the logic required winds up being heavier than it ought to be.<p>- Because there’s no inbound webhook interrupt mechanism, automating AURA for IR requires middleware to invoke it or it needs to poll an MCP for alert escalations.<p>We’re looking for users, contributors, guidance on where to take this next, or just GitHub stars. Looking forward to reading and responding to feedback here.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49538195) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
