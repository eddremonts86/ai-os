---
id: "2215"
slug: brep-geometric-cad-kernel-and-parametric-code-cad
title: BRep Geometric CAD Kernel and Parametric Code CAD
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49362673"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# BRep Geometric CAD Kernel and Parametric Code CAD

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I'm pretty excited to show off something I've been working on for the past few months. A free, open-source geometric kernel that allows humans/LLMs to write code (in this case, a DSL called Firmament) and generate 3D models of CAD parts, to finally provide an alternative to OpenCascade.To get some questions out of the way.
- Full STEP import/export support for AP242, AP203 and AP214 are still experimental at the time, but everything produced by Aetheris should open in any CAD app with STEP support.
- Support for single edge/planar fillets/chamfers right now, should be more than sufficient for most CNC/3D printing use cases.
 - Fillets: https://github.com/yuechen-li-dev/Aetheris/blob/master/testd...
 - Chamfers: https://github.com/yuechen-li-dev/Aetheris/blob/master/testd...
- Supports dimensional/GD&T annotation via STEP 242's semantic PMI.
- Kernel is written entirely in C#, with bindings for Go, Rust, Python, and TypeScript available.If you just want to vibe-CAD, clone the repo, run it locally and ask Codex/Claude to build a part for you using Aetheris with the Firmament DSL. You can check the results in Fusion 360/FreeCAD or any other package you use. For features that are not implemented, GPT 5.6 Codex and Claude 5 usually can implement their own algorithms fairly easily via the KernelSDK.Otherwise, you can go through the Firmament language fixtures and try building some of the samples via the CLI. A VSCode extension and browser viewer is included for convenience.https://github.com/yuechen-li-dev/Aetheris/tree/master/fixtu...Happy to answer any technical questions and talk about the architecture. Please report any weird bugs you find though.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49362673) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
