---
id: "684"
slug: traffic-isnt-converting-tried-seo-geo-spent-37-on-reddi
title: "traffic isn’t converting, tried SEO / GEO spent $37 on reddit ads - pls roast and advise"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vprg69/traffic_isnt_converting_tried_seo_geo_spent_37_on/"
category: saas
date: "2026-08-16"
tags: [saas, fintech, growth, conversion]
tech: [Next.js, TypeScript, Playwright, SQLite, Drizzle ORM]
---
# traffic isn't converting, tried SEO / GEO spent $37 on reddit ads - pls roast and advise

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Storage:** SQLite via Drizzle ORM for per-audit workspace.
- **Diagnostic inputs:** URL fetcher + a headless browser (Playwright) for landing-page screenshots.
- **Scoring rubric:** a category-aware rules engine (JSON-defined) with separate rubrics for fintech, health, legal, and generic SaaS.

## Architecture

Three components: a static checklist (the trust and clarity dimensions), a diagnostic runner (Playwright + URL fetcher that produces structured inputs), and the scoring engine (rules engine that produces the report).

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-page audit demo with placeholder scoring. End of week 1.
2. **M1 — Trust-signal audit checklist.** Browser-driven inputs + scored checklist output for the fintech category. End of week 3.
3. **M2 — Audience-clarity + offer-fit diagnostic.** End of week 5.
4. **M3 — Category-specific rubrics for health, legal, generic SaaS.** End of week 7.
5. **M4 — Engagement tier.** Founder-led audit with a written report. End of week 9.

## Risks

- **Rubric is miscalibrated** — a wrong rubric will mislead founders. Mitigation: validate against 10 real funnels per category before monetising the engagement tier.
- **Crossing into compliance advice** — the audit must not give legal advice. Mitigation: explicit disclaimer on every report.
