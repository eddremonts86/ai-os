# SPEC.md — Sandboxed HTML in Markdown (With Doom, Sort Of)

## Problem

We made markdown HTML code fences runnable in an isolated sand-box, with access to popular JS libraries for data viz and 3d graphics including D3, Mermaid and Three.js.<p>Design docs are how we communicate ideas with other people, and increasingly with agents. We got used to code blocks and embedded images, but agents can do amazing things when their canvas is HTML. Interactive visualizations make ideas more persuasive, and help you converge with an agent on what to build before you build it.<p>Just to see what was possible, we told Fable to make a one-off DOOM inspired raycaster, and it did everything from sprites, textures and audio, with no external assets. Maybe you don&#x27;t need a first person shooter in your next design review, but think charts, graphs, and interactive mocks.<p>Other neat concepts:<p>Black hole: <a href="https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;gargantua" rel="nofollow">https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;gargantua</a><p>Earthquake data viz: <a href="https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;ring-of-fire" rel="nofollow">https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;ring-of-fire</a><p>Flappy Bird: <a href="https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;flappy-bird" rel="nofollow">https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;flappy-bird</a><p>Also, real DOOM, because why not: <a href="https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;doom-for-real" rel="nofollow">https:&#x2F;&#x2F;strata.space&#x2F;@strataspace&#x2F;doom-for-real</a><p>Docs for the feature and the agent tools:<p><a href="https:&#x2F;&#x2F;strata.space&#x2F;documentation#interactive-html" rel="nofollow">https:&#x2F;&#x2F;strata.space&#x2F;documentation#interactive-html</a><p><a href="https:&#x2F;&#x2F;strata.space&#x2F;documentation&#x2F;mcp" rel="nofollow">https:&#x2F;&#x2F;strata.space&#x2F;documentation&#x2F;mcp</a><p><a href="https:&#x2F;&#x2F;strata.space&#x2F;documentation&#x2F;cli" rel="nofollow">https:&#x2F;&#x2F;strata.space&#x2F;documentation&#x2F;cli</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49536900)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T14:33:23Z

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
