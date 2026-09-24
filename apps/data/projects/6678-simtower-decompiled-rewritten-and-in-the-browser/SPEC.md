# SPEC.md — SimTower, Decompiled, Rewritten, and in the Browser

## Problem

I wanted to re-play SimTower but found it too difficult to get running through emulation. Instead, I worked for 6 months with Claude Code on a complete rewrite, replicating all the functionality from a Ghidra decompilation of the binary, an AI-generated summary of the original source code and my memory of the gameplay. Then deployed it to the web as WASM.<p>I wanted the original feel of the game, so didn&#x27;t create new art. Instead, you load an original binary you provide, and the on-page code parses it and pulls out the original assets.<p>I didn&#x27;t look at a single line of code Claude wrote, but spent hours playing through the game and nitpicking every little behavior. A lot of time was spent convincing myself that the elevators just ARE that hard to get right &gt;.&lt;<p>I hope everyone can enjoy this game again. Did a writeup here: <a href="https:&#x2F;&#x2F;www.wyldcard.io&#x2F;blog&#x2F;simtower-remake-playable-in-browser&#x2F;" rel="nofollow">https:&#x2F;&#x2F;www.wyldcard.io&#x2F;blog&#x2F;simtower-remake-playable-in-bro...</a><p>source: <a href="https:&#x2F;&#x2F;github.com&#x2F;Jonahss&#x2F;concilia-tower" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;Jonahss&#x2F;concilia-tower</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49676394)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-12T19:40:21Z

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
