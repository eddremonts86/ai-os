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

## Problem

Image-compression tools almost always give the user a quality slider and a vague "small / medium / large" target. The user's actual constraint is usually a hard number: an avatar that must upload at ≤ 8 KB, a passport photo that must be ≤ 100 KB, a hero image that the CMS caps at ≤ 500 KB. Slide-and-pray loses a lot of time. The Show HN post [https://hikarulabs.xyz](https://hikarulabs.xyz) markets Hikaru as "image compression that hits an exact file size, no slider" — the user enters a target size, the tool converges on it. The captured brief is just the URL; the source page surfaces marketing claims (25,000+ organic visits, a "Startup of the Year" award for 2026, and a Top 10 browser-utility ranking) plus a testimonial that it reduced a file to 8 KB. Plan scope is therefore grounded in those claims: a target-by-number compressor, browser-based, with the convergence algorithm being the only real product surface.

## Objective

Ship a browser-based image compressor where the user picks a file and types a target size in KB (or a percentage of the original), and Hikaru returns an image at exactly that size without any quality slider. The compressor must work on JPEG, PNG and WebP, must run entirely in the browser (no upload), and must converge in ≤ 5 attempts on a 4 MB starting image on a mid-range laptop.

## Target Users

- Primary: people filling out online forms (visa applications, job portals, government ID checks) with a hard file-size cap and no tolerance for guesswork.
- Secondary: web developers and content editors who need their CMS-uploaded images under a known byte budget; tertiary: photographers sharing previews over slow connections.

## MVP Scope

- Drag-and-drop or file-picker upload, single image at a time in v1.
- A "target size" input that accepts either a fixed KB value or a percentage of the original.
- Browser-side compression pipeline (decode → resize in OffscreenCanvas → re-encode at decreasing quality until target size is hit; if a quality floor is reached, downscale dimensions and retry).
- Side-by-side preview of original vs. compressed, with the final byte size displayed.
- Download the compressed file directly; no server upload, no account.
- A short history panel showing recent compressions in the current browser (session-only, no server-side persistence).
- No batch upload, no API, no paid tier in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens. The surface is a single primary panel (drop zone, target input, run button, preview). A neutral off-white background, one accent for the run action, one muted accent for warnings ("hit size floor at 600×400"), and tabular numerals for the byte readout so the size adjusts cleanly as the algorithm converges. No gradients, no decorative imagery, no third-party tracking.

## Constraints

- Compression must happen in the browser; the original file must never leave the device.
- The byte size of the output must equal the user's target (or the closest achievable size above the dimension/quality floor, with an explicit warning) on every run.
- The algorithm must terminate in ≤ 5 iterations on a 4 MB JPEG on a 2020 MacBook Air.
- No quality slider; the only inputs are the source file and the target size.
