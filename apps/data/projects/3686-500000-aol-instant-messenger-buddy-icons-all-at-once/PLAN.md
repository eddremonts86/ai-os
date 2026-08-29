---
id: "3686"
slug: "500000-aol-instant-messenger-buddy-icons-all-at-once"
title: "500,000+ AOL Instant Messenger Buddy Icons All at Once"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485262"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Static site generation, Object storage (S3-compatible), Perceptual hashing (pHash), Python scraping workers, SQLite FTS5, Cloudflare CDN]
---
# 500,000+ AOL Instant Messenger Buddy Icons All at Once

## Tech Stack

- **Storage:** S3-compatible object storage for the icon files themselves, keyed by content hash, fronted by a CDN. Half a million small GIFs is a static-asset problem, not a database problem.
- **Index:** SQLite with FTS5 for filenames, tags and provenance — one file, replicated with the build, no server to keep alive on a non-commercial budget.
- **Browse layer:** statically generated pages built from the index, so serving cost stays at CDN egress.
- **Ingest workers:** Python for archive unpacking, GIF decoding and URL crawling; the same tooling the author already used to scrape.
- **Dedup:** SHA-256 for exact matches plus a perceptual hash (pHash on the first GIF frame) to catch re-encoded copies of the same icon.

## Architecture

Two paths that never block each other. The read path is entirely static: the index build emits browse pages that point at content-hash URLs on the CDN, so a traffic spike from an HN post costs bandwidth and nothing else. The write path is a queue: a contribution (uploaded archive or URL list) becomes a job, a worker unpacks or crawls it, hashes each icon, checks the hash against the index, stores only the new ones, and writes back a per-contribution report of how many were unique. A rebuild of the static index runs after a contribution lands rather than on every file.

## Milestones

1. **M0 — Inventory the existing 500k.** Backfill content hashes and perceptual hashes for everything already held; without this there is nothing to deduplicate against. End of week 2.
2. **M1 — Contribution intake.** Upload an archive or submit a URL list, get a job id and a status page. End of week 4.
3. **M2 — Dedup + provenance.** Worker reports new-vs-duplicate counts per contribution and records contributor and source site per icon. End of week 6.
4. **M3 — Static index rebuild.** Browse and single-click download regenerated from the index after each accepted contribution. End of week 8.
5. **M4 — Coverage page.** Public counter of icons held and per-source coverage, replacing the hand-estimated "about 20%". End of week 9.

## Risks

- **The missing 80% may not exist anywhere.** The plan assumes someone still holds an intact iconator.com-style backup. The author already found the Wayback Machine does not cover these sites completely. If no donor appears, the pipeline is built for traffic that never arrives — so intake should be cheap to build and cheap to leave idle.
- **Perceptual hashing on animated GIFs is imperfect.** Hashing one frame will collapse genuinely different animations that share a first frame. Any auto-reject needs a review queue rather than silent deletion, or the archive loses icons it accepted.
- **Copyright and takedowns.** These are user-shared avatars from defunct commercial sites with no stated licence. A donation drive raises the profile; a takedown process has to exist before it does.
- **Cost at zero revenue.** The site is explicitly non-commercial. A front page on HN against 500,000 uncached small files is an egress bill. Content-hash URLs plus long cache lifetimes are load-bearing, not an optimisation.
