---
id: "3767"
slug: pictiur-image-converter-optimizer-and-resizer-all-in-on
title: "Pictiur: Image converter, optimizer and resizer, all in one"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49489096"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, React (or Svelte) + Vite, browser-image-compression + canvas + WebCodecs, Workbox for the PWA service worker, Coolify for self-host distribution]
---

# Pictiur: Image converter, optimizer and resizer, all in one

> Brief derived from the source post. No facts added beyond what the post asserts.

## Value Proposition

Convert, optimize, resize — all in one, all in your browser, no upload. A PWA so it lives on your phone and works on the train.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Privacy-conscious user | Their ID photos should not touch a server. |
| Self-hoster | A static site on their own Coolify instance is one click. |
| Daily scanner | Three operations chained together, not three tools. |

## Jobs To Be Done

1. **Functional job** — convert + optimize + resize an image without leaving the browser.
2. **Emotional job** — feel in control of where the image goes.
3. **Social job** — share a clean installable tool with friends who hate ad-laden image sites.

## Success Metrics

- **Activation:** % of first-time visitors who complete one full convert+optimize+resize pipeline.
- **Retention:** return visits; PWA install rate.
- **Revenue:** the post is explicit about personal use; no pricing stated.

## Competitive Landscape

- CloudConvert / iLoveIMG / Squoosh: feature-complete but cloud-dependent and ad-laden.
- Squoosh (the closest sibling): also browser-only, also strong, but no built-in PWA / install path.
- ImageMagick / sharp on a server: powerful but requires self-hosting and CLI.

## Risks & Open Questions

- Browser memory is bounded; very large images may fail; the MVP must communicate limits.
- AVIF encoding speed varies wildly by browser; the MVP needs a fallback.
- Self-hosting a PWA on Coolify is straightforward but the service-worker scope can trip new users.
- Vibed code quality: the author flags it themselves; refactor before scale.
