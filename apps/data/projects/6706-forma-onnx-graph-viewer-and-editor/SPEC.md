# SPEC.md — Forma ONNX Graph Viewer and Editor

## Problem

Hey all!<p>Most ONNX tooling stops at just &quot;looking&quot;. For those of you who know about Netron, it allows you to read the graph but the moment you want to change something you&#x27;re back in Python either using onnx-modifier or onnx.helper scripts. I wanted to click a node, change an attribute or rewire a connection and actually know whether the model still runs, within a web-page.<p>This is exactly what Forma is! Simply drop an .onnx or .tflite file on the page and a full graph renders. From there you can do multiple different things (for more info have a look at the README in repo)<p>MIT Licensed repo<p>Live web-app: <a href="https:&#x2F;&#x2F;forma-ml.vercel.app" rel="nofollow">https:&#x2F;&#x2F;forma-ml.vercel.app</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49680437)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T05:49:46Z

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
