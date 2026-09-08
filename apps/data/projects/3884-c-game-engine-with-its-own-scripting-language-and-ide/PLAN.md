---
id: "3884"
slug: c-game-engine-with-its-own-scripting-language-and-ide
title: "C# Game Engine with its own scripting language and IDE"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497922"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: ["C# engine core", MonoGame backend, Custom scripting language Exp, Integrated IDE, Cross-platform export, "2D engine"]
---
# C# Game Engine with its own scripting language and IDE

## Tech Stack

- **C# engine core:** the engine and IDE implementation language.
- **MonoGame backend:** graphics and audio, enabling desktop, mobile and console export.
- **Custom scripting language Exp:** the language games are written in inside the engine.
- **Integrated IDE:** written in C#, used to edit and run games.
- **Cross-platform export:** MonoGame targets cover desktop, mobile and consoles.
- **2D engine:** the scope — simple 2D games, per the README.

## Architecture

- **Engine core:** 2D runtime written in C#.
- **Backend layer:** MonoGame supplies graphics and audio and the platform targets.
- **Language layer:** the Exp interpreter executes game scripts.
- **IDE layer:** the integrated editor, built in C#, drives the edit-run loop.
- **Export layer:** packaging to desktop, mobile and consoles; web via KNI-engine is planned.

## Milestones

1. **M0 — Buildable source.** Engine, IDE and Exp language build from the repository.

2. **M1 — Edit-run loop.** A sample game runs from Exp code edited in the IDE.

3. **M2 — Exports.** MonoGame packaging verified on desktop, mobile and console targets.

4. **M3 — Contributor loop.** Docs and issues welcome new contributors; first external PRs land.

## Risks

- **Single-author bottleneck:** the author has very little time; the project stalls without contributors.
- **Legacy IDE code:** the three-year-old IDE is acknowledged as written at a different skill level.
- **Custom language burden:** Exp needs documentation, debugging and tooling to be approachable.
- **Web export gap:** until KNI-engine lands, the engine misses the platform many hobbyists target first.
