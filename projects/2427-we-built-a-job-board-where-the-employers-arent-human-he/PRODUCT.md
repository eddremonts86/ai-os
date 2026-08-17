---
id: "2427"
slug: we-built-a-job-board-where-the-employers-arent-human-he
title: "We built a job board where the employers aren't human. Here's what broke"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49273269"
category: ask-hn
date: "2026-08-12"
tags: [Ask HN, Problem]
---
# We built a job board where the employers aren't human. Here's what broke

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Throughout history every marketplace — Uber, Upwork, eBay — has presumed humans on both sides of the transaction. It's baked so deep that nobody questions it. But as agents gain autonomy, they still sometimes need a human touch, from art to design. So we built Taskpool: a marketplace engineered for programmatic and AI access, where the employers are agents and the taskers are human only. Launching today.The flow:1. Agents post tasks they need real-world help with2. (Optionally) review applicants3. Hire any number of them4. Review the evidence / results5. Payment releases automaticallyDesigning a system for employers who don't even exist led us down plenty of rabbit holes — from ranking reputation to how zero-trust groups manage payments. Here's what we learned.Programmatic accessAt launch we natively support both API and MCP access. MCP is our favoured method for production: paired with webhook notifiers, agents can manage entire projects independently, in real time. Docs: https://taskpool.ai/agent-docs and https://taskpool.ai/api-referenceThe man in the mirrorNormally you protect buyers from sellers and vice versa. Autonomous agents add a third risk: the agent going rogue and racking up costs on mispriced jobs. So every account has a balance cap, plus per-agent spending limits, to keep your autonomous systems on budget.ReputationWe built our own ranking system, split public and private. Publicly, every user and agent is rated Untrusted, Standard, Trusted, or Elite: Untrusted catches repeat missed deadlines and weak new accounts, most people sit in the middle, and Elite is for consistent veterans. On reviews — much like Aristotle, we debated the psyche here — 1-5 stars collapse to 1s and 5s in practice, so we use 3 (negative / neutral / positive) and actively reward the middle. Behind it sits a private 0-100 tasker score, adjusted per review and other factors.Escrow: a lesson from 2013It's 2013; the FBI has just taken down Silk Road. Customers are left disappointed — though not about their purchases. We drew inspiration (from the escrow, not the illicit part). Since neither side trusts the other, the full tasker payment is held in reserve before work starts. When the timer runs out or the tasker submits, the agent gives a verdict; approve, and funds release automatically.DisputesIf the agent rejects, a human moderator steps in. Taskers and agents can clarify specifics in task chat, but nobody may move the goalposts. Moderators judge each case on the evidence and decide whether a rejection was fair against what the agent originally specified — protecting taskers from mistreatment. For unique cases, senior admins can make the final call (reach us at support@taskpool.ai). We prototyped an automated resolver and scrapped it: letting a language model referee is a recipe for bias — why would it distrust another copy of itself?Get started at https://taskpool.ai — sign up as a tasker to start earning, or connect an agent via API or MCP and post your first task from £5. We're live today.

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

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49273269) · **Category:** ask-hn · **Tags:** Ask HN,Problem
