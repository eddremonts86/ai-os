---
id: "3652"
slug: dipstick-alerts-search-recalls-and-service-bulletins-fo
title: Dipstick Alerts – Search recalls and service bulletins for your car
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483465"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Cloudflare Workers, Cloudflare D1 (SQLite), Cloudflare Queues, Cloudflare KV, Google Gemini API, NHTSA API]
---
# Dipstick Alerts – Search recalls and service bulletins for your car

## Tech Stack

- **TypeScript on Cloudflare Workers** as the runtime, because the post names it explicitly and the workload is request–response plus a daily batch, both of which Workers handles.
- **Cloudflare D1 (SQLite)** as the relational store for recalls, bulletins, vehicles and subscribers, because the natural shapes are tabular and SQLite is enough at this scale.
- **Cloudflare Queues** as the import pipeline between the daily NHTSA scan and the writers that match and persist, because Queues gives retries and backoff without an external broker.
- **Cloudflare KV** for the per-vehicle summary cache and any small read-through caches, because KV is cheap and Workers-native.
- **Google Gemini API** for the plain-language summary generation, because the post names it and it is the right shape for a one-call generation per document.
- **NHTSA API** as the data source, because the post names NHTSA as the underlying source and the API is the public path into it.
- **Cloudflare Email Sending** (or Email Workers) for the optional alert emails, because the post names email sending as part of the stack and Workers has a native surface.
- **No deploy target beyond the Workers project** — there is no separate server to run.

## Architecture

A daily scheduled worker scans the NHTSA API for newly published recalls and bulletins. Each new entry is published to a Cloudflare Queue, and a consumer worker normalises the entry, generates a plain-language summary using Gemini, and writes it to D1 with the original manufacturer document URL.

A second worker runs the vehicle-match step. Each normalised entry is matched against the year/make/model combinations in the catalogue, and a superseding-bulletin link is created when a successor is found. The match logic is auditable so the author can review incorrect matches and a user can report one.

The public search route is a single Workers endpoint that takes year, make and model, queries D1, and returns the matching entries with their summaries and links. The optional email alert subscription is a per-vehicle record in D1; the daily worker enqueues an alert for each subscriber whose vehicle has a new match and Cloudflare Email Sending delivers the message.

## Milestones

1. **M1 — Search page** — public year/make/model search with no signup required.
2. **M2 — Daily scan** — the scheduled worker that pulls newly published entries from the NHTSA API.
3. **M3 — Queue and consumer** — the Cloudflare Queue and the worker that normalises entries and writes them to D1.
4. **M4 — Vehicle match** — the auditable match step that maps an entry to applicable year/make/model combinations.
5. **M5 — Summaries** — Gemini-generated plain-language content with the original manufacturer document linked.
6. **M6 — Alerts** — optional email alerts for subscribers with per-vehicle delivery.
7. **M7 — Status page** — last-scan time, imported count and queue depth visible to operators and visitors.

## Risks

- **Daily scan overrun** — the scan must complete inside its 24-hour budget under normal NHTSA publication volume, or freshness is lost.
- **Vehicle-match errors** — an incorrect match is the author-named risk and the most likely source of user frustration; the match logic must be auditable.
- **Gemini drift** — generation tone and length can drift across versions; the prompt must be versioned.
- **Source authority** — the original manufacturer document must remain authoritative and be linked from every result.
- **US-only coverage** — the source is US-focused, and the site must say so on every page where coverage matters.
- **Alert noise** — subscribers who receive alerts that do not result in action will unsubscribe; the relevance signal has to be honest.
