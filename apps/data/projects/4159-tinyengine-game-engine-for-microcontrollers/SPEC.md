# SPEC.md — TinyEngine – Game Engine for Microcontrollers

## Problem

TinyEngine - A game engine to turn your ESP32&#x2F;Arduino into a mini retro game console! This project came to be because I wanted an easy way to make games on an Arduino without reflashing the microcontroller or going through the whole Arduino IDE process. At first I used a Python Engine and realised that was not going to be feasible (2KB SRAM on Arduino is a pain) and no OS, so I decided to make my own lightweight virtual machine with an interpreter that is just dedicated to reading games from an external removable storage device on the fly!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49511757)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T16:39:32Z

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
