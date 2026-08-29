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

## Phase 0: Scaffold

- Scaffold the Vite app with the image pipeline skeleton.
- Implement conversion with canvas + WebCodecs; add the format matrix.
- Implement optimization with browser-image-compression and a quality slider.
- Implement resizing with aspect-lock + pixel-target input.
- Chain the three stages into one UI flow.
- Add Workbox for the PWA service worker; verify install + offline.
- Document the Coolify self-host path; ship a static build.

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- A user can drop an image, choose convert + optimize + resize, and download the result without any upload.
- PWA installs on Chrome (desktop) and on Android.
- Self-host build deploys on Coolify with a one-line README.
- Test coverage on the conversion + resize helpers.

## Phase 2: Deploy

- Publish the PWA to a public URL behind HTTPS.
- Run a Lighthouse audit on PWA criteria.
- Write a one-page blog post on the privacy-first architecture.
- Refactor the vibed code with tests before adding AVIF encoding.
