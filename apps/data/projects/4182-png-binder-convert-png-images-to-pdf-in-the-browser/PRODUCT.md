---
id: "4182"
slug: png-binder-convert-png-images-to-pdf-in-the-brow
title: "PNG Binder – convert PNG images to PDF in the browser"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510151"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# PNG Binder – convert PNG images to PDF in the browser

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

PNG Binder turns a folder of PNG / JPG screenshots into a clean PDF without uploading anything: the conversion runs in the browser tab the user already has open. No account, no watermark, no server-side trust required.


## Target Users

Users who need to combine a handful of PNG/JPG screenshots or scans into a single PDF and prefer not to upload their images to a third-party server. Assumes the reader can drag files into a browser tab.

## Jobs To Be Done

- When I need to send a handful of screenshots as one PDF, I want a browser-only tool so the images do not leave my device.
- When I paste a clipboard screenshot, I want it to land in the binder so I do not have to save it to a file first.
- When the PDF is ready, I want a download button so the workflow is one page, one click.


## Success Metrics

- Number of PDFs generated per day (proxy for usage).
- Conversion time for a 50-image job on a reference device.
- Number of users who reach the download step.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes browser-based image-to-PDF converters and OS-level print-to-PDF. The captured source post positions PNG Binder around the no-upload / no-account / no-watermark contract, but does not enumerate specific competitors by name.


## Risks & Open Questions

- The privacy claim is the entire wedge; if a future feature ever uploads anything, the product loses its reason to exist.
- 50 images per job is a soft ceiling; the UI has to explain it so users do not file bugs about a hard limit they did not see.
