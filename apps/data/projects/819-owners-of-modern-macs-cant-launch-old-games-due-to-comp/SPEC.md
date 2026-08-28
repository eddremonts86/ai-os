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

## Problem

The captured source for this plan is a placeholder: only the country (UK) and the title were scraped into SPEC.md. No body text was captured from the ProblemHunt post.

## Objective

Let owners of modern Macs in the UK launch classic games without having to read emulator and file-conversion instructions.

## Target Users

Mac owners in the UK who want to play an old PC or console game they remember and give up when the instructions mention emulators, disk images or file conversion.

## MVP Scope

A Mac app that bundles the right emulator and conversion step for a chosen game and starts the game with one click, with a small library of titles that are known to work.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source is thin: only the title and country are available, so scope is derived from the title signal alone.
- Game-ROM legality is jurisdiction-specific and must be addressed in the copy, not left implicit.
- macOS notarisation and sandbox rules change which emulators can ship cleanly.
