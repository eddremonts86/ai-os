# SPEC.md — I ported COLMAP (photogrammetry) to the browser in WASM and WebGPU

## Problem

Hi,<p>I’m launching the COLMAP browser workspace today!<p>offlinetools.io&#x2F;colmap<p>It’s a free and fully local browser implementation of the popular open-source photogrammetry software COLMAP.<p>No download, no sign-up, no installation, no setup, no cloud processing — everything happens and stays on the user’s machine.<p>More info:
offlinetools.io&#x2F;colmap-landing<p>Why is it relevant?
Bringing COLMAP to the browser is technically challenging because of the browser’s additional constraints.<p>This is the first implementation that reaches native-class performance and, in some cases, even outperforms the native build.<p>It produces standard COLMAP-compatible outputs such as camera poses, sparse point clouds, keypoints and masks for downstream workflows including Gaussian Splatting.<p>The local nature of this tool makes it ideal for data-sensitive verticals such as police, medical, law enforcement, insurance, or simply users who want the tool but don&#x27;t want to bother with installs and cloud.<p>About me:
I’m a former Google engineer with around 20 years of experience in 3D computer vision.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49715142)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T16:40:47Z

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
