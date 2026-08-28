---
id: "3301"
slug: vertex-your-personal-archiver-and-annotator
title: "Vertex, your personal archiver and annotator"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49465218"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Vertex, your personal archiver and annotator

## Problem

Hey Hacker News! I'd like to showcase Vertex.Vertex is a browser extension [1] (currently only Chrome) and a web app [2] for saving bookmarks (vertices) along with the source documents.You can save optional notes along with (almost) everything you can save on Vertex. You can organise your vertices into sets [3] or connect them together as you see fit.
Your vertices can hold snapshot(s) of the source. These are self-contained, parseable MHTML documents which stay immutable independently of the source.Additionally, the Vertex extension will highlight your saved links (along with notes) as you browse.I built Vertex because of problems I faced — links I cared about silently changed or disappeared, and once my collection got large enough, I lost track of which identical-looking URL I wanted.Vertex sits between existing archiving systems like ArchiveBox [4] and note-taking applications like Obsidian [5] — snapshots on one side, annotations and a graph on the other.
And unlike Wayback Machine's "Save Page Now" [6], the browser extension enables you to capture even login-gated pages.I've used Haskell for the backend and TypeScript for the frontend. I've run production Haskell for 10+ years, so that's what came most naturally to me.Future improvements:- Firefox extension- Better mobile supportThe free tier [7] retains archives for 30 days.I'd love any feedback, so please give it a spin![1]: https://chromewebstore.google.com/detail/vertex/dhhilgfkipba... — Chrome Web Store[2]: https://vertexapp.io — Onboarding[3]: https://vertexapp.io/vertex/set/56qE75Nh7RDuL5UUiloZK — Example shared set[4]: https://archivebox.io/ — ArchiveBox[5]: https://obsidian.md/ — Obsidian[6]: https://web.archive.org/ — Wayback Machine[7]: https://vertexapp.io/pricing — Pricing

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
