---
id: "277"
slug: owners-of-modern-macs-cant-launch-old-games-due-to-comp
title: "Owners of modern Macs can't launch old games due to complex instructions involving emulators and file conversion"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/ff5gcnrro1-owners-of-modern-macs-cant-launch-old-ga"
category: other
date: "2025-12-04"
tags: [Other]
country: UK
tech: [Tauri (Rust), SwiftUI wrapper, DOSBox-X / ScummVM bundling, GOG Galaxy 2.0 import, RetroAchievements API]
---
# Owners of modern Macs can't launch old games due to complex instructions involving emulators and file conversion

## Tech Stack

Tauri (Rust) for the cross-platform shell — chosen for low resource use and ability to embed native binaries. SwiftUI for the macOS-native UI wrapper. Bundled emulators (DOSBox-X, ScummVM) with Rosetta / Apple Silicon translation. GOG Galaxy 2.0 import for legitimate libraries. RetroAchievements API for optional achievements.

## Architecture

Three pieces: a SwiftUI macOS app for the user UI, a Tauri-backed engine that hosts emulators and applies compatibility configs, and a per-game compatibility database (JSON files maintained by the team) that maps games to known-good settings.

## Milestones

M1: SwiftUI app shell with library view. M2: DOSBox-X and ScummVM bundling with Apple Silicon support. M3: GOG / archive.org import. M4: Per-game compatibility database and auto-config. M5: App Store submission with macOS notarisation.

## Risks

Per-game compatibility tuning is unbounded — thousands of games, each with quirks. Apple Silicon translation quality varies by emulator. macOS notarisation is required and can be slow.
