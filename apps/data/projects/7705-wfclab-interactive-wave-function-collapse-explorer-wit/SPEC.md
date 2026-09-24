# SPEC.md — WFCLab – Interactive Wave Function Collapse Explorer (With Source)

## Problem

Author here. WFCLab is a desktop app I built in Godot 4 for experimenting with
example-based procedural generation, specifically wave function collapse.<p>The workflow is: load a source image, decompose it into tiles and constraints, review the
resulting tile set and constraints and make a limited set of changes, then run synthesis to generate new layouts that follow the same local rules without copying the original.<p>Some context on why I built it this way:<p>Most WFC implementations I found were either libraries you call from code or one-shot scripts that take an image and print an output. I wanted something where the intermediate steps were visible, so I could examine them and mess around with them. Thus, when synthesis fails or produces garbage, you can go looking for the cause and mess around with the settings until you figure it out, and can better track down the source instead of leaving it hidden away inside a huge function. So WFCLab exposes each stage as a separate view you can inspect and tweak.<p>Current state: the full pipeline works end to end, and there are sample images and saved projects in the repo so you can try it without your own art. It is very much a work in progress. The UI is functional rather than polished, and I have not tested it on a wide range of source images.<p>Known limitations:
- Performance drops on large output sizes, especially with backtracking enabled
- Constraint editing is list-based, not a visual graph editor yet
- Only 4-way and 8-way adjacency, no custom direction sets
- No built in image editing at all.
- Can&#x27;t actually export output images yet.<p>Is anyone interested in this? Should I dedicate additional effort to developing it, or focus my efforts elsewhere? If you have used WFC before, what would you want to be able to control or inspect that this does not expose?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49744376)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T18:03:54Z

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
