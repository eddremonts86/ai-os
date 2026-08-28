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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3144-fake-bpy-module-blenderupbge-python-autocompletion-for-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pin the documentation parser to the Blender Python API reference source the project currently scrapes.
- [ ] Audit the patch list for dynamic-collection-style types (`bpy_prop_collection` and any newer equivalents in 5.x).
- [ ] Regenerate per-version stub packages for each supported Blender version and confirm `pip install fake-bpy-module-5.2` (and similar) produces a working `pyi` set.
- [ ] Verify the daily CI build against Blender main produces a `fake-bpy-module` (no-suffix) PyPI release within one CI cycle of a source change.
- [ ] Confirm `fake-bge-module` parses UPBGE's `bge` documentation and publishes its own PyPI package.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
