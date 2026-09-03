# SPEC.md — DirectXSplat – D3D12 Gaussian splat renderer, up to 2.4× gsplat FPS

## Problem

Hi all,<p>Over the past few months, I&#x27;ve been working on and off on DirectXSplat, a C++&#x2F;Direct3D 12 library for rendering 3D Gaussian Splats. It can load PLY, SPZ, .splat, SOG, and lod-meta.json scenes and render them from a host D3D12 application.<p>Features:<p>- GPU-accelerated D3D12 rasterization<p>- Up to 2.4x the FPS of gsplat in matched-quality, resident-scene benchmarks on an NVIDIA GeForce RTX 4070 SUPER<p>- Native embeddable D3D12 renderer with a host-owned device, queue, command list, fences, and render targets<p>- Compact packed GPU scene buffers, persistent uploaded scenes, and reusable renderer resources<p>- No CUDA dependency for DirectXSplat rendering<p>- Support for trained 3DGS scenes in PLY, SPZ, .splat, and SOG formats, plus lod-meta.json scene manifests<p>- Whole-scene updates and uploaded scene&#x2F;chunk mutation<p>- GPU resource interop for external work that references renderer-owned resources<p>- Optional approximate splat-depth output<p>- Convenience APIs including an interactive viewer through Show(...) and offscreen image capture through Draw(...)<p>Some of the performance work includes an adapted GPU OneSweep radix sort, GPU-side culling and compaction, and indirect dispatch and draw arguments based on the surviving splats. Scene data is stored in compact packed GPU buffers. Uploaded scenes and renderer-owned resources persist and are reused between frames. Large scenes are internally partitioned into chunks and support hierarchy-based visibility, screen-space LOD selection, configurable splat and residency budgets, and residency caching.<p>The project is MIT licensed and completely open source.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49532043)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T05:19:39Z

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
