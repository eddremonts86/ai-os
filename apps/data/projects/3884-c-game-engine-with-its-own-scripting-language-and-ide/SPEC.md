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

## Problem

The capture is a URL-only Show HN post linking to the ArcadeMaker repository; the product claim is the title — a C# game engine with its own scripting language and IDE — and the repository README carries the detail. ArcadeMaker is a simple 2D cross-platform game engine that includes its own programming language (the prototype is called Exp) and an integrated IDE. The engine and the IDE are written in C#, but the language used inside ArcadeMaker to program games is the author's custom language, not C#. Graphics and audio are powered by MonoGame, which allows exporting to desktop, mobile and consoles, and a KNI-engine implementation is planned to add web support. The project is not finished: the author has very little time for it and open-sourced it hoping others find it interesting and help turn it into something real. ArcadeMaker is based on GameMaker 8, so anyone who used that will find it easy to learn; the IDE was written about three years ago, at a very different point in the author's programming journey.

## Objective

Open-source ArcadeMaker and make it real: a 2D cross-platform engine where games are programmed in the custom Exp language inside the integrated IDE, exported through MonoGame to desktop, mobile and consoles, with web export planned. The MVP is the current engine, language and IDE made buildable and learnable by contributors, since the author alone lacks the time.

## Target Users

- Hobbyist game developers who remember GameMaker 8 and want a similar, modern 2D tool.
- C# developers curious about engine internals and language design (the engine and IDE are C#, the game language is custom).
- Contributors willing to help an unfinished open-source engine reach a real state.

## MVP Scope

- 2D engine core with MonoGame as the graphics and audio backend.
- The Exp scripting language as the way games are programmed inside the engine.
- Integrated IDE, written in C#, for editing and running games.
- Cross-platform export to desktop, mobile and consoles via MonoGame; web support (KNI-engine) planned.

## Constraints

- Unfinished by the author's own statement; the codebase was written in stages over years and the IDE predates the author's current skill level.
- The language inside the engine is Exp, not C# — contributors must learn the custom language.
- Web export is a plan (KNI-engine), not a working feature.
- The capture is a title plus repository; everything else comes from the README.

## Design Direction

See `DESIGN.md` for this project's design tokens.
