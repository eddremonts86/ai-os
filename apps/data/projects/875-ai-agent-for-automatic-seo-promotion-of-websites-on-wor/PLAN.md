---
id: "875"
slug: ai-agent-for-automatic-seo-promotion-of-websites-on-wor
title: AI agent for automatic SEO promotion of websites on Wordpress and Tilda
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-of"
  captured: "2025-10-28"
category: seo
date: "2025-10-28"
tags: [SEO, Marketing, AI, Other]
country: Serbia
wtp:
  raw: $6–18/month per client
  currency: USD
  min: 6
  max: 18
  period: month
  mrrMid: 12
tech: [Next.js (agency dashboard), Node.js worker (article generation + publishing), Postgres, WordPress REST API + Tilda API connectors]
---
# AI agent for automatic SEO promotion of websites on Wordpress and Tilda

## Tech Stack

- **Frontend:** Next.js (React + TypeScript) agency dashboard deployed on Vercel; per-client workspace with target keywords, publishing schedule, tone-of-voice notes, and an article review queue.
- **Backend API:** Node.js (Fastify) + Postgres, exposing the workspace, keyword, schedule, and review endpoints. Single Coolify instance.
- **Article-generation worker:** Node.js cron (per scheduled article), takes a target keyword, fetches the client's site context (WordPress REST or Tilda API), drafts a 600–1200 word article via the LLM, runs a duplicate-content check, and submits the draft for approval.
- **Connectors:** WordPress (Application Passwords + REST API), Tilda (Tilda API). Each connector implements a `publishDraft(siteId, article)` verb. Wix connector is out of scope for v1.
- **Search Console integration (optional):** read-only OAuth, used only when the client grants access; when absent, the reporting surface degrades to publishing cadence.
- **Billing:** Stripe Checkout on the per-site tier prices; webhook updates site subscription status.

## Architecture

The agency dashboard and the worker share a Postgres database; the worker runs on cron and writes drafts into a review queue. The agency approves each draft in the dashboard, and only then does the worker call the connector to publish. Search Console integration is a separate OAuth-driven read that the dashboard consumes for ranking reports. Cost is contained by the per-article cap and the choice of model tier.

```
Agency user (browser)
       │
       ▼
Next.js dashboard ──▶ Fastify (workspaces, keywords, schedules, drafts)
       │                       │
       │                       ▼
       │                Postgres (sites, articles, reviews)
       │                       ▲
       │                       │
       │        cron (per article)│
       │        ┌────────────────┘
       │        ▼
       │   Worker: fetch site context ──▶ LLM draft ──▶ duplicate check
       │                                                       │
       ▼                                                       ▼
Approval queue ◀──── agency clicks "approve" ───── Worker publishes via
                                                       │
                                              WordPress / Tilda connector
                                                       │
                                                       ▼
                                              (optional) Search Console
                                              ranking report
```

## Milestones

1. **M0 — Spec freeze + connector shape.** SPEC.md approved; `publishDraft` interface locked for WordPress and Tilda. End of week 1.
2. **M1 — Agency dashboard shell.** Next.js workspace, per-client page, manual keyword + schedule entry. End of week 3.
3. **M2 — Article-generation worker.** Per-article cron, site context fetch, draft, duplicate-content check, review-queue submission. End of week 5.
4. **M3 — WordPress connector.** Application Passwords + REST API; live end-to-end test on a real WordPress site. End of week 6.
5. **M4 — Tilda connector.** Tilda API; live end-to-end test on a real Tilda site. End of week 7.
6. **M5 — Approval flow + publishing.** Agency clicks approve; worker publishes; audit log per article. End of week 8.
7. **M6 — Search Console integration (optional).** Read-only OAuth, ranking report; graceful degradation when absent. End of week 9.
8. **M7 — Pilot.** 30 paying sites across 3 agencies; weekly review of approval rate, publishing cadence, and per-site cost. End of week 13.

## Risks

- **Per-article cost ceiling.** At $6–18/site/month, with 1–8 articles/month per tier, each article must cost under a few dollars to generate. If the LLM tier is too cheap, drafts read as AI slop and the approval rate collapses; if it is too expensive, unit economics break. The worker must be benchmarked on cost vs. approval rate before launch, and the model choice must be re-evaluated quarterly.
- **Duplicate-content and AI-detection.** Google has signalled it devalues low-quality AI content, and clients can tell. The duplicate-content check must be real (not a stub), and tone-of-voice notes must be a load-bearing field, not a free-text box nobody fills in. Without both, the articles get published, do not rank, and the client churns at month 3.
- **Connector fragility.** WordPress Application Passwords, the WP REST API, and the Tilda API all change. Each connector needs an end-to-end test against a live site per release, not just a unit test. A broken connector that silently fails to publish is the worst possible failure mode (client pays, no content goes out, agency finds out at the next billing cycle).
- **Outcome proof without Search Console.** Many SMB clients do not grant Search Console access. The reporting surface must honestly say "publishing cadence is what we can verify", or the agency will over-promise results and the client will churn with a refund request.
- **Wix platform gap.** The poster names WordPress, Tilda, and Wix; the MVP ships WordPress and Tilda only. The dashboard must say "Wix coming soon" loudly so an agency does not connect a Wix site by mistake and silently get nothing published.
