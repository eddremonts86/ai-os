---
id: "4563"
slug: i-built-a-version-of-omarchy-that-runs-on-apple-silicon
title: I built a version of Omarchy that runs on Apple Silicon
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49539913"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I built a version of Omarchy that runs on Apple Silicon

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I wanted to try out Omarchy before doing a full install, but I only have an M series MacBook so I would have to find a laptop and there's no official M support yet.So I decided to create something that allows people to test and run Omarchy on their devices so they can understand how it feels.So I built an app that allows you to run Omarchy Quattro as a native, hardware-accelerated app on your Apple Silicon Mac!It uses QEMU and Apple's HVF, a custom built Omarchy ARM image, a swift app enclosing it, and custom patches on Omarchy, QEMU, Hyprland and more.I tried many things, and this approach achieved the best results. The native keyboard experience with Super shortcuts works very well, along with all the rest.It supports any resolution (fixed ratio), retina or non retina displays, audio input / output devices, shared clipboard, and many other features.Since it runs on top of macOS, native features like universal clipboard and AirPods work smoothly.It takes ~3min to install, works the same as any other standard macOS app.The whole project is open source, so feel free it check it out on GitHub, install, PRs, etc.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49539913) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
