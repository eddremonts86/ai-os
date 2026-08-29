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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Pick the browser runtime and the asset-loading shape (player-supplied vs. fetched, never bundled)
- [ ] Asset-licensing gate: design the pre-play affirmation flow and what "licensed copy" means in practice
- [ ] Repo skeleton at `github.com/wan0net/civ2` with BSD 3.0 LICENSE file at the root
- [ ] README: beta status, asset-licensing mandate, link to the playable web build, link to the GitHub repo
- [ ] Decide the embed-video path for the Heralds cinematics so they play without redistributing the originals
- [ ] Decide what "the same UI" means in code terms (layout fidelity vs. behavior parity) before any rendering work begins

## Phase 1: Core

- [ ] Original graphics + units rendering: player-supplied assets load into the browser build and display
- [ ] Original UI reproduced, panel by panel, mouse-driven as in Civ 2: MGE; no UX redesign
- [ ] Heralds cinematics embedded and playable inside the in-game flow
- [ ] In-product licensing gate enforced before the game starts; gate text reflects the post's mandate
- [ ] Save / load preservation: original save format readable by the port so existing Civ 2: MGE saves still work
- [ ] Asset loader refuses to read from any path that would imply redistribution of the original assets
- [ ] Repo contents under BSD 3.0 only; assets kept out of version control and out of the playable bundle
- [ ] Bug-report channel open on the GitHub repo for beta testers
- [ ] Docs: install / play / supply-assets / known-issues for the first beta

## Phase 2: Deploy

- [ ] Public playable build on the web with the licensing gate in place, linked from the HN submission
- [ ] GitHub repo public at `github.com/wan0net/civ2`, BSD 3.0 LICENSE, README pointing at the web build
- [ ] First wave of beta bug reports triaged; regressions in the original-game experience (lost cinematics, broken UI panels) prioritized
- [ ] Post-mortem at week 4 of beta: which original-game surfaces regressed, what the next beta should focus on, whether the BSD release has attracted contributors
