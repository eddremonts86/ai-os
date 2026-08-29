---
id: "3717"
slug: hikaru-image-compression-that-hits-an-exact-file-size-n
title: "Hikaru – image compression that hits an exact file size, no slider"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488339"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Image, Compression]
tech: [TypeScript, Vite, browser-image-compression, OffscreenCanvas, Web Workers]
---
# Hikaru – image compression that hits an exact file size, no slider

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A user with a hard byte budget (an 8 KB avatar, a 100 KB passport photo, a 500 KB CMS upload cap) drops a JPEG/PNG/WebP into Hikaru, types the exact target size in KB, and gets back a file at that size — no quality slider, no "small / medium / large" guesses, and no upload because the compression runs entirely in the browser.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Visa and government-form applicants | The form rejects the upload above a hard KB cap; a slider does not help. |
| Job-portal and exam applicants | Same hard cap; resubmitting takes minutes when quality is wrong. |
| Web developers and CMS editors | Need a known byte budget for hero images, OG images, thumbnails. |
| Photographers sharing previews | Want a smaller file fast without a desktop app install. |
| Designers exporting for clients | Want a "fits in 200 KB" export without manual tuning. |

## Jobs To Be Done

1. **Functional job** — Produce an image at exactly the byte size the user typed, in the browser.
2. **Emotional job** — Stop wasting time tuning a slider by trial and error.
3. **Social job** — Hand a colleague a tool that respects the "≤ N KB" constraint without explaining it.

## Success Metrics

- **Convergence:** ≥ 95% of runs converge in ≤ 5 iterations on a 4 MB JPEG on a mid-range laptop.
- **Accuracy:** ≥ 90% of completed runs deliver a file within ± 2% of the typed target size.
- **Time-to-file:** median run completes in ≤ 6 seconds for a 4 MB JPEG.
- **Return usage:** ≥ 30% of visitors complete two or more compressions in the same session.
- **Bounce rate on target page:** ≤ 20% drop-off after the first compression completes.

## Pricing & Monetization

Free to use, no account, no upload (so there is no per-image cost to the operator). A future "Pro" tier could add batch upload, a CLI, and a hosted API, but v1 is fully free. The product's moat is the convergence algorithm and the brand association with "hit the byte budget".

## Competitive Landscape

- **Squoosh** (Google) — excellent quality controls but exposes a slider and per-codec settings, not a target-byte input.
- **TinyPNG / TinyJPG** — server-side compression with a max-file cap and a per-month free quota; not target-size.
- **ImageOptim (macOS)** — desktop only, lossy/lossy-but-not-target-size.
- **compressjpeg.io / iloveimg** — generic server-side tools; no target-size guarantee, file uploads leave the browser.
- **ffmpeg / cjpeg command line** — powerful but assumes a CLI user.

## Risks & Open Questions

- [ ] Decide the quality floor (and dimension floor) at which the tool gives up and warns the user that the target is unreachable.
- [ ] Confirm the convergence algorithm handles WebP alpha channel correctly without bloating the file.
- [ ] Validate that large PNGs with transparency do not stall the OffscreenCanvas pipeline in Safari.
- [ ] Decide whether to add a "by percentage" mode in v1 or push it to v2.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49488339) · **Category:** show-hn · **Tags:** Show HN,Product,Image,Compression
