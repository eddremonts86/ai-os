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

## Tech Stack

Chosen for a fully client-side pipeline: the convergence loop is the product, so it lives in typed code with the heavy work off the main thread.

- **TypeScript:** the convergence loop, byte-size checks, and UI state in one typed codebase.
- **Vite:** a static build with no server component at all.
- **Image codec pipeline:** decode, resize, and re-encode at decreasing quality until the target size is hit.
- **OffscreenCanvas:** resize and decode work off the main thread so the page stays responsive.
- **Web Workers:** the compression iterations run in a worker; the original file never leaves the device.

## Architecture

- **Input panel:** drop zone or file picker plus a target-size field that accepts a fixed KB value or a percentage of the original.
- **Convergence engine:** each iteration encodes, measures bytes, and adjusts quality; if the quality floor is reached, it downscales dimensions and retries.
- **Preview pair:** original versus compressed side by side with the final byte size in tabular numerals.
- **History panel:** a session-only list of recent compressions, stored in the current browser.
- **No network path:** nothing is uploaded; the download is a local object URL.

## Milestones

1. **M0 — Single-format pipeline.** A JPEG goes in and a target-size JPEG comes out in at most 5 iterations on a 4 MB file on a 2020 MacBook Air.
2. **M1 — All three formats.** PNG and WebP, including transparency, converge with honest floor warnings.
3. **M2 — Preview and history.** The side-by-side compare, byte readout, and session history land.
4. **M3 — Public launch.** The static build deploys with no account and no upload path anywhere.

## Risks

- **Unreachable targets:** images whose dimension or quality floor sits above the requested size must warn explicitly, never silently overshoot.
- **Safari pipeline stalls:** large transparent PNGs can stall OffscreenCanvas in Safari; validated before claiming full format support.
- **WebP alpha bloat:** the alpha channel can inflate output; the encoder must handle it or warn honestly.
- **Iteration budget:** a quality-floor miss that retries too often breaks the 5-iteration constraint.
- **Percentage-mode ambiguity:** whether "by percentage" ships in v1 or v2 must be decided before build, not during.
