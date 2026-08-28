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

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-of` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/333-ai-agent-for-automatic-seo-promotion-of-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python (FastAPI), WordPress REST API, Tilda Webhook + External API, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Serbia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Serbia.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
- [ ] Set up the LLM provider abstraction (rate-limit, fallback model, prompt cache) and the eval harness for the {country}-relevant test cases.
## Phase 1: Core

- [ ] Site connect flows: WordPress (REST + app-password), Tilda (API key + project ID)
- [ ] Routine library: content draft, metadata refresh, internal-link audit, sitemap regen, Search Console triage, broken-link check
- [ ] Approval queue: every state-changing routine generates a diff (post body / metadata / link change), queued for operator click
- [ ] Per-site keyword set (max 25) with weekly SERP snapshot, Graph trend
- [ ] Weekly digest email + Telegram message with approved changes + ranking movement
- [ ] Audit log per site: which routine ran, which change was approved, by which operator
- [ ] End-to-end test on 5 sites (mix of WordPress and Tilda) over 4 weeks

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI), WordPress REST API, Tilda Webhook + External API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 333-ai-agent-for-automatic-seo-promotio MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Serbia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI), WordPress REST API, Tilda Webhook + External API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
