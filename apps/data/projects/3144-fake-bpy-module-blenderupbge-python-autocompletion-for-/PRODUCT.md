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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Type-correct Python stub files for Blender's `bpy` API and UPBGE's `bge` API, generated from the official documentation and shipped on PyPI per Blender version plus a daily-rebuilt "latest" track. The deliverable is what every Python package gives an IDE: `pyi` files that make autocompletion, type checking, and "go to definition" just work for add-on developers writing in an external editor.

## Target Users

- Blender add-on developers who write in VSCode or any external Python IDE and want type hints on `bpy.*` calls.
- Add-on maintainers tracking specific Blender releases (the project ships per-version stubs from 2.78 to 5.2+) and want stubs pinned to the API they target.
- UPBGE game developers writing against `bge` who want the same IDE support for the UPBGE fork.
- Blender / UPBGE code reviewers who read add-on source outside Blender's text editor.

## Jobs To Be Done

- When I am writing a Blender add-on in VSCode, I want `bpy.types.Object` to autocomplete with the right fields, so I stop getting `AttributeError` at runtime on attributes the docs do not show.
- When I am maintaining an add-on that targets Blender 4.2 LTS, I want stubs pinned to that Blender version, so the IDE does not offer methods that do not exist on the version my users run.
- When the Blender main branch changes a type signature, I want the "latest" stubs to reflect it the next day, so my IDE stays in sync with what Blender is doing.
- When I write UPBGE game scripts, I want stubs for `bge.*` with the same level of fidelity as `bpy`, so my UPBGE code reads like typed Python, not guesswork.

## Success Metrics

- Per-Blender-version stub coverage: how much of the public `bpy` API has stubs in each released package. The source does not state a percentage target.
- Daily "latest" build freshness: time between a Blender source change and the `fake-bpy-module` (no-suffix) PyPI release reflecting it.
- PyPI download counts as a passive reach signal — a soft proxy for how many add-on developers have pulled the stubs into their IDE.

## Pricing & Monetization

The post does not state a price. The project is open-source, published to PyPI; the poster has maintained it for over 8 years without naming a monetization model. No pricing can be stated from the source.

## Competitive Landscape

The post does not name competing stub generators, competing IDE integrations, or competing PyPI packages. The poster explains the choice not to use `inspect` (it "often fails to handle edge cases in Blender's dynamic environment"), but does not name a specific tool that does compete with `fake-bpy-module`. Naming one would be invention.

## Risks & Open Questions

- Documentation drift. The stub generator parses Blender's official docs; if the docs lag the source, so do the stubs. The daily CI build is the mitigation, but it only catches "latest" — per-version stubs are snapshotted at release.
- Undocumented APIs. The poster calls this out explicitly: "some APIs are undocumented," and those do not get stubs from the parser. Each one is either a hand-written stub or a coverage gap; tracking which is which matters for add-on authors.
- `bpy_prop_collection` and similar are not usable as-is. The generator has to patch types during stub generation; if a new Blender release adds a class with similar dynamics, the patch list has to be updated before the stub can be strict-compatible.
- UPBGE parity. UPBGE is a separate fork with its own package and repo; whether UPBGE stays close enough to Blender for the parser to work on both, or whether UPBGE-specific patches are needed, is a question only the `fake-bge-module` repo will surface over time.
