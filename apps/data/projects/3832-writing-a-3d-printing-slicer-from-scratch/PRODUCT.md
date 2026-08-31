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

## Value Proposition

From intuition to toolpaths. The poster wanted to prove his understanding of slicers by turning it into software that processes geometry into toolpath commands — and published the result. The value is twofold: a working from-scratch slicer, and a written explanation of how slicing actually works, aimed at anyone whose understanding is as intuitive as his was.

**One-liner:** A 3D printing slicer written from scratch to turn geometry into toolpath commands, with the writeup of how it works.

## Target Users

| Stakeholder | Why they care |
|---|---|
| The poster | Proving his intuitive understanding was actually implementable. |
| 3D printing hobbyists | Seeing what their slicer does between mesh and G-code. |
| Geometry-curious developers | A worked example of slicing and toolpath generation. |

The post describes a learning project, not a commercial audience.

## Jobs To Be Done

1. **Functional job** — Process 3D geometry into a series of toolpath commands.
2. **Functional job** — Test an intuitive understanding of slicers against a real implementation.
3. **Functional job** — Teach others how slicing works through the published writeup.

## Success Metrics

- **End-to-end slice:** a mesh enters, toolpath commands exit.
- **Correctness:** generated toolpaths are geometrically sane per layer (validation method unstated by the post).
- **Completeness of the writeup:** the explanation covers the geometry-to-toolpath path.
- **Printability:** whether real hardware accepts the output — untested in the capture, so a stretch goal.

## Pricing & Monetization

None stated. It is a personal learning project shared as a blog post; there is no product, price or monetization.

## Competitive Landscape

The post does not name competitors. The project sits in the category of 3D printing slicer software — Cura and PrusaSlicer-class tools as the familiar reference, plus the small set of from-scratch slicer experiments — where this one's place is explicitly educational: it exists to test and teach, not to compete.

## Risks & Open Questions

- [ ] Correctness is unverified: the capture gives no evidence the toolpaths print well on real hardware.
- [ ] Scope is unknown: the post says geometry to toolpath commands, not which features (supports, infill patterns, multi-material).
- [ ] Solo learning projects often stall after the interesting part — the writeup's completeness is the real deliverable.
- [ ] Geometry edge cases (non-manifold meshes, holes) are where slicers earn their complexity.
- [ ] No license, repo link or maintenance intent appears in the capture.
