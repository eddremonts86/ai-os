---
id: "3879"
slug: "cushion-pouchdb-on-deno-kv"
title: "Cushion – PouchDB on Deno KV"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498995"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Deno KV storage adapter, PouchDB sync API, FoundationDB storage, CouchDB replication model, Offline-first document sync]
---
# Cushion – PouchDB on Deno KV

## Tech Stack

- **Deno KV storage adapter:** the backend layer where documents actually live.
- **PouchDB sync API:** the interface developers code against.
- **FoundationDB storage:** what Deno KV runs on underneath.
- **CouchDB replication model:** the sync semantics the adapter preserves.
- **Offline-first document sync:** the working mode PouchDB users expect.

## Architecture

- **API layer:** the PouchDB-compatible surface — documents, revisions, changes feed.
- **Adapter layer:** maps PouchDB operations onto Deno KV keys and versionstamps.
- **Storage layer:** Deno KV, FoundationDB-backed, holding documents and revision metadata.
- **Sync layer:** replication between PouchDB peers flows through the adapter.

## Milestones

1. **M0 — Basic documents.** Put, get and delete through the PouchDB API land in Deno KV.

2. **M1 — Revisions and conflicts.** Document revisions and conflict handling map onto Deno KV versioning.

3. **M2 — Replication.** Sync between a PouchDB peer and the Deno KV-backed adapter works end to end.

4. **M3 — Ergonomics pass.** The author uses Cushion in his own daily work and fixes what annoys him.

## Risks

- **Semantic mismatch:** CouchDB MVCC semantics versus Deno KV transactions may leave edge cases the adapter cannot express.
- **Solo maintenance:** one author, one use case; the adapter grows where his needs grow.
- **Platform drift:** Deno KV behavior and CouchDB 4.0's storage plans are both moving targets.
- **Undefined scope:** with no roadmap, users cannot rely on any feature staying or arriving.
