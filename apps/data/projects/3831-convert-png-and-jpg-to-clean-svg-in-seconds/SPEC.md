---
id: "3831"
slug: convert-png-and-jpg-to-clean-svg-in-seconds
title: Convert PNG and JPG to clean SVG in seconds
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493250"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Image vectorization engine, SVG output pipeline, color optimization pass, client-side preview renderer, Paddle credit packs, multi-format upload handling]
---
# Convert PNG and JPG to clean SVG in seconds

## Problem

The capture is a URL-only Show HN: the post body is nothing but a link to vectorify.co, and the product claim is carried by the title — convert PNG and JPG to clean SVG in seconds. What the site verifies at authoring time: uploads of JPG, PNG, WEBP, GIF and BMP; instant vectorization with a preview before any download; credit packs of $3 (5 downloads), $6 (25) and $9 (50) processed by Paddle; transparency preservation; and editable SVG output aimed at Figma, Illustrator and CorelDRAW. The single comment on the thread links an arXiv paper, not a review.

## Objective

A web tool that converts raster images (PNG and JPG, per the title) into clean, editable SVGs in seconds, with a preview-first flow so users only pay when they download.

## Target Users

- Designers who need editable vector versions of logos and icons.
- Web developers converting raster assets to scalable SVGs.
- Anyone with a PNG or JPG who wants a one-off vector conversion without buying software.

## MVP Scope

- Upload PNG and JPG (the site adds WEBP, GIF and BMP).
- Instant vectorization with an on-page preview.
- Download clean SVG; one credit per new download.
- Pay-as-you-go credit packs; no subscription.

## Constraints

- The capture is a URL only; all product facts come from the site at authoring time and may change.
- "Clean" is the product's own adjective; output quality is unverified by any third party in the capture.
- Credit pricing ($3/$6/$9) is the site's current offer, not the poster's stated position.
- Raster-to-vector quality degrades with photographic or noisy sources; the site itself recommends cleaner source images.

## Design Direction

See `DESIGN.md` for this project's design tokens.
