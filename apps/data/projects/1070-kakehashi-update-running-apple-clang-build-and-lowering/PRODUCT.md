---
id: "1070"
slug: kakehashi-update-running-apple-clang-build-and-lowering
title: "Kakehashi Update: Running Apple Clang build and lowering overhead to 1.24x"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49299613"
category: ask-hn
date: "2026-08-14"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Kakehashi Update: Running Apple Clang build and lowering overhead to 1.24x

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello again HN!After 11 days, I'm back with an update about Kakehashi. I want to thank you for your support!
Thank you for all your stars, comments. I didn't expect you to be so interested in the project.What's new:I managed to significantly accelerate the implementation process. Now, 7zip lags by just 1.24x compared to native Linux performance, and the Lua build differs literally by 1.5 to 2 seconds from a native launch.
The Lua build fails to compile via kh run make due to Linux-specific flags, which mirrors its behavior on native macOS. However, if it is built using kh run gcc -- -Wall -O2 -DLUA_USE_MACOSX -std=c99 onelua.c -lreadline -o /tmp/lua-onelua, everything compiles, builds, and runs perfectly.
Overall, I am currently actively working on the following binaries: git, clang, make, xcrun, otool, gcc, curl, 7zip, rm, ls, sh, csh, zsh, bash, and the Rust installation script.
Please note that you currently need to manually port the /bin, /sbin, /usr/bin, and /usr/lib/zsh folders from a macOS installation into the guest environment ("bottle") located at ~/.local/share/kakehashi/bottle/, since the entire setup won't work without these core dependencies.As for the known problems: right now, xcodebuild hits a SIGSEGV, and the Rust installer still fails to work correctly (it exits with error 1, and I haven't been able to pinpoint the exact root cause yet). Additionally, zsh has some bugs with localization and encodings, which surprisingly don't occur in other similar utilities. And, of course, you can still encounter unimplemented symbols and various other errors across different binaries or untested edge cases. It is still far from a finished product, but compared to what it was just 11 days ago, it's in a completely different state.I would be incredibly grateful for any help with testing, finding edge cases, and uncovering execution bottlenecks—especially in non-standard configurations (such as running the environment from an external drive). Pull requests are also highly welcome. It is simply impossible for me to keep track of everything on my own. Thank you all once again!Link: https://github.com/wie-project/kakehashi

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49299613) · **Category:** ask-hn · **Tags:** Ask HN,Problem
