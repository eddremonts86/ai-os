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

## Problem

For someone with a bunch of retro machines that do not have a Synergy server port (and may not be near a machine that does or near one that I'd rather not run a Synergy server on) but do have a Synergy client port, using a headless Synergy server on a tiny SBC like the OrangePiZero makes for a slick, no frills setup to share a single mouse and keyboard among them.How do I use this?
I've currently got it connect across my Amiga 1000, Pegasos II running AmigaOS 4.1 FE and Pegasos II running MorphOS.A bit more info
For headless Synergy, we can't use xvfb (a virtual framebuffer) since it doesn't take input from physical devices. We can however use Xorg with a dummy device, which is similar to xvfb, but has the benefit of being able to use physical input devices. The below steps will go through the setup process and enabling a persistent Synergy server from the moment the system boots up.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
