---
id: "4891"
slug: a-headless-synergy-server-setup-for-niche-use-cases
title: A headless Synergy server setup for niche use cases
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49550214"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A headless Synergy server setup for niche use cases

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ For someone with a bunch of retro machines that do not have a Synergy server port (and may not be near a machine that does or near one that I'd rather not run a Synergy server on) but do have a Synergy client port, using a headless Synergy server on a tiny SBC like the OrangePiZero makes for a slick, no frills setup to share a single mouse and keyboard among them.How do I use this?
I've currently got it connect across my Amiga 1000, Pegasos II running AmigaOS 4.1 FE and Pegasos II running MorphOS.A bit more info
For headless Synergy, we can't use xvfb (a virtual framebuffer) since it doesn't take input from physical devices. We can however use Xorg with a dummy device, which is similar to xvfb, but has the benefit of being able to use physical input devices. The below steps will go through the setup process and enabling a persistent Synergy server from the moment the system boots up.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49550214) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
