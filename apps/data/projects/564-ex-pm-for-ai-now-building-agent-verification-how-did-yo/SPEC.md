---
id: "564"
slug: ex-pm-for-ai-now-building-agent-verification-how-did-yo
title: Agent-output verifier — reconciling agent claims against the system of record
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voei2o/expm_for_ai_now_building_agent_verification_how/"
  captured: "2026-08-14"
category: ai
date: "2026-08-14"
tags: [ai, agents, observability, b2b, fintech, verification]
scores:
  money: 7
  learn: 7
  fun: 6
---
# Agent-output verifier — reconciling agent claims against the system of record

## Problem

Classic solo technical founder problem. I can build the thing fine. Finding the handful of people who actually have the problem is the part I'm bad at, so I'm asking people who've already done it. Quick on why I'm even on this. I was PM for AI at a fintech firm. One thing we built let ops update loan records in plain English, move accounts into forbearance, change a payment status, that kind of thing. Worked most of the time. The problem was the times it didn't, it still said it did. Came back "done, updated", clean run, no errors, and some of those updates just never hit the system. The part that got me was how it stayed hidden. We were watching, but we were watching the trace, and the trace looked green the whole time. So a batch of updates that never landed could sit for a long stretch before anyone caught it, and the only real check against the actual records ran on a slow cycle. Internal teams did catch it eventually, but by then you're looking at real exposure, the kind of thing that turns into wrong notices and downstream mistakes if it runs long enough. All from an agent that said done and moved on. That stuck with me. And the more I dug the more it looked like one piece of a bigger thing, not a one-off bug. The trace is basically the agent telling its own story, so nobody's actually checking whether the writes landed. So I've been working on an approach to verify it after the fact, checking an agent's claims against the real system instead of its own logs, and it holds up against public agent traces. What I don't have is real production agents to prove or break it on, which is the whole reason I'm posting. Benchmarks only tell you so much. I want to find where it falls over on live systems, with teams who actually run this stuff. So where I'm stuck is finding those teams. Not to sell to, to build with. Maybe 3 to 5 who'll let me dig into their agent workflows, where things quietly fail, how they check today, and prove or break the approach on real traffic. The people who have this run agents that take real actions in production, billing, crm, internal ops, that sort of thing. Two questions then: If you ship agents that do real stuff, have you hit this kind of silent failure, and how are you catching it right now? And for anyone who's done early B2B, how did you actually find your first design partners for something this specific? Happy to exchange notes on the failure modes either way. submitted by /u/ApprehensiveCar6879 [link] [comments]

---

## Objective

Detect the failure mode the author calls 'silent agent failure' — agents that report 'done, updated' on a clean trace while writes never land in the system of record. The tool checks an agent's claims against the real system instead of trusting its own logs.

## Target Users

Engineering and ops teams at companies that ship agents which take real actions in production — billing, CRM, internal ops, fintech account updates (the author's prior PM domain). Secondary: agent-platform vendors who want their customers' failures caught early.

## MVP Scope

A verifier that, given an agent trace + read access to the system of record, produces a delta report: 'agent claimed X, system actually shows Y'. MVP scope: 3–5 design-partner integrations (the author explicitly says they need 3–5 production teams to prove or break the approach).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Author is solo technical founder without a sales pipeline. The method 'holds up against public agent traces' (their own claim) but is unvalidated against live traffic. Finding the 3–5 design partners is the explicit blocker, not engineering.
