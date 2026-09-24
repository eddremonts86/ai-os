# SPEC.md — Caffenol, a darkroom simulation photo editing toy

## Problem

Caffenol is a darkroom toy, built on film development and darkroom craft. You load a photo and develop it into a negative in a simulated tank. Then you print that negative under a timed enlarger exposure. You shape the light by hand with cut cards that you wave over the paper.<p>Under the hood, it&#x27;s a WebGPU-powered film and paper sim, with chaos from each run producing a unique, organic result. It&#x27;s built to encourage experimentation and there are few guardrails.<p>I built this because darkroom printing made me fall in love with editing photography in a way Lightroom or Capture One couldn&#x27;t. But it&#x27;s expensive, uses a lot of resources, and isn&#x27;t accessible. So, Caffenol brings the process and makes a few opinionated turns so it&#x27;s fun and enjoyable. Ultimately, I hope it helps people make cool art.<p>I&#x27;m tuning the film and paper sims with B&amp;W processes now, with color coming shortly (read: when the color process can be made as fun as B&amp;W is). No signups and everything is stored locally. If you find yourself wanting to learn more about how to bend and break it, the manual might help: <a href="https:&#x2F;&#x2F;caffenol.app&#x2F;manual&#x2F;" rel="nofollow">https:&#x2F;&#x2F;caffenol.app&#x2F;manual&#x2F;</a><p>Hope it can make a print worth saving.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49663827)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T19:16:26Z

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
