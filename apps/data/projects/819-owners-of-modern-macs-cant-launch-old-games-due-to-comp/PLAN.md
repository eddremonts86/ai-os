---
id: "819"
slug: owners-of-modern-macs-cant-launch-old-games-due-to-comp
title: "Owners of modern Macs can't launch old games due to complex instructions involving emulators and file conversion"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/ff5gcnrro1-owners-of-modern-macs-cant-launch-old-ga"
category: other
date: "2025-12-04"
tags: [Other]
country: UK
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Owners of modern Macs can't launch old games due to complex instructions involving emulators and file conversion

## Tech Stack

A native macOS app (Swift or Electron shell with a React and TypeScript UI) that bundles vetted emulators and conversion scripts. TanStack Start as the Node.js API for the catalogue and licence display, SQLite with Drizzle ORM for the catalogue, deployed via Coolify and Docker.

## Architecture

A Mac app with three parts: a launcher UI that picks a game from a curated catalogue, a per-platform emulator pack that handles conversion and launch, and a small web catalogue that lists which games are known to work on which Mac.

## Milestones

- M1 — Launcher for one well-known DOS platform with three game configs that work end-to-end.
- M2 — Add a second platform and a conversion pipeline for non-native image formats.
- M3 — Web catalogue of known-good games with macOS-version compatibility notes.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- macOS notarisation and Apple Silicon support are gating constraints on shipping.
- ROM legality must be addressed in the copy from day one.
