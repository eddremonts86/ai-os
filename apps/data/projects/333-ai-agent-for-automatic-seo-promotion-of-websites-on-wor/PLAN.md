---
id: "333"
slug: ai-agent-for-automatic-seo-promotion-of-websites-on-wor
title: AI agent for automatic SEO promotion of websites on Wordpress and Tilda
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-of"
category: seo
date: "2025-10-29"
tags: [SEO, Marketing, AI, Other]
country: Serbia
tech: [Python (FastAPI), WordPress REST API, Tilda Webhook + External API, OpenAI API, Postgres]
---
# AI agent for automatic SEO promotion of websites on Wordpress and Tilda

## Tech Stack

- Python (FastAPI)
- WordPress REST API
- Tilda Webhook + External API
- OpenAI API
- Postgres

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for seo runs as a single backend service on the stack (Python (FastAPI), WordPress REST API, Tilda Webhook + External API) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-o` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Serbia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Python (FastAPI), WordPress REST API, Tilda Webhook + External API) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Serbia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-o`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`333-ai-agent-for-automatic-seo-promotio`), pin dependencies for Python (FastAPI), WordPress REST API, Tilda Webhook + External API, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-o` with no feature creep. A single user from Serbia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Serbia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Serbia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Tilda API limits.** Tilda's external API is narrower than WordPress; some routines will be Tilda-light. Surface that in the UI rather than silently dropping.
- **SERP-API quality at Balkan scale.** Local SERPs include Map pack and a different ad layout; choose a provider with adequate country coverage.
- **Hallucinated facts in content drafts.** Always require a fact-check note in the approval queue, never publish blind.
