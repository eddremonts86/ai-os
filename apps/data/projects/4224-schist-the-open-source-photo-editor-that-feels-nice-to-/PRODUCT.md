---
id: "4224"
slug: schist-the-open-source-photo-editor-that-feels-nice-to-use
title: "Schist – the open source photo editor that feels nice to use"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507125"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Schist – the open source photo editor that feels nice to use

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Schist gives a Linux desktop user a free, open-source photo editor that integrates with their Photos library and ships in every common Linux desktop format for both x86_64 and aarch64. "Beautiful and feature-rich shouldn't mean closed source" is the headline, and the per-format packaging is the proof.


## Target Users

Linux desktop users who want a free, open-source photo editor that integrates with their Photos library and works on x86_64 and aarch64 machines (including Raspberry Pi and Ampere). Assumes the reader can install an AppImage or a distro package.

## Jobs To Be Done

- When I want to edit photos on Linux, I want an open-source editor so I do not have to subscribe to a closed-source product.
- When I edit a photo in my Photos library, I want the editor to see it so I do not have to export first.
- When I install on a Raspberry Pi or Ampere box, I want an aarch64 package so I am not stuck on x86_64.


## Success Metrics

- Number of install formats with verified builds.
- Latency of brushes on a Raspberry Pi reference device.
- Coverage of the OS Photos library integration.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other open-source photo editors (GIMP, Krita, Darktable) and cross-platform image tools. The captured source post positions Schist around per-format Linux packaging for both x86_64 and aarch64, but does not enumerate specific competitors by name.


## Risks & Open Questions

- Open source is a hard requirement; a future closed-source tier would break the headline claim.
- aarch64 packaging is real work; every format has to be rebuilt and tested on Raspberry Pi and Ampere.
