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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

One place where every surviving AIM buddy icon is browseable and downloadable in a single click, and where anyone holding a backup of a dead icon site can hand it over and see exactly how many of their files were new to the archive.

## Target Users

| Stakeholder | Why they care |
|---|---|
| The archivist (John) | Has 500,000+ icons and an estimated 80% still missing; acquisition is currently manual scraping plus asking on HN. |
| Holders of old site backups | May have a full iconator.com-style mirror; will donate if the upload is one step and provenance is credited. |
| Nostalgia visitors and project builders | The original need: a couple of period-accurate buddy icons, with nowhere good to get them. |
| Web archivists | The named source sites are not fully covered in the Wayback Machine, so this fills a documented gap. |

## Jobs To Be Done

1. **Functional job** — Find and download a specific era-accurate buddy icon without scraping the web yourself.
2. **Emotional job** — Know the thing you remember from 2003 has not been deleted.
3. **Social job** — Donate a backup and be credited as the person who added 40,000 icons nobody else had.

## Success Metrics

- **Coverage:** icons held as a share of the archivist's estimated total — currently ~500,000 at roughly 20%.
- **Contribution throughput:** number of accepted contributions per month, and new-unique icons per contribution.
- **Dedup precision:** share of an incoming batch correctly identified as already-held, measured against a manually checked sample.
- **Availability of the browse path:** single-click download continues to work at 500k+ objects.

## Pricing & Monetization

None. The author describes the site as a "totally non-commercial project"; the product goal is coverage, not revenue, so the cost model matters more than any price.

## Competitive Landscape

- **Wayback Machine** — the obvious fallback, but the author found the icon-sharing sites are not completely archived there.
- **The original sharing sites (iconator.com and similar)** — the actual source of the missing 80%; defunct, which is why backups have to be traded person-to-person.
- **Ad-hoc GIF packs on forums and Reddit** — scattered, unindexed, no dedup.

## Risks & Open Questions

- [ ] No stated licensing position on the icons; a takedown and attribution policy needs deciding before soliciting large donations.
- [ ] The "20% of the total" figure is the author's rough estimate from period aggregator counts — treat it as an estimate, not a measured denominator.
- [ ] Unknown whether any large intact backup of iconator.com still exists; the whole coverage plan depends on someone answering the call.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49485262) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
