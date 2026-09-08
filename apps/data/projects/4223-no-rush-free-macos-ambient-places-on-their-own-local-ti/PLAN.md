---
id: "4223"
slug: no-rush-free-macos-ambient-places-on-their-own-local-ti
title: "No Rush – Free macOS ambient places on their own local time and weather"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507180"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# No Rush – Free macOS ambient places on their own local time and weather

## Tech Stack

The desktop build is an Electron / AppImage shell; the surrounding site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the scene catalogue. Coolify hosts the site behind Docker.

## Architecture

A small Electron-style shell hosts the scene renderer and the audio mixer; the scene composes itself from a local-time clock, a weather source, and a focus detector. The site is a TanStack Start app Coolify hosts behind Docker.

## Milestones

- M1 — Single ambient scene with local time and weather.
- M2 — Focus-mode audio mix.
- M3 — AppImage build for Linux desktops.
- M4 — Second scene shipped.
- M5 — Public release.

## Risks

- The "inhabit it" framing is a UX claim; if the scene reads as a wallpaper instead of a place, the product loses its character.
- Focus detection has to be honest; a noisy transition breaks the spell.
