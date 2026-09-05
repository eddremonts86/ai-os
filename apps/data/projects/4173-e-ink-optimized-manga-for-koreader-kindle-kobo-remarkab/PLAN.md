---
id: "4173"
slug: e-ink-optimized-manga-for-koreader-kindle-kobo-remarkab
title: "E-Ink Optimized Manga for KOreader, Kindle, Kobo, ReMarkable with KCC"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510831"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# E-Ink Optimized Manga for KOreader, Kindle, Kobo, ReMarkable with KCC

## Tech Stack

KCC is a Python desktop / CLI tool; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the per-reader profile catalogue. Coolify hosts the docs behind Docker.

## Architecture

The converter is a Python pipeline that reads a CBZ/CBR or folder, processes each page through the target profile, and writes the output file. The profiles live in a small registry the CLI / GUI selects from. The docs site is a TanStack Start app with the per-reader profile documentation; Coolify hosts it behind Docker.

## Milestones

- M1 — CLI accepts a source and a target and emits an output file.
- M2 — Per-target profiles for Kindle, Kobo, ReMarkable, and KOreader.
- M3 — GUI version that wraps the CLI for non-CLI users.
- M4 — Documentation for each profile (which device, which settings).
- M5 — Public release.

## Risks

- E-ink firmware changes; profiles have to be updated or output looks wrong on new firmware.
- Conversion can be slow; the tool has to be honest about expected time on a long series.
