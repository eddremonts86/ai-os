---
id: "4159"
slug: tinyengine-game-engine-for-microcontrollers
title: TinyEngine – Game Engine for Microcontrollers
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511757"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# TinyEngine – Game Engine for Microcontrollers

## Problem

TinyEngine is a game engine to turn an ESP32/Arduino into a mini retro game console. The author wanted an easy way to make games on an Arduino without reflashing the microcontroller or going through the whole Arduino IDE process. An early Python engine attempt failed because Arduino only has 2KB of SRAM and no OS. TinyEngine is a lightweight virtual machine with an interpreter dedicated to reading games from external removable storage on the fly.


---

## Objective

Let a hobbyist or educator author and deploy small retro-style games on ESP32/Arduino hardware without re-flashing the device or installing the Arduino IDE. The engine ships as a once-flashed VM that loads games from an SD card or similar removable storage at runtime.


## Target Users

Hobbyists and educators who want to author or play small games on cheap microcontrollers (ESP32, Arduino) without using the Arduino IDE or reflashing the board each time. Assumes comfort with microcontrollers but not with full game-engine toolchains.


## MVP Scope

- A small VM/runtime that fits in 2KB of SRAM and runs on no-OS microcontrollers.
- A bytecode interpreter that streams game logic from removable storage (e.g. SD card) rather than loading the whole game into flash.
- A simple authoring path so games can be developed without the Arduino IDE.
- At least one playable retro-style game shipped on the device.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Strict memory budget: 2KB SRAM on Arduino is the binding constraint that ruled out the earlier Python engine.
- No operating system available — the VM must run bare-metal.
- Tools target cheap microcontrollers; cannot assume modern build pipelines.
- Source post does not state pricing, monetisation, or distribution terms.

