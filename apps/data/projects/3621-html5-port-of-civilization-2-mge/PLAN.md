---
id: "3621"
slug: html5-port-of-civilization-2-mge
title: "HTML5 port of Civilization 2: MGE"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49477029"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [HTML5 / browser game, JavaScript or TypeScript runtime, "original Civ 2: MGE graphics and unit assets", embedded video playback for Heralds cinematics, BSD 3.0 source license]
---
# HTML5 port of Civilization 2: MGE

## Tech Stack

The post does not name a stack. The choice below is the one the playable web build implies.

- **HTML5 browser game** — the playable build runs in a modern browser; this is the whole reason the project exists (no Windows XP VM, no patched executable).
- **JavaScript or TypeScript runtime** — the natural fit for a browser game; the BSD 3.0 source release at `github.com/wan0net/civ2` is the concrete source of truth.
- **Original Civ 2: MGE graphics and unit assets** — supplied by the player who owns a licensed copy; the port does not bundle them.
- **Embedded video playback** — needed so the Heralds cinematics play inside the browser build.
- **BSD 3.0 source license** — applies to the code; the assets are not BSD-licensed and stay with the original rights holder.

## Architecture

The player lands on the playable web build, hits the licensing gate, and affirms they own a licensed copy of Civ 2: MGE. The gate's job is structural: the post says the asset licensing is what keeps the port legal, and the in-product gate is what enforces it on each play session. Once past the gate, the player supplies (or the build loads, from a player-supplied location) the original graphics, unit art, UI assets, and Heralds videos.

The game runtime is a browser-rendered Civ 2: MGE faithful to the original UI. The post itemizes "the same UI" as part of what the port preserves, so the rendering layer is not a redesign; it is a port that preserves the original layout, palette, and unit presentation. The Heralds cinematics play through an embedded video path so the original videos remain part of the in-game experience.

The source tree at `github.com/wan0net/civ2` is BSD 3.0. The license file applies to the code only; the assets remain copyrighted by the original publisher and are never redistributed with the repo or the playable build. The first beta is the MVP: graphics, units, UI, and Heralds videos, playable on the web, with the licensing gate enforced.

## Milestones

1. **M0 — Asset-licensing gate.** A pre-play flow that requires the player to affirm a licensed Civ 2: MGE copy before the game loads.
2. **M1 — Original graphics + units rendering.** The original art loads from the player-supplied assets and renders in the browser build.
3. **M2 — Original UI preserved.** The same UI from Civ 2: MGE is reproduced, including the dense, mouse-driven panels; no modern UX redesign.
4. **M3 — Heralds videos embedded.** The original Heralds cinematics play inside the playable build.
5. **M4 — First beta + BSD release.** Playable build on the web, source on GitHub under BSD 3.0, beta status disclosed in the README.

## Risks

- **Copyrighted-asset redistribution** — the post's mandate is "licensed copy required to play." Any path that lets the playable build or the GitHub repo distribute original assets (intentionally or through a sloppy loader) breaks the legal foundation of the project.
- **Asset-loading trust** — the gate affirms the player's word; the loader must not, by default, pull from any source that bundles the assets, or the gate is theater.
- **Faithfulness scope creep** — "the same UI" plus preservation instincts create pressure to add quality-of-life features; the MVP should resist that and keep the brief narrow.
- **Beta stability** — the post announces a first beta; regressions in the original-game experience (lost cinematics, broken UI panels) will be felt more sharply than in a normal new product because the original is the benchmark.
- **Long-term maintenance** — the post names the author as the original builder (with Claude / Opus 4.6); sustaining the project past the first beta needs at least one more maintainer or a clear handoff in the repo.
