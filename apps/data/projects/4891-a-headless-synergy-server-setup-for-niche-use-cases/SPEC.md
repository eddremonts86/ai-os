# SPEC.md — A headless Synergy server setup for niche use cases

## Problem

For someone with a bunch of retro machines that do not have a Synergy server port (and may not be near a machine that does or near one that I&#x27;d rather not run a Synergy server on) but do have a Synergy client port, using a headless Synergy server on a tiny SBC like the OrangePiZero makes for a slick, no frills setup to share a single mouse and keyboard among them.<p>How do I use this?
I&#x27;ve currently got it connect across my Amiga 1000, Pegasos II running AmigaOS 4.1 FE and Pegasos II running MorphOS.<p>A bit more info
For headless Synergy, we can&#x27;t use xvfb (a virtual framebuffer) since it doesn&#x27;t take input from physical devices. We can however use Xorg with a dummy device, which is similar to xvfb, but has the benefit of being able to use physical input devices. The below steps will go through the setup process and enabling a persistent Synergy server from the moment the system boots up.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49550214)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T14:16:06Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
