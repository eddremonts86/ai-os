---
id: "4159"
slug: tinyengine-game-engine-for-microcontrollers
title: TinyEngine – Game Engine for Microcontrollers
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511757"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# TinyEngine – Game Engine for Microcontrollers

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — is inherited from the AI-OS default and is suitable for the web-facing authoring tools and dashboard that sit beside the on-device VM. The on-device VM itself is C/C++ for the microcontroller target and is not changed here.

## Architecture

Web app for authoring and browsing games (React + TanStack Start) talking to a small backend with SQLite/Drizzle for game manifests and metadata. The microcontroller-side is a separate, statically-linked C/C++ VM that reads game bytecode directly from removable storage at runtime. Coolify hosts the web app behind Docker; the device-side VM is shipped as a one-time flash image.

## Milestones

- M1 — VM byte-code interpreter running a minimal 'hello-game' on an Arduino reference board.
- M2 — SD card streaming layer that loads game data without buffering the whole file.
- M3 — Web-based game browser so users can pick a game without reflashing.
- M4 — Authoring workflow that exports a droppable game file.
- M5 — Reference retro game shipped on-device as a demo.

## Risks

- Tight 2KB SRAM budget makes future interpreter features risky; mitigation is to keep the VM small and push complexity to the host tool.
- SD card format compatibility across vendor chips; mitigation is to keep the on-disk format minimal.
- Web stack and on-device stack are different languages; risk of drift between them; mitigation is to keep the byte-code contract frozen.
