---
id: "3832"
slug: writing-a-3d-printing-slicer-from-scratch
title: Writing a 3D Printing Slicer from Scratch
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493217"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Mesh geometry processing, layer intersection algorithm, toolpath and G-code generation, computational geometry math, print settings defaults, blog-published writeup]
---
# Writing a 3D Printing Slicer from Scratch

## Phase 0: Scaffold

- [x] Read the Show HN post to capture the stated goal (geometry into toolpath commands as a self-challenge)
- [x] Write SPEC.md (this document)
- [x] Set up the geometry pipeline: load a mesh format and validate it
- [x] Implement layer slicing into per-layer polygons

## Phase 1: Core

- [ ] Generate perimeter toolpaths from layer polygons
- [ ] Add infill generation per layer
- [ ] Emit the toolpath commands in a standard G-code-like format
- [ ] Handle geometry edge cases: non-manifold meshes and holes
- [ ] Write the blog post explaining each stage of the pipeline

## Phase 2: Deploy

- [ ] Try the output on a real printer if available and record the results
- [ ] Publish the writeup and invite corrections from the HN audience
- [ ] Decide whether to open the code beyond the blog post

---

_Generated automatically by Lúa on 2026-08-30_
