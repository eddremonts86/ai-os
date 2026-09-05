---
id: "4585"
slug: aura-a-rust-agent-that-investigates-and-fixes-productio
title: Aura – a Rust agent that investigates and fixes production incidents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49538195"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Aura – a Rust agent that investigates and fixes production incidents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ We run a SaaS that handles petabytes of data. Our SRE team experimented with using claude, openclaw, langchain, etc. within our incident response workflows. We struggled with overflowing context, lethal trifecta vectors, hallucinations, and burned a lot of frontier tokens mostly on easy work. Approval fatigue was a challenge, and we drew a hard line at relaxing permissions in production.Long story short, we built and open-sourced AURA, a Rust-based harness specifically designed for the type of operations work which routinely involves large volumes of telemetry data and coordinated investigations across many domains of knowledge / state. We have found even on open-weights models, root cause accuracy has been very good, and remediation actions are guarded with human-in-the-loop.AURA runs from a centralized configuration file where workers are defined and scoped to task domains, (e.g. logging review, metrics analysis, and git/scm related queries). All permissions, tools access, LLM backend(s), worker prompts, and the main coordinator prompt are also defined in code. Permitted tool use is enforced deterministically outside the agent's context, so the agent cannot grant itself capabilities through prompting. AURA also handles the rest of the execution layer, such as human approval for sensitive actions and fault tolerance. A lot of thought went into context window management: large tool outputs and worker responses are persisted to disk and agents are given tools to slice/read as needed.The project is Apache 2.0. You can install rpm/deb/brew natively or pull the source and build your own. It runs either as an assistant on your workstation, or as a daemon that you can connect to via any OpenAI-compatible frontend. The GitHub repo is here: https://github.com/mezmo/aura/The whole thing is free/Free. No signups or open core trapdoor.Demo: We put together an 8-minute video showing a checkout outage resolved by following evidence from several different systems: https://www.youtube.com/watch?v=TERHoRzT8cEtl;dw: 502s from a checkout service cause Grafana to trigger an incident via PagerDuty. AURA (using DeepSeek-V4-Flash) uses its workers and tools to correctly determine root cause as a memory leak in a downstream service, and attributes the incident to a defect in a recently merged PR. The demo then concludes with a human-gated tool call to GitHub, where AURA documents the exact lines of code that are causing the problem, and recommends a fix. Once the PR is deployed, AURA validates that the errors are clearing and transactions are no longer failing. The whole time, AURA’s leaving an audit trail of OTEL events into Phoenix.Technical details:AURA uses an agent coordinator that drafts, executes, and supervises DAG flows through user-defined worker agents to solve complex investigations in parallel. Worker agents are bound to strongly typed durable artifacts used as evidence packets, and the system discourages wasteful recalculation of remote data. AURA also has a powerful header routing system that doesn’t allow the agent to actually touch your keys. HITL interrupts over webhook are first class citizens and have a schema that is easy to adapt to your own workflow. HA deployment options are coming soon.What’s still rocky:- We’re currently working on the async input system for when you’re running AURA as a service. Right now the API just accepts a request, and streams messages until the main loop completes. It’s easy to integrate into a workflow, but the logic required winds up being heavier than it ought to be.- Because there’s no inbound webhook interrupt mechanism, automating AURA for IR requires middleware to invoke it or it needs to poll an MCP for alert escalations.We’re looking for users, contributors, guidance on where to take this next, or just GitHub stars. Looking forward to reading and responding to feedback here.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49538195) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
