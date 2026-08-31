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

## Tech Stack

Chosen for a geometry-to-toolpath pipeline written from first principles.

- **Mesh geometry processing:** load and normalize input meshes.
- **Layer intersection algorithm:** slice the mesh into horizontal layers.
- **Toolpath and G-code generation:** perimeters and infill as machine commands.
- **Computational geometry math:** polygon offsetting and path planning.
- **Print settings defaults:** layer height and speed knobs a slicer needs.
- **Blog-published writeup:** the explanation accompanying the code.

## Architecture

- **Geometry loader:** reads the input mesh.
- **Slicer:** intersects the mesh with layer planes, producing polygons per layer.
- **Path planner:** converts per-layer polygons into toolpaths (perimeters, infill).
- **Command emitter:** writes the toolpath commands out.
- **Writeup:** the blog post explaining each stage.

## Milestones

1. **M0 — Geometry in.** Parse a mesh and validate it.
2. **M1 — Layers.** Slice the mesh into layer polygons.
3. **M2 — Toolpaths.** Perimeters and infill per layer, emitted as commands.
4. **M3 — The writeup.** Publish the full explanation of the geometry-to-toolpath journey.

## Risks

- **Printability unknown:** no evidence the output works on a real printer.
- **Feature scope unstated:** which slicer features are included is unknown from the capture.
- **Geometry edge cases:** non-manifold meshes break naive slicing.
- **Motivation risk:** personal challenge projects can end at the first working demo.
- **No distribution path:** the capture names a blog post, not a repo or releases.
