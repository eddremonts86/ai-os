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

## Phase 0: Scaffold

- [ ] Cloudflare account + Workers + D1 (or daily-rolled SQLite via Workers KV).
- [ ] Public-site static rendering: no client framework, plain HTML, CSS only.
- [ ] Decide on the daily-salt rotation policy (default: per UTC day, kept for two days then destroyed).
- [ ] DNS TXT ownership check: a Worker that runs `dig TXT` against the operator's declared domain, with a 5-minute cache TTL.
- [ ] Decide on the chain hashing scheme: `sha256(prev_digest || sha256(today's counter || today’s metadata))`, publish both `digest:[site]:[day]` and `counter:[site]:[day]` to D1.

## Phase 1: Core

- [ ] Script tag: one async-loaded JS file that POSTs `{site_id, hash(salt+IP+UA)}` to the ingest Worker; no cookies, no localStorage, no UA-sniffing, no fingerprinting.
- [ ] Ingest Worker: hash the request, drop the IP, drop the salt, increment the per-site per-day counter in D1.
- [ ] Sealing job: a Cron Trigger at midnight UTC that rolls today's counter into the previous day's digest and writes both `digest:` and `counter:` rows.
- [ ] Public page at `visits.report/r/[site]/`: rolling daily numbers, date range selector, current digest, list of historic digests, DNS TXT status banner.
- [ ] Verifier endpoint at `visits.report/v/[site]/`: returns the published chain of digests and counters; any caller can recompute the chain and assert equality.
- [ ] Tests:
 - Sealing regression: build the chain from raw counters and assert it equals the published chain.
 - Privacy regression: assert the ingest Worker writes no IP, no salt, and no UA to any durable store.
 - DNS TXT regression: assert the public page shows "verified" only when the cache shows a matching record.

## Phase 2: Deploy

- [ ] Cloudflare Worker + D1 deployed; cron trigger verified at midnight UTC by seeding a fake counter and watching the digest roll in.
- [ ] Public site deployed at `visits.report`; the founder's own site (`visits.report/r/507de85247a64071f4e5583f9ba2583b/`) is the live example.
- [ ] Script tag live on the founder's own site (already in production per the landing page).
- [ ] Smoke test in production: place the script on a test domain, complete the DNS TXT check, hit the page, verify a counter row and a digest row land and chain correctly.
- [ ] Publish the verifier endpoint and a "how to check" page so counterparties can recompute without contacting the operator.
