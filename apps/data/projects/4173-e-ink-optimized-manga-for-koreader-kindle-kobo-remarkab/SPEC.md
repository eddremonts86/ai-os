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

## Problem

KCC (Kindle Comic Converter) at github.com/ciromattia/kcc is a long-running open-source converter that turns scanned or digital comics and manga into files tuned for e-ink readers (KOreader, Kindle, Kobo, ReMarkable). The post and the project are about the conversion pipeline: panel order, resolution, gamma, dithering, and the file shape each target reader actually wants. The maintainer funds the work through ko-fi and the project has been live for years; the capture does not enumerate every knob the converter exposes, only the role: take a comic source, hand back a reader-ready file.


---

## Objective

Ship a converter that takes a comic or manga source and emits a file tuned for a chosen e-ink reader, with the right panel order, resolution, gamma, and dithering for that device.


## Target Users

Comic / manga readers with e-ink devices who want their library in a form the device reads well. Assumes the reader is comfortable with a tool that needs a source folder and produces a single output file.


## MVP Scope

- A converter that accepts a folder of images or a CBZ/CBR and emits a MOBI/EPUB/PDF.
- Per-target profiles for Kindle, Kobo, ReMarkable, and KOreader with the right resolution, gamma, and panel order.
- A simple CLI / GUI flow: pick the source, pick the target, get the output file.
- Documentation of which profile matches which reader.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing beyond ko-fi funding; the project is open source.
- Each target reader has different rules; profiles have to be maintained as devices and firmware change.
- Conversion can be slow on long series; the tool has to be honest about time-to-finish.
