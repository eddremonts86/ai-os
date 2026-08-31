---
id: "3884"
slug: "c-game-engine-with-its-own-scripting-language-and-ide"
title: "C# Game Engine with its own scripting language and IDE"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497922"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [C# engine core, MonoGame backend, Custom scripting language Exp, Integrated IDE, Cross-platform export, 2D engine]
---
# C# Game Engine with its own scripting language and IDE

## Value Proposition

A GameMaker-8-flavored 2D engine for the modern stack: games are programmed in the author's own scripting language, Exp, inside an integrated IDE, and exported through MonoGame to desktop, mobile and consoles. The engine and IDE are C# under the hood, so C# developers can read and extend them. Unfinished and open-sourced deliberately — the author wants contributors to help make it real.

**One-liner:** A 2D cross-platform C# game engine with its own Exp scripting language and an integrated IDE.

## Target Users

| Stakeholder | Why they care |
|---|---|
| GameMaker 8 veterans | An engine deliberately based on GameMaker 8, so the workflow feels familiar. |
| C# developers | Engine and IDE are C#; only the game language is custom, so internals stay readable. |
| Open-source contributors | An unfinished project explicitly open-sourced to find help making it real. |

The README defines the audiences by analogy (GameMaker 8 users) and by language (C# developers).

## Jobs To Be Done

1. **Functional job** — Program a 2D game in the Exp language inside the integrated IDE.

2. **Functional job** — Export the game to desktop, mobile and consoles through MonoGame.

3. **Functional job** — Extend the engine itself in C#.

4. **Emotional job** — Recapture the GameMaker 8 feeling of making a game in one integrated tool.

## Success Metrics

- **Buildable:** a contributor can build the engine, IDE and a sample game from the repository.
- **Language loop:** edit Exp code in the IDE, run it, see the game update.
- **Export coverage:** MonoGame exports work for desktop, mobile and consoles as stated.
- **Contributor adoption:** new contributors arrive and land changes — the author's stated hope.

## Pricing & Monetization

None stated. The project is open source, unfinished, and explicitly seeking contributors rather than revenue.

## Competitive Landscape

The post names no competitors, but the README names its lineage: ArcadeMaker is based on GameMaker 8, so GameMaker is the direct reference point. The category is 2D game engines with integrated editors. The differentiators are the custom Exp scripting language, a C# implementation of both engine and IDE, and MonoGame-based cross-platform export including consoles.

## Risks & Open Questions

- [ ] Unfinished by admission; the author has very little time, so momentum depends entirely on contributors arriving.
- [ ] The IDE was written three years ago at an earlier skill level — technical debt is declared in the README.
- [ ] A custom scripting language is a learning tax for every new user, even with the GameMaker 8 analogy.
- [ ] Web export is only planned (KNI-engine); the engine cannot claim the web today.
- [ ] One capture, no community, no release cadence described.
