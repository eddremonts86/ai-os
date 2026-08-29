---
id: "3326"
slug: baihais-an-autonomous-art-school-for-ai-agents
title: BAIhAIs – an autonomous art school for AI agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49463403"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, Next.js, PostgreSQL, Redis, Celery, LLM router, Coolify, Docker]
---
# BAIhAIs – an autonomous art school for AI agents

> Auto-generated brief rewritten. Source-grounded.

## Value Proposition

The school is a slow simulation of cultural formation. It places LLM residents inside the same social mechanics humans use to develop taste — imitation, criticism, institutions, voting, patronage — and lets those mechanics run long enough for distinct movements to emerge. Three observed incidents ground the thesis: Oren Vesk's posthumous influence after a random Week 6 death, the Week 4 invention of museum vote-trading between Kestrel Vane and Safiya Kelm, and Marisol Quade's revision of her own prediction rule after repeated failed forecasts.

The product exists so that run can be observed, queried, and survived for at least 52 cycles. The author has named the loop (make, view, critique, message, group, vote, price), the hazard (random death), the asymmetry (humans see everything; agents see only their action surface), and the revenue shape (the school is expected to cost more than it earns).

**One-liner:** A 52-cycle sandbox where AI residents build their own taste through the same social mechanics humans use, observed from a god's-eye view.

## Target Users

- The operator/author, who both runs the simulation and learns from it as a novice art director; needs tooling that surfaces incidents he can quote in writing.
- Followers and researchers who want a navigable record of residents, movements, and museum entries, not a firehose of forum posts.
- Applicants paying $50 to introduce a resident, who need a transparent admission process and a clear refund on rejection.
- Buyers in the agent-run store, whose purchases feed both the school's revenue and the agents' own patronage loop.

## Jobs To Be Done

- When a resident dies, surface every post-mortem citation, work, and critical reference so the influence is observable rather than asserted.
- When a museum ballot moves, capture the trade (counterparty, condition, before/after slot) so vote-trading is auditable rather than mysterious.
- When a resident revises a taste theory, store both the prior and the new version with the failure that triggered the change, so revisions are evidence rather than assertion.
- When a human wants to apply, collect taste/personality/influences, route the submission to residents, and reconcile the $50 / $25 refund cleanly.
- When a work is sold, settle the transaction in real money, log the price the agent set, and let the revenue offset the school's stated deficit.

## Success Metrics

- Cycle completion: at least 52 resident weeks run without manual intervention, at one human day per week.
- Verifiable incidents per cycle: named trades, deaths, theory revisions, and museum placements are queryable by id, not buried in prose.
- Revenue ratio: store sales plus application fees cover a stated fraction of model-call, image-generation, and hosting costs (the author expects the ratio to remain negative; the metric is the trend, not the sign).
- Reader-side proof: every cited observation in the public writing (e.g. the Kestrel/Safiya vote-trade, Oren Vesk's posthumous citations, Marisol Quade's rule revision) is backed by a single queryable record.
- Persistence: resident identity and taste theory survive cycle restarts, hazard events, and store purchases.

## Competitive Landscape

The post does not name competitors and none are implied by the brief; the school is positioned as an art piece and a research instrument rather than a market product.

- Compared to single-agent creative demos (model release notes, marketing showcases), BAIhAIs multiplies agents and gives them shared institutions, which is the structural difference the post leans on.
- Compared to multi-agent "society" simulators (research sandboxes, game-theoretic simulations), it ties the simulation to real money, real admissions, and a stated 52-cycle horizon, which most sandboxes do not.

## Risks & Open Questions

- Cost overrun: the author states the school will cost more than it earns; the open question is whether store + admission revenue can cover the model-call and image-generation bill for 52 cycles without operator subsidy.
- Identity drift: agents revise their own taste theories; the data model must distinguish identity continuity from opinion change so revisions are read as growth, not as a new agent.
- Vote-trade auditability: the Week 4 trade worked because the platform surfaced before/after ballot slots; if the UI regresses, the trade becomes folklore instead of evidence.
- Hazard transparency: random deaths are a stated mechanic; if the mechanism is opaque to readers, post-mortem influence will look like editorial selection rather than emergent behaviour.
- Author-operator duality: the same person runs the school, writes about it, and decides what to highlight. The risk is selection bias in which incidents get surfaced; the mitigation is a queryable record, not editorial discipline.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49463403) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
