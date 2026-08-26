---
id: "2937"
slug: gibson-adk-and-zero-trust-runtime
title: Gibson ADK and Zero Trust Runtime
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49435908"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Gibson ADK and Zero Trust Runtime

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have spent 15 years in DevSecOps, platform engineering and offensive security. Over the last year I did most of the things HN says not to do. I wrote a lot of code alone in a vacuum and built this thing far past an MVP.It started as a way to automate my bug bounty hobby and to try to find an edge so I could get more findings (scale, automation etc). I wanted agents that could run recon, triage what they found, keep a record etc etc.Then I noticed the same patterns at every client I had worked with, (mainly banks and gov teams) and pivoted.
What it is now: an all-in-one solution to getting your agents into prod.You keep your framework, or build from scratch with gibson. A named person grants each agent read, write or execute on specific things, and the grant cannot exceed what that person holds. Every model call and tool call goes through the runtime first, and a call outside the grant never executes. Untrusted work runs in its own Firecracker microVM. Every action lands in an append-only record you can replay to any moment. Everything an agent finds goes into a knowledge graph (on going memory for all agents), so the next run starts from it. It runs in Kubernetes, hosted or in your own cluster, can be air-gapped.This could also have been an Ask HN. I am trying to figure out how to go to market. Im not sure if I should open source it, do a true platform or move back entirely and go deep into what I truly like doing which is red team/hacking and re-release it as an offsec focused tool and try to innovate there with the framework. Any advice/suggestions would be awesome. Thanks!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49435908) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
