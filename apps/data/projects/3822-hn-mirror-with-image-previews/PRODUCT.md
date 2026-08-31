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

## Value Proposition

A Hacker News you can skim with your eyes instead of only reading: every story on the mirror carries an image preview, so the front page works the way image-rich feeds do. The poster built it for his own reading habit — "some image stimulation while reading Hacker News" — and opened it to everyone else with the same need. There is no pricing, no signup and no product promise beyond that: it is a free alternative view of the feed.

**One-liner:** Hacker News with image previews next to every story, free for anyone who wants a visual front page.

## Target Users

| Stakeholder | Why they care |
|---|---|
| HN readers who skim visually | See what a story is about before committing to a click. |
| The poster himself | He built it because he is "one of those" who need image stimulation while reading. |
| Casual visitors invited by the post | "You're welcome to use it" — no setup, just a URL. |

The post describes no commercial audience; this is a personal tool shared publicly.

## Jobs To Be Done

1. **Functional job** — Browse the HN front page with an image preview beside each story.
2. **Functional job** — Decide which stories to open by sight, without clicking every link.
3. **Emotional job** — Make a text-dense reading habit feel lighter and more browsable.

## Success Metrics

- **Mirror coverage:** every story on the front page renders a preview or a graceful fallback.
- **Freshness:** the mirror reflects new HN stories within a short, defined lag.
- **Adoption:** other readers use the mirror — the post invites use but names no numbers, so this is directional.
- **Stability:** the feed stays up under HN traffic without breaking on malformed target pages.

## Pricing & Monetization

None stated. The poster built it for himself and shares it for free; there is no pricing, no account system and no stated plan to charge.

## Competitive Landscape

The post does not name competitors. The product sits in the category of alternative HN readers and front ends — text-only clients, mobile HN apps and minimalist mirrors — where the differentiator claimed here is the image preview itself: the classic front page shows no visuals, and this mirror does.

## Risks & Open Questions

- [ ] The capture names no implementation: how previews are sourced (OG tags, thumbnails, screenshots) is unknown, and each source has its own failure mode.
- [ ] Story sites without metadata produce no image; a broken preview could look worse than no preview.
- [ ] Rate limits or terms on HN's API and on third-party sites could break the mirror at any time.
- [ ] No maintenance or hosting story is stated; the mirror's availability depends entirely on the poster.
- [ ] Re-serving images from third-party sites raises questions the post does not address.
