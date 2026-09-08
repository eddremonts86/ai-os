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

## Problem

The author (Sam of FrozenPlain) makes sample libraries that run inside Floe, an audio plugin for Linux, macOS and Windows. Floe targets musicians, composers and producers — typically people working on film/TV/game scoring or ambient music. Sam open-sourced Floe because he wants to open the door for a wider audience than just his own libraries. Floe is free, no sign-ups, and uses a Lua-based sample-library language. Users install free packages from floe.audio/packages or from frozenplain.com, then load them inside the Floe plugin.


---

## Objective

Ship an open-source audio plugin (CLAP/VST3/AU) that plays sample libraries across macOS, Linux and Windows, free to use, with a Lua-based sample-library language so third parties can author their own libraries.


## Target Users

Musicians, composers and producers working on film/TV/game scoring or ambient music; developers who want to author their own sample libraries via the Lua-based language. Assumes the user already has a DAW.


## MVP Scope

- Cross-platform audio plugin (CLAP/VST3/AU) for Linux, macOS and Windows.
- Install and play sample-library packages from floe.audio/packages or frozenplain.com.
- Lua-based sample-library language so anyone can build their own library.
- Free to use, no sign-ups.
- Distribution and docs at floe.audio and the frozenplain.com store.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Distribution assumes the user already has a DAW that supports CLAP/VST3/AU.
- Source does not state pricing for paid packages or for the FrozenPlain store.
- Cross-platform audio plugin work is expensive; mitigation is the Lua-based language to keep authoring cheap.
- Package discovery is split between floe.audio/packages and frozenplain.com — keep that straight in the docs.

