---
id: "3822"
slug: hn-mirror-with-image-previews
title: HN Mirror with Image Previews
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494568"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [HN Firebase API polling, OpenGraph image extraction, link preview fallback, image preview rendering, feed cache, server-rendered mirror]
---
# HN Mirror with Image Previews

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the stated motivation and the invitation to use the mirror
- [x] Write SPEC.md (this document)
- [x] Set up a project that polls the HN Firebase API for the front page
- [x] Stand up a minimal server-rendered page that lists stories with titles, points and links

## Phase 1: Core

- [ ] Resolve an image preview per story: og:image first, favicon or generated thumbnail as fallback
- [ ] Cache story lists and preview images so repeated views do not refetch everything
- [ ] Handle stories whose targets have no image at all with a clean fallback, not a broken row
- [ ] Set a refresh cadence that keeps the mirror reasonably current with the HN front page

## Phase 2: Deploy

- [ ] Publish the mirror at a public URL and share it the way the poster did
- [ ] Watch for rate-limit or fetch failures from HN and story sites, and adapt fetching accordingly
- [ ] Decide whether the mirror stays feed-only or grows comments, search and paging later

---

_Generated automatically by Lúa on 2026-08-30_
