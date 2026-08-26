---
id: "807"
slug: clients-struggle-to-verify-the-competence-and-pricing-h
title: Clients struggle to verify the competence and pricing honesty of freelancers when creating websites — there is no AI tool for real-time proposal analysis.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/8zqy6g4g71-clients-struggle-to-verify-the-compet"
  captured: "2026-01-03"
category: freelance
date: "2026-01-03"
tags: [Freelance, AI, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Clients struggle to verify the competence and pricing honesty of freelancers when creating websites — there is no AI tool for real-time proposal analysis.

## Tech Stack

- **Frontend:** React with TypeScript, single-page app served from Coolify.
- **Backend API:** Node.js (TanStack Start) handling proposal parsing, percentile-band scoring, and public-work-mismatch checks.
- **Database:** SQLite via Drizzle ORM (file-based, fits the Coolify + Docker one-VPS model).
- **Deliverable-type percentile data:** Versioned JSON of hourly-rate bands and scope-vs-hour ratios per deliverable type, sourced from public freelancer surveys (Upwork, Toptal, Glassdoor), edited in a Git repo.
- **Public-work-mismatch fetch:** A polite, rate-limited fetcher that hits the freelancer's claimed URLs and returns the page's claim-vs-claim check; respects robots.txt and ToS.
- **Hosting:** Coolify on a single Hetzner CX22 (or equivalent), Docker Compose for app + reverse proxy.

## Architecture

```
Browser ─▶ TanStack Start (SSR + route handlers)
              │
              ├─▶ SQLite (Drizzle) — comparisons, red-flag history, parsed proposals
              │
              ├─▶ Deliverable-type percentile service — versioned JSON (rate bands, scope ratios)
              │
              └─▶ Public-work-mismatch fetcher — polite, rate-limited, ToS-respecting
```

The comparison view is a SQL join over parsed proposals, ranked by percentile-band position and red-flag count. Public-work-mismatch results are advisory flags, never decisive scores.

## Milestones

1. **M0 — Proposal parsing + percentile data v1.** Parse paste-in + PDF/DOCX upload into normalised structure. 8 deliverable types × rate bands. End of week 2.
2. **M1 — Side-by-side comparison view.** Up to 5 proposals, line items matched on similarity, hours-vs-scope ratio, deliverable specificity score. End of week 5.
3. **M2 — Red-flag callouts.** Hours-per-deliverable 90th-percentile check; deliverables without acceptance criteria; brief-mismatch line items. End of week 8.
4. **M3 — Public-work-mismatch.** Fetch claimed URLs, compare against freelancer's actual public portfolio, flag mismatches. End of week 11.
5. **M4 — PDF export + paid plans.** Free-1 + $29 + $99 Stripe plans wired. End of week 14.

## Risks

- **Percentile-data drift** — public rate surveys change methodology or stop publishing. Mitigation: signed-off PRs, "last reviewed" timestamp on every band, fallback to "no band available" instead of a wrong number.
- **Public-work-mismatch overreach** — fetcher scrapes a portfolio behind a login or hits a site that bans the IP. Mitigation: per-domain rate limit, robots.txt respect, opt-out list that any freelancer can join.
- **Red-flag false positives** — a legitimate deliverable looks padded because the percentile band is wrong for the niche. Mitigation: per-niche band override (the user picks "e-commerce", "SaaS", "media site") before the comparison runs.
- **Freelancer backlash** — a freelancer sees a red-flag pattern they disagree with. Mitigation: every red flag is shown with its underlying signal so the freelancer can dispute it directly to the client.
