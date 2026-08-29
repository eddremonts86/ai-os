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

## Problem

AOL Instant Messenger buddy icons — the small animated GIFs people used as avatars in the late 1990s and 2000s — are disappearing. John (HN user `shedletsky`) went looking for a couple of them for a project, found no usable collection, and ended up scraping the web himself. He now hosts slightly over 500,000 icons at buddyiconarchive.com, live, browseable and downloadable with a single click, and estimates that is roughly 20% of everything that ever existed, based on the counts the period aggregators advertised. The remaining 80% sits in sites like iconator.com that, as he found, are not completely archived in the Wayback Machine. His blocker is not hosting or browsing — it is acquisition: he is publicly asking people to trade icons or send him full backups of old sharing sites, via a contribute files/urls page.

## Objective

Turn a one-person scraping effort into an ingestion pipeline that strangers can feed: accept bulk uploads and URL lists of buddy icons from anyone holding an old backup, deduplicate them against the existing 500,000, and publish the additions to a browseable, single-click-download archive — so the collection can move past 20% of the estimated total without John doing every acquisition by hand.

## Target Users

- Primary: the archivist running the collection, who needs contributed backups ingested and deduplicated without manual per-file work.
- Secondary: people holding an old hard drive, FTP mirror or full backup of a defunct icon-sharing site (iconator.com is the one named) who are willing to donate it if the handoff is easy.
- Tertiary: visitors browsing or downloading icons for nostalgia or for their own projects — the use case that started this.

## MVP Scope

- Contribution intake: a page that accepts either a file/archive upload (zip, tar, folder of GIFs) or a list of URLs to crawl, as the existing contribute page does.
- Dedup on ingest: hash every incoming icon (exact hash plus a perceptual hash for re-encoded duplicates) and reject what the archive already holds, reporting how many were new.
- Provenance: store, per icon, where it came from (contributor, source site, source URL) so the archive can say what part of iconator.com it now covers.
- Browse and single-click download of the full set, preserving the current behaviour.
- Coverage counter: total icons held, and new icons added per contribution — the number John currently estimates by hand at "20%".

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Explicitly non-commercial, in the author's own words — no revenue path, so hosting and bandwidth for 500,000+ image files must stay near-zero-cost (static hosting plus a CDN, not an application server per request).
- Wayback Machine coverage of the source sites is incomplete, so the pipeline cannot rely on it as a backfill and must be able to accept private backups.
- Copyright status of the icons is unresolved: they were user-shared avatars on now-defunct sites. Takedown handling has to exist, but the source says nothing about licensing, so no claim about it is made here.
- Content is animated GIFs from the era: tiny, numerous, and easy to re-encode, which is why exact hashing alone will not deduplicate a donated collection.
