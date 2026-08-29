---
id: "3644"
slug: jobglance-rank-every-visa-and-remote-job-from-100-sourc
title: JobGlance – Rank every visa and remote job from 100+ sources by your resume fit live
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/jobglance?utm_campaign=startup-181405&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, Redis, Playwright (scrapers), Chrome Extension (MV3), OpenAI API, BullMQ]
---
# JobGlance – Rank every visa and remote job from 100+ sources by your resume fit live

## Tech Stack

- **Next.js with TypeScript** for the web product, because the surface is a single web app with a server-rendered list, a live filter UI and a per-user session.
- **Python with FastAPI** for the scrape and the match-scoring services, because the work is glue around HTML, queues and an LLM scoring call rather than a request–response web path.
- **PostgreSQL** for the catalogue, the per-user resume store and the application tracker, since the natural shapes are tabular and the tracker needs reliable per-user queries.
- **Redis** as the queue backend and as a hot cache for the latest 24-hour catalogue snapshot, because re-ranking on every filter change must be cheap.
- **BullMQ** as the job queue for the daily 100+ site scrape and the resume tailoring pipeline, since both are background work that needs retries and backoff.
- **Playwright** as the scrape runner, because a 100+ site catalogue cannot rely on static HTML and several sites render job content via JavaScript.
- **Chrome Extension (MV3)** for the overlay that carries the 0 to 100 score onto third-party job pages, because the title's last-mile promise is that the score lives wherever the candidate browses.
- **OpenAI API** for the resume-tailoring and cover-letter generation steps, because both are generative and the product's claim is that the result is tailored per role.

## Architecture

The catalogue is built once a day by a Python scrape pipeline. For each of the 100+ source sites a worker pulls the listings, normalises them to a common shape — title, company, location, description, posted_at, source_url, remote flag, visa-sponsorship flag — and writes them to PostgreSQL. The same worker refreshes per-source last-seen timestamps so a source that stops returning can be flagged and the 50,000+ headline kept honest.

Matching runs as a separate service. When a user uploads a resume it is parsed and stored. When the user opens the list, the front-end requests the latest 24-hour snapshot filtered to the active controls. The scoring service computes a 0 to 100 score for the snapshot against the user's resume and streams the ranked results back. Live re-ranking is achieved by recomputing on every filter change rather than by precomputing, because the snapshot is small enough that a fresh score is cheaper than caching per-filter.

The resume builder, cover letter and company research features are generative and share a single prompt-routing layer. Tailoring takes the role description and the parsed resume, returns an ATS-shaped resume variant, and writes the variant to the tracker so the score at apply time reflects the tailored version.

The Chrome extension runs as an MV3 service worker. On a supported job page it reads the title, company and description, calls the match endpoint with the user's session token, and overlays the 0 to 100 score in a content script. The extension never proxies the page content; it only reads it.

## Milestones

1. **M1 — Catalogue** — daily scrape of the first 10 source sites into a normalised PostgreSQL schema.
2. **M2 — Resume parsing and scoring** — upload, parse, store, and a baseline 0 to 100 match against the snapshot.
3. **M3 — Live re-rank** — filter and search endpoints that recompute the score on every change.
4. **M4 — Visa and remote filters** — first-class controls and a per-role signal that drives them.
5. **M5 — Resume builder and cover letter** — tailoring pipeline that writes the variant back to the tracker.
6. **M6 — Tracker** — application records carrying the score at apply time and the current stage.
7. **M7 — Chrome extension** — MV3 service worker, content script overlay and per-host permission set.
8. **M8 — Scale to 100+ sources** — extend the scrape pipeline, monitor source health and keep the 24-hour refresh honest.

## Risks

- **Source terms drift** — one large board changing its terms can remove a meaningful share of the catalogue in a single day.
- **Live re-rank cost** — recomputing on every filter change is a budget that grows with catalogue and resume size; a sub-second target constrains both.
- **Score gaming** — a score that can be raised by tailoring without real relevance is not useful; the calibration of the score against apply behaviour is the only check.
- **Visa signal unreliability** — presenting a sponsorship signal that turns out to be wrong pushes the candidate into a wasted application, which is the opposite of the product's promise.
- **MV3 constraints** — Chrome's MV3 remote-code and host-permission rules can break the extension for one site at a time, and the surface area is the open web.
- **Stale postings** — the 24-hour refresh can lag a role being filled, and the candidate is then optimising against a ghost listing.
- **Resume privacy** — the resume is the user's most sensitive input, and storing it implies a real security posture around encryption, retention and deletion.
