---
id: "4182"
slug: png-binder-convert-png-images-to-pdf-in-the-brow
title: "PNG Binder – convert PNG images to PDF in the browser"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510151"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# PNG Binder – convert PNG images to PDF in the browser

## Tech Stack

The web app is React + TypeScript on TanStack Start; the conversion runs in the browser via canvas + pdf-lib so nothing leaves the client. SQLite/Drizzle holds the (anonymous) usage counters; Coolify hosts the app behind Docker.

## Architecture

A TanStack Start app renders the single-page UI; the conversion runs entirely in the browser using canvas / pdf-lib. A Drizzle-managed SQLite store holds (anonymous) counters so the operator can see usage; the app never sends the user's images anywhere. Coolify hosts the app behind Docker.

## Milestones

- M1 — Drop / paste / browse UI accepts up to 50 PNG / JPG.
- M2 — Pure-browser conversion pipeline produces a single PDF.
- M3 — Reorder / delete UI between accept and bind.
- M4 — Download button delivers the bound PDF.
- M5 — Public release.

## Risks

- The privacy claim is the entire wedge; if a future feature ever uploads anything, the product loses its reason to exist.
- 50 images per job is a soft ceiling; the UI has to explain it so users do not file bugs about a hard limit they did not see.
