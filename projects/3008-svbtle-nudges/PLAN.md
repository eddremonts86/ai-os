---
id: "3008"
slug: svbtle-nudges
title: Svbtle Nudges?
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338991"
category: ask-hn
date: "2026-08-17"
tags: [Ask HN, Problem]
---
# Svbtle Nudges?

## Tech Stack

- **Frontend:** SvelteKit. Small bundle, file-based routing matches the three-screen shape of the product (paste, dossier, history), and the dev experience is quiet.
- **Server:** SvelteKit's built-in endpoint handlers. The MVP only needs three: `POST /api/analyse`, `GET /api/history` (user-local, not server-side), `GET /api/directory/lookup`.
- **Directory storage:** A single SQLite file seeded from a checked-in JSON, loaded at boot into memory. No need for a database engine beyond `better-sqlite3` because the directory is read-only at runtime.
- **Email parsing:** `mailparser` for RFC822 / .eml input; a regex pass for plain text. Both run on the server endpoint.
- **Hosting:** A single small VM or Fly.io app. No Docker, no Kubernetes, no auth provider.

## Architecture

The browser posts the email body (or uploaded .eml) to a single endpoint, which runs it through a small set of pattern matchers that score the message against directory entries, returns a dossier JSON, and writes nothing to disk server-side. The user's history lives in `localStorage` in the browser.

```
Browser (paste form)
   |  email body
   v
SvelteKit endpoint
   |  mailparser + pattern match
   v
Directory (in-memory, loaded from SQLite)
   ^
   |  scored dossier
   |
Browser renders dossier + saves copy to localStorage
```

The directory is the only persistent store the server touches, and it is read-only.

## Milestones

1. **M0 — Scaffold:** SvelteKit project, design tokens, paste form with plain-text input only.
2. **M1 — Pattern matcher:** Regex-driven directory loader, score-one-message, return top three matches with confidence.
3. **M2 — Dossier screen:** Render the dossier with claimed sender, trigger class, vendor preferences link, and a "report outdated" link.
4. **M3 — .eml upload:** Optional RFC822 upload via `mailparser`; degrades gracefully if the user pastes plain text.
5. **M4 — Reply generator:** Three templated reply drafts (curt, neutral, detailed) the user can copy and send back to the vendor.
6. **M5 — Directory curation:** Seed 50+ patterns from public examples, set up a simple editorial workflow for adding more.

## Risks

- **Pattern matcher drift.** Mitigation: keep the matcher dumb (regex + scoring), never try to LLM-classify trigger intent in v1.
- **Vendor cease-and-desist.** Mitigation: directory entries cite the source email and the vendor's own public pages; nothing speculative.
- **localStorage losing history.** Mitigation: export-to-JSON button on every dossier.
- **Plain-text-only input limits accuracy.** Mitigation: surface a hint that .eml upload extracts more headers; do not block the user from getting a useful answer with plain text.
