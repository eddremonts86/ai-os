---
id: "3634"
slug: repobeats-self-hostable-github-activity-cards-in-rust
title: Repobeats – self-hostable GitHub activity cards in Rust
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481365"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, Axum, SeaORM, SQLite, PostgreSQL, Redis, resvg]
---
# Repobeats – self-hostable GitHub activity cards in Rust

## Tech Stack

- **Rust with Axum** for the HTTP service, as stated in the post: card serving is a high-fanout read path where predictable latency and a small memory footprint matter more than framework breadth.
- **SeaORM** as the data layer, chosen because the same query code must run against both SQLite and PostgreSQL — the two deployment shapes the project promises.
- **SQLite** as the default single-instance store, so the smallest useful deployment is one binary and one file.
- **PostgreSQL** for multi-instance deployments, where several replicas need one shared store and row-level coordination for refresh leases.
- **Redis** as the optional shared cache layer once replicas exist, sitting in front of the in-process cache rather than replacing it.
- **resvg** for rasterising cards when a PNG fallback is needed; the primary output stays SVG, which is what makes themes and sizes cheap.

## Architecture

A repository enters the system by its owner installing the read-only GitHub App. The install webhook records the installation and the selected repositories; nothing before that point collects anything. When a collection run needs GitHub access it mints an installation token, uses it, and drops it — the token never reaches the database, the cache or a log.

Collection is incremental and conditional. Each repository row carries the cursors and ETags from its last successful run, so a refresh asks GitHub what changed rather than re-reading history, which is what keeps a growing installation inside a per-installation rate limit. Commits, issues, pull requests and repository metadata land in normalised tables; the card's series are derived from those tables rather than stored as pre-rendered numbers, so changing a time range does not require re-collection.

The refresh scheduler is the part that has to be designed rather than assumed, because the author names multi-replica scheduling as his open question. Each due repository is claimed with a lease carrying an owner and an expiry, so exactly one replica collects it per interval and a replica that dies mid-run releases its claim by expiry instead of stranding the repository. On SQLite the lease is trivially uncontended because there is one replica; on PostgreSQL it is a conditional update, which is why the store choice and the replica count move together.

Card requests are served from cache wherever possible: an in-process layer first, then Redis if configured, then a render. Every response carries an ETag derived from the underlying data version and the render parameters, so an image proxy fetching the same card repeatedly gets a 304 rather than a re-render. Because a card is embedded in a README and proxied, the SVG is emitted self-contained, with no external font or script reference to break inside the proxy.

## Milestones

1. **M1 — Install and collect** — GitHub App, install webhook, short-lived token minting, and one full collection pass for commits, issues, pull requests and metadata into SQLite.
2. **M2 — Render** — SVG card generation with themes, sizes and time ranges, served with ETags and cache headers, plus the self-contained-output check against GitHub's image proxy.
3. **M3 — Incremental refresh** — cursors and conditional requests, a per-repository last-successful-refresh record, and an operator view that makes staleness visible.
4. **M4 — Multi-instance** — PostgreSQL support behind the same SeaORM layer, lease-based refresh claiming, and optional Redis in front of the in-process cache.
5. **M5 — Self-host documentation** — both deployment shapes documented end to end, including App private key handling and the point at which SQLite should be swapped out.
6. **M6 — Feedback pass** — act on the two things the author asked about publicly: the install and opt-in flow, and the design of the generated SVG.

## Risks

- **Silent staleness returning** — the failure this project was built to escape. Without a visible last-refresh signal the new service can fail the same way, so the operator view is a requirement rather than a nicety.
- **Rate-limit exhaustion** — a full re-fetch per interval, or two replicas collecting the same repository, will burn an installation's budget and stop all its cards at once.
- **Token leakage** — installation tokens are short-lived, which limits blast radius but does not remove it. A single debug log line printing a token is the whole risk.
- **Consent misunderstanding** — a private-repository owner who did not register that the card is public has been given a data-exposure problem by the product, not by their own mistake.
- **Image proxy incompatibility** — a card that renders correctly in a browser but breaks behind GitHub's proxy is broken in the only place it is used.
- **Divergence between the two stores** — a query or migration that works on PostgreSQL but not SQLite splits the deployment promise, so both need to run in CI.
- **Lease correctness** — an expiry too short duplicates work and an expiry too long strands a repository; this needs a measured value, not a guessed one.
