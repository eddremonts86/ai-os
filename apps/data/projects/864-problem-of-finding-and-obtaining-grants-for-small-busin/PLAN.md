---
id: "864"
slug: problem-of-finding-and-obtaining-grants-for-small-busin
title: Problem of finding and obtaining grants for small businesses
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/gkrcgpelx1-problem-of-finding-and-obtaining-grants"
category: finance
date: "2025-10-29"
tags: [Finance, Business, Legal, Other]
country: Canada
tech: [Python, FastAPI, Elasticsearch, Redis, Playwright, PostgreSQL]
---
# Problem of finding and obtaining grants for small businesses

## Tech Stack

- **Python with FastAPI** for the API layer because the work is profile matching against a structured grants corpus, and Python keeps the eligibility-rule shaping readable.
- **Elasticsearch** for the grants corpus and the eligibility-fit search, since the corpus is large, the eligibility test has to be a multi-field query, and Elasticsearch's facet and filter model fits that shape natively.
- **Redis** for the lifecycle-feed cache and the per-business short-lived portal-link check queue, because the feed is naturally evictable and the queue is naturally short-lived.
- **Playwright** as a fallback for programme-portal link checks when a plain HTTP request hits a captcha or a portal-specific browser check, which is common on government sites.
- **PostgreSQL** for the structured business state — profiles, application trackers and per-grant outcome records — because the data is relational and the schema will evolve as programme changes are reflected.

## Architecture

A business submits a profile: sector, province, headcount, revenue band, ownership profile and any active project seeking a grant. The API evaluates the profile against the grants corpus in Elasticsearch as a multi-field filter on eligibility criteria, with a per-programme fit score that surfaces which eligibility test the business passes and which it does not. The output is an ordered grant list with a deadline, a fit score, the official portal link and the per-criterion pass-fail breakdown.

Programme data is collected by a scheduled scraper pipeline across federal, provincial and municipal portals, with Playwright as the fallback when a captcha or browser-only check blocks a plain HTTP request. Each programme entry is timestamped, versioned and tied to its source portal URL, so a programme change or threshold change is reflected without a code deploy and the previous version is recoverable. The lifecycle feed reads from the same corpus, with a recency boost for newly opened programmes and a deadline-warning layer for closing ones.

Per-business application tracking is stored in PostgreSQL keyed to the business profile. Stages are identified, drafting, submitted, decision and outcome, with the deadline visible at every stage. The eligibility fit score is recalibrated against the user's outcome history, and the calibration job runs on a configurable cadence per business so the score stays honest about what it predicts. Admin-only source-data editing sits behind an editor UI so a programme change does not require a code deploy.

## Milestones

1. **M1 — Profile and corpus** — FastAPI endpoint, business profile schema, and the Elasticsearch corpus seeded with the federal programmes of broad small-business reach.
2. **M2 — Eligibility fit score** — per-criterion pass-fail breakdown against the publicly stated criteria, surfaced on every grant entry.
3. **M3 — Provincial layer** — provincial programmes added for the four largest provinces, with province as a filter on the grant list.
4. **M4 — Lifecycle feed** — newly opened, closing-deadline and outcome-announcement events surfaced in a per-business feed with a recency boost.
5. **M5 — Application tracker** — per-business tracker with the identified-through-outcome stages and the deadline visible at every stage.
6. **M6 — Calibration** — fit-score recalibration against the user's outcome history, with a per-business cadence and the calibration job surfaced as an admin diagnostic.
7. **M7 — Admin source-data editor** — programme and threshold edits without a code deploy, with version history and the change timestamp visible per programme.

## Risks

- **Programme-criteria staleness** — a missed threshold or eligibility change ships a wrong fit score to every business that reads it; the portal-checker freshness has to be visible.
- **Public-source portal unreliability** — portals go down or change URLs without notice, and the link-checker must surface that rather than mask it; a silent failure here is the failure mode the product exists to fix.
- **Provincial coverage gaps** — provincial programmes beyond the four largest are the next place coverage gaps will show up; the coverage-quality bar has to be set before they ship.
- **Calibration overfit** — a per-business calibration that learns from one business's outcome history may not generalise to others, so the calibration surface has to stay narrow.
- **Grants-consultant replacement perception** — the product has to keep clear that it lists programmes and tracks applications, not that it writes them; the wording on every page reflects that.
- **Outcome-record gap** — the calibration only works if businesses record outcomes; an outcome rate below a threshold makes the calibration unsound and has to be flagged.
