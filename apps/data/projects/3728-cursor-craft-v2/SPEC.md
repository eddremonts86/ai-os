---
id: "3728"
slug: cursor-craft-v2
title: Cursor Craft v2
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/cursor-craft"
category: product-launch
date: "2026-08-22"
tags: [ProductHunt, Product Launch]
tech: [macOS app, Swift or Objective-C, cursor asset pack, installer]
---
# Cursor Craft v2

## Problem

The ProductHunt post is URL-only: it points at [producthunt.com/products/cursor-craft](https://www.producthunt.com/products/cursor-craft) with the tagline "Custom Mac cursors, rebuilt for v2" as the only inline content. Reading the title literally, Cursor Craft is a macOS app (or pack) that delivers custom cursor designs, and v2 is a re-release rather than the original launch. The "rebuilt" framing implies the v1 design or distribution model had problems worth fixing.

The underlying problem this responds to is that macOS users who want non-default cursors — designers, streamers, accessibility users who find the default pointer hard to see, people who simply want their desktop to feel personal — have a fragmented market: small paid packs on Gumroad, free PNG sets that need a manual installer, and app-store options that vary wildly in update cadence. A user wants a curated, installable, regularly-updated pack that fits the OS, and that is what "v2 rebuilt" is positioned to be.

The post does not name the cursor styles, the price, the distribution channel (App Store, direct download, subscription), or what "rebuilt" specifically changed. Those choices live on the ProductHunt page and the project site, not in the post.

## Objective

Ship a second version of the Cursor Craft macOS cursor pack, rebuilt from v1, with a curated set of cursor styles that install cleanly on current macOS. The MVP targets the "custom Mac cursors that actually install and stay updated" promise. It does not target Windows, Linux, a SaaS dashboard, or a cursor-creation tool for end users.

## Target Users

- macOS users who want a non-default cursor set for personal expression or aesthetic reasons.
- Designers and streamers who want their on-screen cursor to match a brand or a stream overlay.
- Accessibility users who find the default pointer hard to see and want higher-contrast or larger cursors.

The post does not name enterprise use; the ProductHunt audience is individual macOS users.

## MVP Scope

- A v2 cursor pack: a curated set of cursor designs (arrow, pointer, text, busy, resize handles, etc.) that cover the standard macOS cursor roles.
- An installer that drops the cursors into the right place and lets the user activate them in System Settings.
- A landing / purchase page on the project site linked from the ProductHunt post.
- An update story: v2 implies ongoing releases; the project needs a way for existing customers to get v2 without re-buying.

The MVP does not include a cursor-creation editor, Windows / Linux support, or a SaaS subscription management layer.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Rebuilt" is the headline claim: v2 must visibly differ from v1 in the surface the user sees — design, installer, update flow, or all three — not just a version bump.
- macOS-native: cursors must match macOS conventions (size, hotspot alignment, dark / light mode behavior). A pack that fights the OS will read as broken.
- Honest distribution: the channel (App Store, direct download, or paid pack) must be clear, and what the user gets for free vs. paid must not be buried.
- Update story: a cursor pack without a clear upgrade path for v1 buyers will read as a re-launch to the same audience, which is its own problem.
- Scope honesty: the post does not name cursor styles or a count; the project page should publish the actual list, not a vague "many styles."
