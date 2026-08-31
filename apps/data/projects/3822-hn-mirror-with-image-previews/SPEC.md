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

## Problem

The poster is, in his own words, "just one of those who need some image stimulation while reading Hacker News": the front page is a wall of text, and a reader cannot see what a story looks like until clicking through. So he built a mirror of Hacker News that attaches image previews to the feed and published it as a Show HN with an open invitation: "You're welcome to use it!" The capture states no implementation details — the verifiable content is the title (a mirror with image previews), the poster's stated motivation, and the invitation to other readers.

## Objective

Turn the text-only HN reading experience into a visual one: a mirror that renders the same stories with an image preview beside each item, available for other readers to use. The MVP is a working public mirror, not a business.

## Target Users

- HN readers like the poster who want visual cues while skimming stories.
- Casual browsers who decide what to open by sight rather than by title.
- Readers looking for an alternative, more visual view of the HN feed.

## MVP Scope

- Mirror of the HN front page (story title, link, points, comment count) with an image preview per story.
- Image source per story: OpenGraph image first, favicon or generated thumbnail when the target page provides none.
- A public URL anyone can visit — the poster's "You're welcome to use it!" is the distribution.
- Graceful fallback for stories with no image so the feed never breaks.

## Constraints

- The capture is two sentences; implementation details are inference, and nothing about how images are sourced can be verified.
- The mirror depends on an external feed (HN) and on third-party sites' metadata; either can break or rate-limit it.
- No business model, accounts or payments are stated — the deliverable is a free reading tool.
- Image fetching must be considerate: a mirror that hammers HN or story sites would be unwelcome.

## Design Direction

See `DESIGN.md` for this project's design tokens.
