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

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — applies to the floe.audio docs site and package registry. The audio plugin itself is C++ (with Lua scripting) and is not changed here.

## Architecture

Native audio plugin (C++ with CLAP/VST3/AU wrappers) plus a Lua scripting engine for sample-library behaviour. A TanStack Start + SQLite/Drizzle backend powers the floe.audio docs site and the community package registry. Coolify hosts the site behind Docker.

## Milestones

- M1 — Cross-platform Floe plugin on macOS, Linux and Windows.
- M2 — Lua-based sample-library language.
- M3 — Package install flow from inside Floe.
- M4 — Community package registry on floe.audio/packages.
- M5 — FrozenPlain store links and paid packages.

## Risks

- Per-DAW host bugs (logic, reaper, bitwig, ableton) drift over time; mitigation is to keep a regression matrix and ship per-host tests.
- Lua language scope creep; mitigation is to keep the API stable across minor versions.
- Single-developer risk; mitigation is to recruit at least one co-maintainer.
