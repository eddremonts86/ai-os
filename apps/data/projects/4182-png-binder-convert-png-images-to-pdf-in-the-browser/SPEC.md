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

## Problem

PNG Binder (pngbinder.com) is a free PNG-to-PDF converter that runs entirely in the browser. The landing page states the contract: combine up to 50 images and download one clean PDF, nothing is uploaded, no account, no watermark. The flow is drop / paste / browse → arrange → bind → download. The product is positioned as "Simple by design" — the only feature is the conversion, and the privacy claim (nothing leaves the browser tab) is the differentiator against the typical upload-to-server model.


---

## Objective

Ship a browser-only PNG/JPG-to-PDF converter that handles up to 50 images per job with no upload, no account, and no watermark, so a user can produce a clean PDF without trusting a server with their images.


## Target Users

Users who need to combine a handful of PNG/JPG screenshots or scans into a single PDF and prefer not to upload their images to a third-party server. Assumes the reader can drag files into a browser tab.


## MVP Scope

- A single-page web app that accepts PNG / JPG (up to 50 files or paste from clipboard).
- A pure-browser conversion pipeline (canvas / pdf-lib) so nothing is uploaded.
- A simple arrange / reorder / delete UI before binding.
- A "Download" button that produces the bound PDF locally.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the product is presented as free.
- The privacy claim ("no uploads") has to be real; if the implementation ever sends a single byte to the server, the differentiator collapses.
- 50 images per job is a stated ceiling; the UI has to enforce that and explain why.
