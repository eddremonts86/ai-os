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

## Problem

Blender does not expose its Python API (`bpy`) as standard Python files outside its built-in text editor. That makes add-on development in external IDEs like VSCode a constant fight with missing type hints and no autocompletion — the developer writes against an API the IDE cannot see.

`fake-bpy-module` solves this by parsing Blender's official Python API documentation and emitting `.pyi` stub files for it. The poster is explicit about why they did not just use `inspect`: it "often fails to handle edge cases in Blender's dynamic environment." The parser-instead-of-intersect choice has its own costs — some APIs are undocumented, and others (the poster names `bpy_prop_collection`) cannot be used as-is — so the generator transforms and patches types during stub generation to keep the stubs strict-compatible.

The poster has maintained the project for over 8 years, tracking Blender from version 2.78 to 5.2+. The stubs ship on PyPI (per-version, e.g. `pip install fake-bpy-module-5.2`, plus `fake-bpy-module` for the latest from the daily build). The poster runs a custom CI/CD system that builds the Blender binary daily from latest source, so the "latest" stub track stays current with Blender's active development.

## Objective

Make Blender (and UPBGE) Python add-on development in external IDEs work the way Python development normally does: type hints, autocompletion, "go to definition" on `bpy` and `bge` symbols, with the same level of IDE support any other Python package has. Stubs are published per Blender version on PyPI and a daily "latest" track is rebuilt from the Blender source.

## Target Users

- Blender add-on developers who write in VSCode (or PyCharm, or any external editor) and want autocompletion and type checking against `bpy`.
- Blender power users on older releases (the project tracks back to 2.78) whose tooling has not kept up.
- UPBGE game developers who write against `bge` and need the same IDE support for the UPBGE fork.
- Blender core / extension reviewers who need to read add-on code in an external editor and want type-correct symbols.

## MVP Scope

- A `.pyi` stub generator that parses Blender's official Python API documentation and emits type-correct stub files.
- An internal transform/patch pass that fixes the kinds of API the raw docs cannot represent as-is (e.g. `bpy_prop_collection`).
- Per-Blender-version stub packages on PyPI (e.g. `fake-bpy-module-5.2`), plus a `fake-bpy-module` package rebuilt daily against the Blender source tree.
- A `fake-bge-module` sub-project with the same shape for UPBGE's `bge` API, with its own PyPI release and GitHub repo (`github.com/nutti/fake-bge-module`).
- A daily CI/CD pipeline that builds the Blender binary from source and regenerates the "latest" stubs against it.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Coverage vs. fidelity. The stub generator depends on Blender's docs being parseable. APIs that are undocumented in the official docs do not get stubs from the parser alone; they have to be added by hand or skipped.
- "Standard Python files" is the bar. The poster's framing is that the IDE should see `bpy` the same way it sees any other typed Python package; the constraint is that the stubs must be PEP 484-compliant `.pyi` files, not runtime shims.
- Daily CI is the source of truth for the "latest" track. Per-version stubs can be hand-checked at release time; the `fake-bpy-module` (no version suffix) package cannot, so the daily build has to be the canonical signal.
- UPBGE is a separate fork, not a flag. UPBGE's API has its own package and its own GitHub repo (`fake-bge-module`); it is not a variant of `fake-bpy-module`.
