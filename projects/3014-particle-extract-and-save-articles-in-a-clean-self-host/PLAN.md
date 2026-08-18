---
id: "3014"
slug: particle-extract-and-save-articles-in-a-clean-self-host
title: "Particle – Extract and save articles in a clean, self-hosted reader"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339175"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Particle – Extract and save articles in a clean, self-hosted reader

## Tech Stack

- **Backend:** Node.js with TypeScript. The extractor is a server-side pass that fetches the URL, runs an extraction algorithm, and stores the result.
- **Extractor:** `@mozilla/readability` (the same algorithm Firefox's reader view uses) wrapped in a small Node adapter. Chosen because it preserves structure, formatting, and images, which is the property the author calls out.
- **Database:** SQLite via `better-sqlite3`. Chosen because the author already uses it, the schema is small, and the file can be exported with the library.
- **Frontend:** Svelte for the reader and library UIs. Small bundle, file-based routing fits the two-screen shape of the product.
- **PWA:** A service worker (Workbox or hand-rolled) plus a web manifest so saved articles work offline after install.
- **Hosting:** A small Node server (Fly.io or a personal VM). No Docker orchestration beyond a single container.

## Architecture

The browser submits a URL to the server. The server fetches the page, runs Readability to extract the article, returns a clean HTML payload, and offers to save it to SQLite. Saved articles are served as static HTML from the same server with their own URL. The PWA service worker caches the saved articles for offline reading.

```
Browser (Svelte)
   |  POST /api/extract (URL)
   v
Node server
   |--- fetch URL
   |--- Readability extract
   |--- store to SQLite (optional)
   ^
   |  clean HTML or library list
   |
Browser renders reader + library
   |
Service worker caches saved articles for offline use
```

There is no third-party service in the loop. Every URL fetch and every article save happens on the user's own instance.

## Milestones

1. **M0 — Scaffold:** Node + TypeScript repo, Svelte for the front end, SQLite schema for `articles` (URL, extracted HTML, source domain, saved-at, read state).
2. **M1 — Extractor:** Wrap `@mozilla/readability` in a Node adapter, fetch the URL, return clean HTML.
3. **M2 — Reader view:** Render the extracted HTML with adjustable typography (font size, line height, light/dark theme), "mark as read" action.
4. **M3 — Library view:** List saved articles by date and by source domain, click into reader.
5. **M4 — PWA:** Service worker + manifest, offline cache of saved articles, install button in the UI.
6. **M5 — Export and share:** Export-to-HTML (a folder of static files), mobile share-sheet target where supported.
7. **M6 — Test set and polish:** Build the 100-URL regression test set, run it in CI, dogfood for two weeks.

## Risks

- **Extractor brittleness.** Mitigation: CI regression set, in-app "report bad extraction" link.
- **Service worker cache staleness.** Mitigation: a versioning scheme in the service worker that invalidates old caches on deploy.
- **SQLite file growth.** Mitigation: a "vacuum" admin endpoint plus the export-to-HTML path so users can reset.
- **Self-host friction.** Mitigation: a single docker-compose file plus a one-page install guide.
