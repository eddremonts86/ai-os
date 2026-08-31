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

## Problem

The poster had an intuitive understanding of how 3D printing slicers work and decided to challenge it: take that understanding and turn it into something that "can actually process geometry into a series of toolpath commands". The result is a slicer written from scratch, published as a blog post on akintokinematics.com. The capture is a learning artifact shared as Show HN, not a commercial slicer announcement.

## Objective

A from-scratch slicer that reads 3D geometry and emits a series of toolpath commands — the poster's stated test of whether his intuitive understanding was real — published as a writeup others can learn from.

## Target Users

- The poster himself — the stated motivation is a personal challenge.
- 3D printing hobbyists curious about what slicers actually do.
- Developers learning computational geometry and G-code generation.

## MVP Scope

- Read input geometry (a mesh or STL-class file).
- Slice the geometry into layers.
- Generate toolpath commands (perimeters, infill) per layer.
- Output a series of toolpath commands, with the writeup as the deliverable.

## Constraints

- The capture describes the goal, not the implementation; no language, format or feature list is given.
- It is a personal learning project — not validated against real printers in the capture.
- The deliverable is the blog post plus working code; there is no product or pricing.

## Design Direction

See `DESIGN.md` for this project's design tokens.
