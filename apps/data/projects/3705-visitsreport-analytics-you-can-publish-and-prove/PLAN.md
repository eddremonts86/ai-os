---
id: "3705"
slug: visitsreport-analytics-you-can-publish-and-prove
title: Visits.Report – analytics you can publish and prove
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487243"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Plain HTML, vanilla JS tag, Cloudflare-edge hashing, SQLite]
---
# Visits.Report – analytics you can publish and prove

## Tech Stack

- **Public pages:** Plain HTML rendered on the server. The product's surface is a public page anyone can open, so the rendering path is deliberately boring — no client framework, no hydration, no SPA.
- **Script tag:** A single, tiny JS file that loads asynchronously. It computes a hash of (site_id, IP, browser, daily salt) and POSTs it to the ingest endpoint. No cookies, no fingerprinting, no localStorage writes.
- **Ingest:** Cloudflare Worker at the edge, hashing the request before it lands anywhere. The Worker writes the (already-hashed) visitor count into Cloudflare D1 or a daily-rolled SQLite file; the IP and the daily salt are dropped after hashing.
- **Hash chain:** Each completed day's digest is `sha256(prev_digest || today's_count || today's_metadata)`. The previous digest is committed publicly, so any historical recompute can verify the chain forward.
- **DNS ownership check:** A `dig TXT` of the operator's domain, on demand, against the operator's declared site. Until it matches, the public page renders a banner saying so.
- **Verifier:** A small public endpoint that takes a `site_id` and a `date` and returns the digest for that day, plus the chain of previous digests. Anyone can recompute the chain themselves.

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) is not used. The product is a static-site + Cloudflare Worker + Cloudflare D1 shape — boring by design, because every extra moving part is something the verification story has to vouch for.

## Architecture

```
                    ┌────────────────────────┐
                    │  Operator's site       │
                    │  script tag, async │
                    └──────────┬─────────────┘
                               │ POST {site_id, hash}
                               ▼
                    ┌────────────────────────┐
                    │  Cloudflare Worker     │
                    │  - hash(salt+IP+UA)    │
                    │  - drop IP             │
                    │  - drop salt           │
                    │  - increment counter   │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │  Cloudflare D1 / KV    │
                    │  visits:[site]:[day]   │
                    │  digest:[site]:[day]   │
                    └──────────┬─────────────┘
                               │ once per day
                               ▼
                    ┌────────────────────────┐
                    │  Sealing job           │
                    │  digest_n = sha256(    │
                    │    digest_{n-1} ||     │
                    │    today's counters)   │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │  visits.report/r/[id]/ │
                    │  plain HTML             │
                    │  - current numbers      │
                    │  - digests, by date     │
                    │  - verifier link        │
                    │  - DNS TXT status       │
                    └────────────────────────┘
```

The architecture is what makes the trust claim hold: counts are written by the operator's own infrastructure (the Cloudflare Worker), digests are sealed daily, the public page is static HTML, and the verifier is a separate endpoint that recomputes against the published chain. There is no client-side dashboard the operator could edit.

## Milestones

1. **M0 — Script tag + ingest + daily counter** — a one-line script, a Worker that hashes at the edge and drops the IP, and a per-site per-day counter.
2. **M1 — Public page** — `visits.report/r/[site]/` showing rolling daily numbers, a date range, and a DNS TXT status banner.
3. **M2 — Daily sealing job** — at midnight UTC, hash today's counter into the previous day's digest and publish both.
4. **M3 — Verifier endpoint** — a public endpoint that returns the chain of digests and lets any caller recompute and confirm.
5. **M4 — DNS TXT ownership check** — on every public page load, do a `dig TXT` against the operator's declared domain; show "domain ownership verified" only when the record matches.

## Risks

- **Sealing is the product.** A bug in the daily sealing job silently breaks the chain and the trust claim with it. The MVP needs a reviewable sealing implementation (a few dozen lines, no clever shortcuts) and a recompute test that re-derives the chain from the counters and asserts equality against the published digests.
- **DNS TXT on demand is a latency cliff.** `dig TXT` on every page load adds round-trip latency to every public report. The MVP needs to cache the TXT result with a TTL (5 minutes is fine) and document the cache window on the public page so verifiers know what they're seeing.
- **Cookie-banner-free is a contract.** The product's privacy posture is the selling point. A single accidental fingerprinting line, a single IP written to a log, breaks it permanently. The MVP needs an explicit allowlist of what the Worker is allowed to write.
- **No paid tier named.** The post and the landing page both stop at "Start free". The revenue model is an open question — a per-site paid tier that unlocks longer history, custom branding, or a per-site verifier API is one obvious shape, but the post does not commit to any.
