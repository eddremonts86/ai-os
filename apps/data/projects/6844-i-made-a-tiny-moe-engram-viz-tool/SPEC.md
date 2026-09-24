# SPEC.md — I made a tiny MoE/Engram viz tool

## Problem

As part of a ML study group I&#x27;ve been building tools to experiment with ML concepts.  I use AI Coding agents to develop software, mostly cloud-based but I keep trying local LLMs on 12G, 16G, and 24G VRAM GPUs.  Freetoken has made it possible to run larger MoE models on smaller GPUs.<p>This inspired me to use my ML tools to build a tiny MoE model from scratch so I can experiment with different agent optimizations and things like Engram, recursive models, hierarchical modeles, KV Cache compression etc.<p>My link above shows results of building different tiny models, one dense, the rest MoE variants.  There is a lot of code and tooling behind this.<p>Goals: 
- build tiny MoE models that run in a browser to give interactive help (today I use deterministic matchers to respond to user queries; still researching how to improve this with better trained MoE models).
- build tiny MoE models that run on small ARM and RISC-V development boards, possibly using NPUs (using no_std Rust).<p>My tools are an alternative to Python, ML libraries, Jupyter notebooks, and Google Colab.<p>My approach is a REPL and&#x2F;or AOT Compilable array-programming DSL written in Rust.  This language has ML concepts as first class language elements and built in visualization primitives.<p>It runs in a browser via WASM.  It runs at the CLI on both Apple and Linux (supporting Apple GPU and NVIDIA GPU libraries, Ollama-based REPL context-senstive help).  It is extensible via dyamic plug-in Rust libraries.<p>I have created many demo repos showing how to use this ML array language for ML tasks, learning Math concepts, general purpose programming.  You can build desktop apps, (Ruby on Rails inspired) CRUD apps.  So you can create ML experiments and visualize data in the browser or on the desktop.<p>It also supports Emacs org-mode for literate programming.<p>This tiny MOE Microscope is just my latest demo of this approach.  I hope it helps someone learn more about MoE experts, routing, Engram, etc.  It helped me learn more.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49690947)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T01:59:28Z

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
