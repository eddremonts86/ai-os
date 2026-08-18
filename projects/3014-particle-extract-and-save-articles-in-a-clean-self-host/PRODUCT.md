---
id: "3014"
slug: particle-extract-and-save-articles-in-a-clean-self-host
title: "Particle – Extract and save articles in a clean, self-hosted reader"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339175"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Particle – Extract and save articles in a clean, self-hosted reader

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

**One-liner:** A self-hosted, PWA-installable article reader — drop a URL, get a clean extracted view with structure and images preserved, save it to a personal SQLite library, read it later on any device.

The product exists because modern article pages have become hostile to actual reading. The author's framing — "this is the most-used self-developed app I run" — is the product's central promise: a reader that puts the article first, keeps it under the user's control, and removes everything the modern web stacks on top of the text. The MVP is the loop the author already built: extract, save, read later, optionally export the whole library to a folder of HTML files.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Readers frustrated by the modern web | Want a quiet alternative that strips auto-play, modal CTAs, cookie banners, and other noise |
| Power readers with a "read later" habit | Want a tool they control rather than a SaaS that can be shut down |
| Tablet and phone readers | Want a PWA they can install from the browser without going through an app store |

## Jobs To Be Done

1. **Functional job** — Drop a URL, get a clean extracted article with structure and images preserved, save it, and find it again later by date or source.
2. **Emotional job** — Feel that the article is the only thing on the screen — no autoplay, no popups, no banners.
3. **Social job** — Be able to point at a self-hosted tool as evidence of one's own reading discipline, instead of pointing at a SaaS that monetizes attention.

## Success Metrics

- **Extraction success rate:** Of a 100-URL hand-curated test set across major publications, the extractor returns a clean article in at least 85% of cases.
- **Library activation:** A user saves at least three articles within seven days of installing.
- **Return usage:** Of users who save three articles, 50% revisit the library at least twice in the next 30 days.
- **Offline reads:** At least 20% of article opens happen while offline (service worker hit).
- **Export usage:** At least 5% of users export their library to HTML in the first 90 days — a signal of trust in the local-first design.

## Pricing & Monetization

The MVP is self-hosted and free. No monetization path is assumed.

## Competitive Landscape

Source gives no competitive signal about comparable products the author benchmarked against. Self-hosted read-later tools exist in the open-source ecosystem (Wallabag, Readeck), but the source post itself does not name a comparable product and naming one without warrant would be invention.

## Risks & Open Questions

- **Extractor brittleness.** Publication sites change layout; an extractor that worked in August may break in October. Mitigation: a regression test set of 100 URLs run in CI, plus a "report bad extraction" link in the reader view.
- **Copyright of saved articles.** Storing an article in a personal library is well-trodden ground (Pocket, Wallabag) but the MVP ships without legal review. Mitigation: the README notes the intended personal-use scope and recommends users consult local law.
- **PWA install discoverability.** Browser install prompts vary. Mitigation: a clear "install" button in the UI plus a custom install page.
- **No cross-device sync means a user with two devices has two libraries.** Mitigation: the export-to-HTML path lets the user move their library by hand; sync is explicitly out of scope for v1.

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49339175) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
