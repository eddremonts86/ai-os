# SPEC.md — The Simpsons Hit and Run Revamped

## Problem

Hey folks, was browsing around for some videogame references and found a leaked Simpsons Hit n Run game source, so i took it and fixed some pretty bad issues with running the game on Windows 11 with a widescreen, including some broken audio stuff, memory leaks and security holes and forced letterbox video res.<p>Also added some experiments that works, but they clearly need some love: DXR (Global PathTracing) and OpenXR (as for now, VR needs DXR too). I plan to add mac and linux support, and maybe OpenXR with the &quot;original&quot; renderer<p>Added a Release build for putting along the original videogame files (not included) in your pc, without compiling it by yourself, but you can do it anyway. Hope you folks enjoy it!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49545945)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T04:30:54Z

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
