---
id: "2093"
slug: omacosy-omarchy-style-tiling-desktop-for-macos-no-sip
title: "Omacosy – Omarchy-style tiling desktop for macOS, no SIP"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49374830"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Omacosy – Omarchy-style tiling desktop for macOS, no SIP

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have been using omarchy on my tower since nearly a year now, shortly after it was released first. I really love the experience I am having with it but I still use my macbook for daly work, so I wanted to recreate a similar experience on it. Thats why I created omacosy, a setup for tiling windows, custom menu bar, some themes from omarchy, focus follows mouse, focus rings around windwos, some mac flavors with trackpad events and a custom mission control overview for your workspaces.I used AeroSpace over yabai for the tiling window manager because I didnt wanted to compromise on SIP which is a mac security feature.
It is supposed to be keyboard first like omarchy to move windows organize workspaces etc
The setup runs around 157mb of ram and consists of AeroSpace, Karabiner (for the super key), and five small self build swift binaries.I am running it daily on my M1 max macbook, currently on macOS26. I havent tested it much on other macbooks or macOS versions.
The install script creates a manifest file to backup what was installed before and what it installed itself, the uninstall script takes that into account to clean up the macbook to exactly the state it was in before.
It needs quite some permissions for it sfunctionality which I layed our in the project readme. I wanted to be really transparent about which permissions it uses and for what reason.I would love to get some feedback or see people trying it out and hearing your opinion. Mostly about what still doesnt feel smooth in the experience or if you find any performance issues.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49374830) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
