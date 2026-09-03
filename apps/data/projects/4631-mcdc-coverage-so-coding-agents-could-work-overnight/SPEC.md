# SPEC.md — MC/DC coverage so coding agents could work overnight

## Problem

Hello HN!<p>Code just became cheaper with AI but review and verification is as hard as it was. Tests are great, but current AI slop needs much more exhaustive testing.<p>I built a test coverage tool for coding agents so they could work in a loop and keep writing tests where it makes sense.<p>Here’s Supercov:<p>- Wraps any JavaScript&#x2F;TypeScript&#x2F;Rust test suite (npx supercov -- npm test)<p>- Provides deepest MC&#x2F;DC code coverage with max perf (written in Rust)<p>- Free and open source<p>Easiest way is just to give your agent a prompt: Measure coverage with npx supercov and write one test.<p>Goal is building the deepest code coverage suite for coding agents thats works automagically in any language and any test suite. I feel code verification is the missing piece for software factories to actually work.<p>I’d particularly be interested in feedback on compatibility and if your agent ran into any problems.<p>Contributions and bug reports are very welcome: <a href="https:&#x2F;&#x2F;github.com&#x2F;supercorp-ai&#x2F;supercov" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;supercorp-ai&#x2F;supercov</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49534948)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T11:55:46Z

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
