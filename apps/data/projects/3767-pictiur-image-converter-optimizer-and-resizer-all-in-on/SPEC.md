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

## Problem

The author needed to do document scans every day for a month — photos of ID papers — and noticed the online image-tool market is split: tools focus on conversion, optimization, or resizing, but rarely two in one, let alone three. The existing tools are riddled with ads, fake download buttons, and dubious data practices. The author runs a home server with self-hosted projects on Coolify and wanted an offline-capable alternative. They vibe-coded the result in a few hours with DeepSeek Flash; the site is 100% local, the whole process runs in the browser, it is a PWA so it installs and works offline, and the repo is public.

## Objective

Ship a PWA that does conversion, optimization, and resizing in one tool, runs entirely in the browser with no upload, and stays installable for offline use.

## Target Users

1. **Privacy-conscious home user** — does not want ID photos leaving the device.
2. **Self-hoster** — wants a small tool that lives on their own server or installs as a PWA, not a SaaS.
3. **Daily scanner** — needs to do the same three operations (convert + optimize + resize) on every document scan; the three-in-one shape is the point.

## MVP Scope

- Image conversion across the common formats (JPEG, PNG, WebP, AVIF).
- Image optimization with a quality slider.
- Image resizing with aspect-lock and pixel-target input.
- Chain all three in one pipeline.
- PWA: installable + offline-capable.
- No upload to any server; the entire pipeline runs in the browser.
- Self-hostable as a static site for the author's own server.

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- The pipeline must run entirely in the browser; no upload of any user image.
- PWA install + offline mode are part of the MVP, not a stretch goal.
- No third-party tracking, no analytics, no ads — the privacy posture is the product.
