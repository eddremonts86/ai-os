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

## Tech Stack

Chosen for a feed mirror whose whole job is fetching, decorating and re-rendering a list.

- **HN Firebase API polling:** the official JSON API is the obvious source for a mirror of the front page.
- **OpenGraph image extraction:** each story URL is probed for og:image metadata as the primary preview source.
- **Link preview fallback:** favicons or generated thumbnails cover stories whose targets publish no OG image.
- **Feed cache:** story lists and fetched images are cached so the mirror does not refetch the world on every view.
- **Server-rendered mirror:** a simple server-rendered page keeps the mirror fast and shareable with a plain URL.

## Architecture

- **Feed fetcher:** polls the HN API for the front page and resolves story metadata.
- **Preview resolver:** fetches each story's OpenGraph image, with fallback to favicon or thumbnail.
- **Image cache:** stores fetched previews so repeat views and slow targets stay cheap.
- **Renderer:** composes the story list with previews into the mirror page served at the public URL.

## Milestones

1. **M0 — Mirror skeleton.** Front page fetched from the HN API and rendered as a story list with metadata.
2. **M1 — Image previews.** OG image resolution with fallback per story; every row shows a preview or a placeholder.
3. **M2 — Public release.** The mirror is live at a public URL, matching the poster's invitation to use it.
4. **M3 — Robustness.** Caching, failure handling and a refresh cadence that keeps the mirror honest under HN load.

## Risks

- **Preview availability:** many linked sites publish no OG image; the fallback path decides how the mirror looks.
- **Dependence on HN:** the mirror lives or dies with the HN API's availability and rate limits.
- **Single-maintainer project:** nothing in the post suggests anyone else will keep it running.
- **Unstated scope:** the capture says nothing about comments, search or paging — those may simply not exist.
