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

## Phase 0: Scaffold

- [x] Capture the problem from the Show HN post
- [ ] Write DESIGN.md (browse grid, contribution form, coverage counter)
- [ ] Provision object storage bucket + CDN with long cache lifetimes
- [ ] Define the icon index schema (content hash, phash, source site, source URL, contributor, first seen)

## Phase 1: Core

- [ ] Backfill SHA-256 + perceptual hash for the 500,000 icons already held
- [ ] Rekey stored objects by content hash and verify no icon is lost in the move
- [ ] Contribution intake: archive upload (zip/tar/folder) with a job id and status page
- [ ] Contribution intake: URL list submission, crawled by the same worker
- [ ] Ingest worker: unpack, decode GIF, hash, compare against index, store only new icons
- [ ] Duplicate-review queue for perceptual-hash near matches instead of silent rejection
- [ ] Per-contribution report: files received, already held, newly added
- [ ] Provenance recorded per icon (contributor, source site, source URL)
- [ ] Static index rebuild after an accepted contribution; browse + single-click download preserved
- [ ] Public coverage page: total icons held and per-source-site breakdown
- [ ] End-to-end test: ingest a 5,000-icon archive with known overlap and confirm the new-unique count

## Phase 2: Deploy

- [ ] Publish a takedown and attribution policy before any donation drive
- [ ] Announce the contribution path to the HN thread and archivist communities
- [ ] Monitor CDN egress against the non-commercial budget
- [ ] Review dedup precision on the first three real donated batches
