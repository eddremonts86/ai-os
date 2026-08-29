---
id: "3624"
slug: auditai-automate-ai-visibility-tracking-and-seo-ranking
title: AuditAI – Automate AI visibility tracking and SEO ranking
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/auditai?utm_campaign=startup-180574&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Python, Playwright, TimescaleDB on PostgreSQL, Celery with Redis, SvelteKit, residential proxy pool]
---
# AuditAI – Automate AI visibility tracking and SEO ranking

## Tech Stack

- **Python** for collectors and mention detection: the text-processing and entity-matching work is where most of the code lives, and the ecosystem for it is here.
- **Playwright** for the surfaces that have no usable API, notably Google AI Overview and Google rank collection, since both are rendered results rather than endpoints.
- **TimescaleDB on PostgreSQL** because every measurement is a timestamped observation per keyword, platform and site; hypertables give week-over-week rollups without a second analytics store, and the join between AI mentions and rank stays a plain SQL join.
- **Celery with Redis** for the weekly fan-out: thousands of independent checks with per-platform rate limits, retries and a recorded outcome for each, including failures.
- **SvelteKit** for the reporting surface: the core view is a dense table with small trend charts, and shipping it without a heavy client framework keeps the table fast at a few thousand rows.
- **Residential proxy pool** for geographic rank collection, because a Google position is location-dependent and a datacentre address distorts both the result and the access.

## Architecture

A site has a keyword list and a competitor set (domains plus brand names). The weekly scheduler expands that into one task per keyword and per surface — four AI platforms plus Google rank — and pushes them onto Celery queues partitioned per platform, so one platform's rate limit or outage cannot starve the others. Each collector's job is deliberately narrow: fetch, store the raw artefact, and stop. AI collectors persist the full response text plus every cited or linked source; the rank collector persists the result page with the position and the location it was measured from. No interpretation happens at collection time, because interpretation changes and the raw artefact must remain the fixed record behind any number.

Mention detection runs as a second pass over stored responses. It resolves four things per response: is the customer's domain cited as a link, is the customer's brand named without a link, are any competitor domains cited, are any competitor brands named. Separating cited from named matters because they mean different things commercially, and separating detection from collection means a detector improvement can be re-run over history instead of invalidating it. Detection writes observations, not verdicts: one row per response per entity, with the matched span kept so the UI can highlight what triggered it.

The reporting layer reads the observation timeline. Because a single AI response is noise, nothing is presented as a one-run fact: mention rate is computed over the last N weekly samples, and the interface refuses to state a trend below a minimum sample count. The comparison the product is sold on is one query — keywords whose Google position is within the ranking set and whose mention rate on a given platform is zero — ordered by position, so the strongest rankings with no AI presence surface first. Failed checks are recorded as gaps and rendered as gaps; nothing is interpolated across a missed week.

## Data Model

- `site` — customer domain, brand names, default measurement location.
- `competitor` — site, domain, brand names, aliases.
- `keyword` — site, phrase, location, active flag.
- `run` — week, keyword, platform, state, started, finished, failure reason when failed.
- `response` — run, raw text or rendered page reference, cited sources, retention expiry.
- `observation` — response, entity (own or competitor), kind (cited or named), matched span, detector version.
- `rank` — run, keyword, position, location, result-page reference.
- `alert` — site, keyword, platform, kind (mention gained, mention lost, competitor appeared), week.

## Integrations

- **ChatGPT, Claude, Perplexity** — per-platform collectors, each isolated behind its own adapter and its own rate limit so one interface change is one adapter change.
- **Google AI Overview** — rendered collection, since the overview is part of the results page rather than an endpoint.
- **Google web results** — rank collection with an explicit location per query.
- **Export** — one file carrying both AI mentions and rank per keyword, for agency reporting.

## Milestones

1. **M0 — Collect and store raw evidence.** All four AI collectors plus rank collection running for one site's keyword list, persisting raw artefacts. Exit criterion: for a keyword, every one of the five surfaces has a stored artefact with a timestamp and a stated location, and a failed collection is stored as a failure rather than absent.
2. **M1 — Mention detection measured.** Detector resolving cited-versus-named for own and competitor entities. Exit criterion: precision and recall computed against a human-labelled sample of at least 300 responses per platform, with the numbers recorded and re-runnable after a detector change.
3. **M2 — Weekly cadence unattended.** Scheduler running the full set without user action, recording gaps. Exit criterion: four consecutive weeks complete with no manual intervention, and a deliberately failed platform week shows as a gap in the timeline with no interpolation.
4. **M3 — The comparison view.** Per-keyword timeline plus the ranks-on-Google-but-invisible-to-AI list. Exit criterion: the list is derivable from one query, every cell links to its raw response, and the UI declines to show a trend below the minimum sample count.
5. **M4 — Alerts and export.** Flip detection per platform, competitor-appeared alerts, and a single export covering both surfaces. Exit criterion: a mention lost in week N produces an alert referencing the two responses that bracket the change.

## Risks

- **Access to the AI surfaces is not guaranteed.** Interfaces change without notice and some access paths may be unsanctioned. The weekly promise inherits that fragility, so per-platform isolation and an honest status page are structural, not optional.
- **Mention detection precision is the product.** Free-text extraction over brand names that collide with ordinary words will produce false sightings; a wrongly credited competitor discredits the whole chart. Publishing precision is safer than assuming it.
- **Single-sample noise.** The same prompt returns different answers, so any interface that shows one run as a fact is misleading by construction. The minimum-sample rule has to be enforced in code, not in a footnote.
- **Raw-response storage growth.** Keywords times five surfaces times weeks, kept in full, is the storage bill and also the trust mechanism. Retention has to be decided and disclosed before customers depend on old evidence.
- **Rank collection at volume.** Location-dependent results plus proxy infrastructure make rank the least novel and most operationally annoying half of the system; underestimating it delays the comparison the product is sold on.
- **Weekly may be too slow.** A customer who publishes content on Monday and wants to know if it moved anything will not wait a week; the cadence in the listing may not survive contact with that expectation.
