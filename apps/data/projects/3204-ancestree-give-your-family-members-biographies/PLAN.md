---
id: "3204"
slug: ancestree-give-your-family-members-biographies
title: Ancestree – Give your family members biographies
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451007"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ancestree – Give your family members biographies

## Tech Stack

- **Frontend:** React + TypeScript with TanStack Start, shipped as a static site the user can also self-host.
- **Storage:** IndexedDB in the browser. The post says "nothing you draw or write ever leaves your browser", so the local store is the only persistence layer in the MVP.
- **Tree data model:** typed entities for Person and Relationship (parent/child, partner) with the per-person "book" of chapters attached.
- **Export pipeline:** client-side serializers that produce (a) a normal tree export, (b) a detailed tree export, and (c) a single person's chapters as one long biography.
- **Open-source distribution:** the repo is the source of truth; no hosted service backs the app.

## Architecture

```
Browser
 ├─ React + TanStack Start UI
 ├─ Person editor (per-person "book" view)
 ├─ Tree editor (links: parent / child / partner)
 ├─ IndexedDB (people, relationships, chapters)
 └─ Export serializers ──▶ downloadable file
```

- Every byte the user types stays in IndexedDB; the only outbound traffic is the user-initiated export download.
- The two tree export formats differ in what they include about each person (the source names them "normal" and "detailed" but does not define the difference, so the MVP must pick a definition and document it).
- The per-person export concatenates a person's chapters into a single long-form document suitable for printing or sharing.

## Milestones

1. **M0 — Spec + design tokens + tree data model.** Existing SPEC.md and DESIGN.md approved; the Person and Relationship types are stable.
2. **M1 — Local-only tree editor.** A user can add people, link them, and write per-person chapters, all in IndexedDB.
3. **M2 — Per-person book view.** A dedicated page for each person that reads as their "book" — chapters written so far, dates, anything the user attached.
4. **M3 — Tree exports.** Two distinct exports: a normal tree view and a detailed tree view, each downloadable from the UI.
5. **M4 — Per-person biography export.** A button that turns one person's chapters into a single long-form document, formatted as a readable biography rather than a raw chapter dump.
6. **M5 — Open-source release.** README, install instructions, and a self-host path so the local-first promise survives if the hosted copy ever disappears.

## Risks

- IndexedDB eviction: a user who clears site data loses the entire tree. The MVP needs visible export prompts, especially after meaningful edits, and a clear "this is browser-local only" warning on first run.
- Export-format drift: "normal" vs "detailed" tree exports need a documented distinction; without it, users will see them as two versions of the same thing and stop trusting the export.
- Per-person biography quality: concatenating chapters can read as a choppy dump; the MVP needs paragraph breaks, a consistent chapter order, and the option to set a "this person was born in..." lead paragraph.
- The local-first promise is fragile: any analytics or error-reporting SDK that ships in the bundle will quietly break it. The MVP must enforce a strict no-network-for-content boundary.
