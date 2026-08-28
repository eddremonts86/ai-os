---
id: "3144"
slug: fake-bpy-module-blenderupbge-python-autocompletion-for-
title: fake-bpy-module – Blender/UPBGE Python autocompletion for external IDEs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448299"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# fake-bpy-module – Blender/UPBGE Python autocompletion for external IDEs

## Tech Stack

- A documentation parser that reads Blender's official Python API reference and emits `.pyi` stub files. The post does not name the parser library, but the choice (parser over `inspect`) is load-bearing.
- A patch / transform pass in the generator that fixes types the raw docs cannot represent as-is (the poster names `bpy_prop_collection`).
- PyPI distribution: per-Blender-version packages (e.g. `fake-bpy-module-5.2`) and a `fake-bpy-module` (no-suffix) package rebuilt daily.
- A custom CI/CD pipeline that builds Blender from source daily and regenerates the "latest" stubs against it.
- A separate `fake-bge-module` repo + PyPI package for UPBGE's `bge` API.

## Architecture

Parser → patch pass → `.pyi` files → PyPI artifact. The architecture is a one-way pipeline: the parser reads the Blender Python API documentation, the patch pass rewrites types the parser cannot represent cleanly, and the result is shipped as a typed-stubs Python package consumable by any Python IDE. The daily CI build is a separate path that pins the parser to "latest Blender source" and publishes the no-suffix package.

The `fake-bge-module` sub-project is structurally the same pipeline applied to UPBGE's `bge` API documentation; it lives in a separate repo because UPBGE is a separate fork with its own release cadence, not a flag on `fake-bpy-module`.

## Milestones

- Maintain the per-Blender-version stub packages from 2.78 through 5.2+ (the poster is already 8 years into this).
- Keep the daily CI build green so the `fake-bpy-module` (no-suffix) PyPI release stays in sync with Blender main.
- Extend the patch list as new dynamic-collection-style types appear in Blender releases.
- Maintain `fake-bge-module` as a sibling project with the same parser → patch → publish shape for UPBGE.

## Risks

- Documentation quality drives coverage. If Blender's docs lag the source or omit APIs, stubs lag with them; the only mitigation is the daily CI build on the "latest" track.
- Dynamic-collection types (e.g. `bpy_prop_collection`) need hand-patched translations. Any new class with similar semantics in a future Blender release needs a new patch entry, or the generated stub will be wrong.
- Per-version stubs are snapshots. A bug fix in the patch pass only ships to versions cut after the fix; older versions stay broken until someone hand-patches them or re-runs the generator against an older doc snapshot.
- UPBGE drift. UPBGE may diverge from Blender in ways the parser does not anticipate; the `fake-bge-module` repo has to absorb that drift, not `fake-bpy-module`.
