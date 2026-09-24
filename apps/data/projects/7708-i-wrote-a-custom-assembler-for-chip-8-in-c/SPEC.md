# SPEC.md — I wrote a custom assembler for CHIP-8 in C++

## Problem

I&#x27;m writing a custom assembler for CHIP-8 and just finished adding support for the DB&#x2F;.byte directive so I can embed sprites in the ROM and finally get something drawn on the screen. It SHOULD support all OG CHIP-8 instructions, but still a ton of rough edges that I&#x27;m ironing out.<p>This is my first ever C++ project, just like the CHIP-8 emulator was my first ever C (and emudev) project. It&#x27;s so satisfying to write assembly and have your program spit out a ROM that actually runs in the emulator you wrote.<p>All code is written by me (a lot of it livestreaming) as evident by the quality, no AI.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49744174)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T17:47:40Z

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
