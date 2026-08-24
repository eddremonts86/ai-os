---
id: "2399"
slug: why-can-ai-generate-super-mario-but-not-a-wedge-ramp-fo
title: Why can AI generate Super Mario but not a wedge ramp for my robot vacuum?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49405520"
category: ask-hn
date: "2026-08-23"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Why can AI generate Super Mario but not a wedge ramp for my robot vacuum?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I've been puzzled by something: AI generation can produce an elaborate
 figurine, a cartoon character, even a convincing Super Mario — yet it
 can't reliably make a simple wedge ramp so my robot vacuum can climb a
 step. For context: I bought a Bambu P2S but can't model. I tried the "describe
 it and get a model" AIs — the output is unusable, you can't adjust it,
 it's never quite what I meant. I tried having an agent write Python to
 build geometry directly — it tops out at simple primitives.

 What finally worked: geometric decomposition. I break a complex part into
 ordered, grouped steps, describe each as a small spec, and let an agent
 execute them in Blender (via blender-mcp). That process turned out to
 abstract into a small engine — the key insight being it converts the 3D
 spatial reasoning LLMs are bad at, into the structured code they're good
 at. I wrote it up here: https://github.com/zhuchaokn/spec-3d-model

 My questions:
 - Why is "functional part" generation so much weaker than
 "figurine/aesthetic" generation? Is it data (no parametrized-CAD training
 sets), representation (mesh vs B-rep), or evaluation (nobody benchmarks
 "does it print / is it watertight")?
 - Is "turn 3D modeling into code for an LLM" the right framing, or am I
 missing something better?

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49405520) · **Category:** ask-hn · **Tags:** Ask HN,Problem
