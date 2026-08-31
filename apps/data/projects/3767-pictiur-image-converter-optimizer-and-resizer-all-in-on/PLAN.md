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

## Tech Stack

TypeScript, React (or Svelte) + Vite, browser-image-compression + canvas + WebCodecs, Workbox for the PWA service worker, Coolify for self-host distribution.

## Architecture

Single-page browser app. Image bytes never leave the device. A service worker caches the app shell + assets so it installs and runs offline. A small self-host doc covers the Coolify deploy.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Convert + optimize + resize pipeline working in the browser.
- **M2:** PWA install + offline mode.
- **M3:** Self-host docs + polish.

## Risks

- Browser memory ceiling on very large images.
- AVIF encode performance is uneven; a graceful fallback to WebP is needed.
- Service-worker scope can confuse self-hosters; the docs need to be specific.
- Code quality after vibe-coding is the author's own flag; the MVP needs a refactor pass.
