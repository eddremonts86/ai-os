---
id: "680"
slug: i-hit-16k-views-in-a-post-for-my-saas-no-conversion-at-
title: "I hit 16K views in a post for my SaaS, no conversion at all"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpsro3/i_hit_16k_views_in_a_post_for_my_saas_no/"
category: saas
date: "2026-08-16"
tags: [saas, growth, conversion, organic-marketing]
tech: [Next.js, TypeScript, Playwright, SQLite, Drizzle ORM]
---
# I hit 16K views in a post for my SaaS, no conversion at all

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS; static-export for the audit checklist, dynamic for the scored report.
- **Storage:** SQLite via Drizzle ORM for per-audit workspace.
- **Diagnostic inputs:** URL fetcher + a headless browser (Playwright) for landing-page screenshots and load-time checks.
- **Scoring rubric:** a small rules engine (JSON-defined) that takes the audit inputs and emits a scored, prioritised report.

## Architecture

Three components: a static checklist (the funnel stages and the question prompts), a diagnostic runner (Playwright + URL fetcher that produces structured inputs), and the scoring engine (rules engine that produces the report). No third-party tracking; the audit is a single workspace owned by the founder.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-page audit demo with placeholder scoring. End of week 1.
2. **M1 — Landing-page audit checklist.** Browser-driven inputs + scored checklist output. End of week 3.
3. **M2 — Offer + traffic-source diagnostic.** End of week 5.
4. **M3 — First-run-experience audit.** End of week 7.
5. **M4 — Engagement tier.** Founder-led audit with a written report. End of week 9.

## Risks

- **Founder never ships a fix** — the audit is useless if it sits in a doc. Mitigation: the top-3 fixes are sized to ship in a weekend.
- **Scoring rubric is wrong** — the rubric is the product; it needs validation against real funnels before the engagement tier is monetised.
