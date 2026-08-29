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

## Problem

The author's framing for the project is personal: they consider Civ 2 to be the definitive Civilization game, and they did not want to keep installing a Windows XP virtual machine just to play it, or to keep patching the original executable. The port exists so the game can run on a modern browser without that workaround.

The first beta is now on GitHub and available on the web. The post lists what is included: the original graphics, the units, the same UI, and the videos from Heralds. The intent is to keep the look and feel of Civ 2: MGE intact rather than re-skin it, which is why the asset carry-over is itemized.

There is a real legal constraint the author names explicitly: the assets are still copyrighted, so a user is required to own a licensed copy of the original game before playing the port. The source code itself is BSD 3.0, available at the GitHub repo `wan0net/civ2`. So the licensing story is split: code is permissively licensed for the community, assets remain the original publisher's and must be supplied by the player.

This is also the author's first project worked on with Claude and Opus 4.6. That is part of the origin story but not part of the product surface.

## Objective

Ship a playable HTML5 port of Civilization 2: MGE that preserves the original graphics, units, UI, and Heralds videos, runs in a modern browser, and removes the need for a Windows XP VM or a patched executable. The MVP is "the first beta" the post announces: the game is up on GitHub and on the web, with the asset-licensing gate enforced before play.

The objective is not to expand Civ 2's scope. The post's framing is preservation, not enhancement.

## Target Users

- Players who consider Civ 2: MGE the definitive Civilization game and want to play it without a Windows XP VM or a patched executable.
- People who already own a licensed copy of Civ 2: MGE and can supply the copyrighted assets to the port.
- Hobbyist game-port contributors and Civ 2 fans who follow the project on GitHub.
- Curious visitors landing on the playable web build from the HN link to evaluate the beta.

## MVP Scope

- HTML5 playable build of Civ 2: MGE, accessible on the web, with the original graphics and unit art preserved.
- Original UI preserved, not modernized.
- Heralds videos embedded so the cinematics still play.
- Asset-licensing gate: the player must affirm they own a licensed copy of Civ 2: MGE before the game starts.
- BSD 3.0 source release on GitHub (`wan0net/civ2`), so the community can read, fork, and contribute.
- The first beta is the MVP; no promise of content beyond what the post itemizes (graphics, units, UI, Heralds videos).

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49477029` follows the constraints in `3621-.../SPEC.md` and the chosen stack (HTML5 browser game, original Civ 2: MGE assets, embedded video playback, BSD 3.0 source license). The visual language is intentionally not the team's own: the post itemizes original graphics, units, the same UI, and the Heralds videos, which is a preservation directive, not a redesign brief.

**Color** — the original Civ 2 palette as it shipped; do not retone.

**Type** — original in-game typography preserved; no replacement fonts.

**Density** — original UI layout, including the dense panels that modern re-skins usually simplify.

**Motion** — original unit animations and the Heralds cinematics preserved; no motion rework.

## Constraints

- Civ 2: MGE assets (graphics, units, UI art, Heralds videos) remain copyrighted and are not bundled or redistributed by the port; the player must own a licensed copy and supply the assets themselves, and an in-product gate must enforce that.
- The source code is BSD 3.0; the BSD license applies to the code only and does not extend to the original assets.
- The port's UI, graphics, units, and Heralds videos must remain the originals; the MVP is preservation, not redesign.
- A Windows XP VM or a patched executable must not be required to play; running the game in a modern browser is the reason the project exists.
- The first beta is explicitly a beta; the post does not promise a 1.0, so scope discipline against scope creep is part of the contract.
