---
id: "4495"
slug: directxsplat-d3d12-gaussian-splat-renderer-up-to-24-gsp
title: "DirectXSplat – D3D12 Gaussian splat renderer, up to 2.4× gsplat FPS"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49532043"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# DirectXSplat – D3D12 Gaussian splat renderer, up to 2.4× gsplat FPS

## Problem

Hi all,Over the past few months, I've been working on and off on DirectXSplat, a C++/Direct3D 12 library for rendering 3D Gaussian Splats. It can load PLY, SPZ, .splat, SOG, and lod-meta.json scenes and render them from a host D3D12 application.Features:- GPU-accelerated D3D12 rasterization- Up to 2.4x the FPS of gsplat in matched-quality, resident-scene benchmarks on an NVIDIA GeForce RTX 4070 SUPER- Native embeddable D3D12 renderer with a host-owned device, queue, command list, fences, and render targets- Compact packed GPU scene buffers, persistent uploaded scenes, and reusable renderer resources- No CUDA dependency for DirectXSplat rendering- Support for trained 3DGS scenes in PLY, SPZ, .splat, and SOG formats, plus lod-meta.json scene manifests- Whole-scene updates and uploaded scene/chunk mutation- GPU resource interop for external work that references renderer-owned resources- Optional approximate splat-depth output- Convenience APIs including an interactive viewer through Show(...) and offscreen image capture through Draw(...)Some of the performance work includes an adapted GPU OneSweep radix sort, GPU-side culling and compaction, and indirect dispatch and draw arguments based on the surviving splats. Scene data is stored in compact packed GPU buffers. Uploaded scenes and renderer-owned resources persist and are reused between frames. Large scenes are internally partitioned into chunks and support hierarchy-based visibility, screen-space LOD selection, configurable splat and residency budgets, and residency caching.The project is MIT licensed and completely open source.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
