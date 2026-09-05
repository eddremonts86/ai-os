---
id: "3890"
slug: get-your-free-ai-search-visibility-scan
title: Get your free AI search visibility scan
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497538"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [AI answer-engine querying, LLM API, Playwright, domain crawler, report rendering, static site]
---
# Get your free AI search visibility scan

## Tech Stack

- **Playwright:** drives real conversations with AI answer engines.
- **LLM API:** judges whether a submitted domain is actually cited in each answer.
- **Domain crawler:** pulls the submitted site and derives probe queries from its content.
- **Report rendering:** produces static, shareable result pages.
- **Job queue:** scans take minutes, not milliseconds, so work runs async.
- **Static site:** hosts the public submit-and-view flow.

## Architecture

- A public page accepts a domain and enqueues a scan job.
- A crawler fetches the site and generates a query set from its content.
- Probe workers run the queries against each configured AI answer engine through Playwright sessions.
- A judge step classifies each answer as citing, not citing or ambiguous for the domain.
- The report renderer assembles per-engine verdicts and the summary score into a shareable page.

## Milestones

1. **M0 — Scaffold:** repo, queue, static public page and the capture-honesty review of what the title commits us to.
2. **M1 — Single-engine probe:** one AI answer engine, generated queries, cited/not-cited judging, first report shape.
3. **M2 — Multi-engine coverage:** several engines, summary score, per-engine breakdown, re-run of the same domain.
4. **M3 — Shareable reports:** link sharing, friendly failure messaging when engines block, basic cost instrumentation.

## Risks

- Engine access: rate limits or terms-of-service friction could cap coverage.
- Scoring subjectivity: cited judgments need clear rules or the report loses trust.
- Cost discipline: a free product with per-scan API costs needs hard per-scan budgets.
- Thin market evidence: demand is inferred from the title, not from any captured usage data.
