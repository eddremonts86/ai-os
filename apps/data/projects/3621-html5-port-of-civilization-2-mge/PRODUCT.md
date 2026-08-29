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

## Value Proposition

A playable HTML5 port of Civilization 2: MGE that runs in a modern browser, preserves the original graphics, units, UI, and Heralds videos, and removes the need for a Windows XP VM or a patched executable. The source is BSD 3.0; the assets stay with the original rights holder, and the port requires the player to own a licensed copy of Civ 2: MGE before playing.

The product exists for players who consider Civ 2: MGE the definitive Civilization game and want to keep playing it without the legacy-Windows workaround. The author's framing is preservation: keep what the game was, change how it runs.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Civ 2 fans on modern hardware | Want to play the original game without a Windows XP VM or a patched executable. |
| Licensed Civ 2: MGE owners | Hold the assets the port needs and can satisfy the in-product licensing gate. |
| Hobbyist game-port contributors | Want a readable BSD 3.0 codebase to learn from, fork, and contribute to. |
| HN visitors | Land on the playable web build from the HN link to evaluate the first beta. |

## Jobs To Be Done

1. **Functional job** — Play Civ 2: MGE end-to-end in a modern browser with the original graphics, units, UI, and Heralds videos.
2. **Emotional job** — Stop maintaining a Windows XP VM or patching the original executable just to keep playing the game.
3. **Social job** — Demonstrate that an LLM-assisted port (the author names Claude and Opus 4.6) can produce a faithful, playable preservation of a classic game.

## Success Metrics

- The first beta is playable on the web and on GitHub, with the asset-licensing gate enforced before the game starts.
- Original graphics, units, UI, and Heralds videos are present in the playable build, itemized as the post itemizes them.
- BSD 3.0 source release at `github.com/wan0net/civ2` is public and the license file matches the post's claim.
- Players with a licensed copy of Civ 2: MGE can complete the asset-gate flow and start a game without a Windows XP VM.

## Pricing & Monetization

The post says nothing about pricing, a hosted tier, a paid build, or any commercial offering. The release is a beta, the source is BSD 3.0, and the playable build is on the web. Absent beats invented.

## Competitive Landscape

- **Original Civ 2: MGE on Windows / DOS / via XP VM** — the experience the port exists to remove; the author frames the VM and the patching as the friction.
- **Other Civilization ports and remasters (Civ 1 / Civ 2 source ports on OpenCiv, fan remasters)** — overlap on "play a classic Civ on modern hardware"; the post does not compare the project to them directly.
- **Browser game engines (js-dos, EM-DOSBox, v86)** — overlap on "run a legacy PC game in the browser"; the post does not position Civ 2: MGE as a generic DOS-in-browser demo.

## Risks & Open Questions

- **Copyrighted-asset constraint is structural** — the post says "you are mandated to have a licensed copy of the game to play before you go forward." Bundling, mirroring, or accidentally leaking the assets would put the BSD-licensed code at legal risk and is the single biggest threat to the project.
- **Beta scope discipline** — the post itemizes graphics, units, UI, and Heralds videos and nothing else; adding modding, multiplayer, or modern UX features without the author is scope creep against a preservation brief.
- **Faithfulness vs. playability tradeoffs** — "the same UI" includes the dense, mouse-heavy Civ 2 panels that are awkward on touch devices; the MVP needs a stance on input surfaces.
- **Single-author / single-LLM origin** — the author built this with Claude / Opus 4.6 as their first such project; long-term maintenance depends on the author and the community the BSD release invites.
- **Hosting the playable build** — the post says "available on the web" but does not name a host; the MVP needs a stable web build separate from the GitHub source.

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49477029) · **Category:** show-hn · **Tags:** Show HN, Product, Problem
