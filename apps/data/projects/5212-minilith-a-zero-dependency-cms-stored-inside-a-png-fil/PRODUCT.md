---
id: "5212"
slug: minilith-a-zero-dependency-cms-stored-inside-a-png-fil
title: Minilith – A zero-dependency CMS stored inside a PNG file
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49575769"
category: show-hn
date: "2026-09-05"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Minilith – A zero-dependency CMS stored inside a PNG file

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I enjoy the constraints of retro development. While building games in PICO-8, I took a interest in the way it packs data into the virtual cartridge. I dug into steganography and started thinking: could I apply the same logic to a content management system? Do we really need all the bloat just to host a micro blog?Minilith is a database free CMS where the entire state (posts, pages, and settings) are compressed and stored directly in the pixels of a 256xd256 PNG file.Minilith has zero dependencies. There is no Node, no bundlers, and no external DBs. It relies entirely on browser APIs to compress, secure, and render a site directly from the image.The Minilith Architectural LifecycleInstead of a traditional backend and database, the flow looks like this:1. Payload Creation: The editor data (JSON) is signed with a private key and compressed using the browser's native deflate algorithms.2. Injection: The compressed bits are injected into the image's RGB channels using steganography. A raw tEXt chunk is injected right before the IEND marker to wrap the extraction script, turning the image into an executable polyglot.3. Distribution: The result is a single image file. It can either be pushed directly to Cloudflare KV or downloaded locally.4. Extraction & Rendering: A client side loader fetches the image, draws it to a hidden canvas, extracts the bits, verifies the signature and visual fingerprint, and runs the decompressed payload.Since the entire database is just a picture, deployment and portability are extremely simple:- Cloudflare Edge: Publish directly from the editor to Cloudflare KV, overwriting a single key-value pair for instant updates.- Self Hosting: Generate a .zip archive from the editor and host on any basic web server.- Offline Portability: The editor utilizes service workers. Once you have visited the editor once it is cached. You can view, edit, and generate new images completely offline.The obvious flaw is aggressive image processing and optimization destroying the polyglot logic and data. (Though fun fact: texting the raw image over iMessage preserves the payload)The code is experimental and the linked post is my architectural breakdown of the process. I'd love feedback and to hear your thoughts and ideas.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49575769) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
