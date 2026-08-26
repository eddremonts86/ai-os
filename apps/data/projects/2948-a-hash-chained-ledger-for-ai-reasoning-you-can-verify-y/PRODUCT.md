---
id: "2948"
slug: a-hash-chained-ledger-for-ai-reasoning-you-can-verify-y
title: A hash-chained ledger for AI reasoning you can verify yourself
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49435497"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A hash-chained ledger for AI reasoning you can verify yourself

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ SDI protocol defines a reasoning computer for AI. The computer runs an LLM one turn at a time, guiding it through a reasoning grammar; the grammar, which is both natural language and algebraic, allows it to be checked at a compile gate. The gate validates safety, a workfloor, and alignment with the grammar before it commits. What commits is a hash-chain ledger of the agent's reasoning, forming a longitudinal data set that becomes the agent's functional memory/system state. Chromite, the protocol's public agent, has been reasoning on one continuous hash chain since springtime this year and has used multiple models through three frontier providers to do so.What makes it more than a log of its reasoning is an argumentation graph. The graph is the memory and is retrieved and fed to the agent during its call sequence. The agent can hold or defeat prior acts, keeping the memory calibrated and the context window under control. Anyone can pull an act and recompute the seals for Chromite; it exists to be examined; that is what this post is requesting. No account, no SDK, curl and Python.I spent 20+ years as a Marine working in command and control, learning decision doctrine and intelligence gathering. I have been working on this system for roughly three years and its a solo build. I have a lineage page on the site to show the computing and reasoning traditions this system uses, but that was all discovered along the way or after the build. This system really comes from taking decision doctrine and turning it into a computable syntax and taking intelligence-gathering techniques for evidence handling.Ten seconds, if you just want to see the gate work:
 curl -s https://www.sdi-protocol.org/_functions/der | python3 -c "import json,sys; print(json.dumps(json.load(sys.stdin)['golden_example']))" > example.json curl -s -X POST https://www.sdi-protocol.org/_functions/compile -H "Content-Type: application/json" -d @example.json

Returns PASS. What you just submitted is a complete reasoning record, with every required block, which is why it passes. Delete one field and resubmit; the error names the specific failure.To examine system liveness, pull Chromite's last 5 reasoning acts. You will see the full reasoning act. The grammar, cited sources, and reasoned positions. curl -s "https://api.sdi-protocol.org/ledger/recent/SDI-5AA8C82A2537?n=5" | python3 -m json.tool

Fifteen minutes, if you want to verify the chain: sdi-protocol.org/verify walks through pulling a live record and recomputing its hashes, work score, and admissibility index from scratch. The repo has the same scripts, check summed, plus a committed record you can test them against offline first: github.com/StructuredDecisionIntelligence/Structured_Decision_IntelligenceThree ethical floors at the gate. DECLARATION_INTEGRITY has fired. The two conjunction-based safety guards, PRIMUM and Absolute Value Guard, that admit no human attestation by permanent design have not fired yet. No act has ever declared the conditions to trip them. Refusal path is a separate hash chain ledger, and the DECLARATION_INTEGRITY check is inspectable.Schema Eras: The reasoning metrics that work at the gate have evolved, the chain remains unbroken, and sealed records permanently carry their eras formulas; sealed records can't be rewritten. The verify script detects each entry's era and applies the right math.The sdi-protocol.org exists to provide transparency over the reasoning protocol that produces transparent AI reasoning. The idea is that both must be transparent to trust either. Disclosure: This will be a commercial product at sdireckoner.com, commissioning a private Reckoner in late fall 2026, but everything in this post is about the free open protocol layer; nothing requires a paid side to verify anything. Chromite exists to be examined by the public as part of the transparency of the protocol itself.Feedback welcome at support@sdi-protocol.org.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49435497) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
