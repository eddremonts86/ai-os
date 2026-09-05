---
id: "4215"
slug: floe-an-open-source-plugin-for-sample-libraries-clapvst
title: Floe – an open-source plugin for sample libraries – CLAP/VST3/AU
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507908"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Floe – an open-source plugin for sample libraries – CLAP/VST3/AU

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Floe is an open-source audio plugin (CLAP/VST3/AU) that plays sample libraries across macOS, Linux and Windows, with a Lua-based sample-library language so any developer can author their own library — free, no sign-ups.

**One-liner:** An open-source audio plugin and Lua-based sample-library language for macOS, Linux and Windows.

## Target Users

Composers, producers and sound designers who work in DAWs. Adjacent: developers who want to author their own sample packs with a real scripting language.

## Jobs To Be Done

- When I score to picture, I want a free plugin that plays my sample libraries on any DAW so I am not locked into a vendor.
- When I want my own sample pack, I want a Lua-based language so I can script behaviour without recompiling the plugin.
- When I switch DAWs, I want the same plugin on macOS, Linux and Windows so my libraries come with me.

## Success Metrics

- Number of distinct DAW hosts that load Floe cleanly (CLAP/VST3/AU).
- Number of third-party packages shipped using the Lua language.
- floe.audio/packages traffic.
- Qualitative: composer / producer adoption.

## Pricing & Monetization

Floe itself is free with no sign-ups. Paid packages are sold through frozenplain.com (per the source), but the source does not state pricing structure.

## Competitive Landscape

Kontakt (paid, closed), Decent Sampler (free, closed), SFZ/sforzando (free, spec-only), and bespoke Lua audio engines. Floe's differentiator is open-source + cross-platform + a real Lua language for libraries.

## Risks & Open Questions

- Cross-platform audio plugin work is finicky; mitigation is to keep the host integration thin.
- Discovery for the open-source community packages; mitigation is to keep floe.audio/packages easy to submit to.
- Maintainer burn-out risk for a single-developer open-source project; mitigation is to grow a small maintainer team.
