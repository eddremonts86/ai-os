---
id: "3149"
slug: music-puzzle-game-on-steroids
title: Music Puzzle Game on Steroids
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447840"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Web Audio API, static HTML/JS/CSS, static host]
---
# Music Puzzle Game on Steroids

## Tech Stack

Web Audio API for client-side stem playback and the vocal-to-humming DSP pipeline the author built. A static front-end (HTML/JS/CSS, no framework dependency required for a single-screen guess game) keeps the load path short — the existing organic traffic already opens the page, so time-to-first-puzzle matters more than SSR.

## Architecture

Single-page client app: a song asset is fetched, the Web Audio graph splits it into stems, the vocal track is routed through the humming conversion, and a round UI plays the mix and accepts a guess. No server-side game state — the source describes a vibecoded weekend build that already runs.

## Milestones

- Stabilise the vocal-to-humming DSP so the same input produces consistent output across browsers.
- Curate a playable set of stems the puzzle actually ships with (size not stated in the source).
- Round-end UI: guess entry, reveal, and replay.
- Public deploy on a static host that survives the existing traffic spike the post describes.

## Risks

Song licensing is unresolved in the source. Browser-DSP performance on lower-end mobile devices is unknown — the maker does not state a target. Existing traction ("blown up") is the only growth signal and is not quantified, so capacity-planning has to be conservative.
