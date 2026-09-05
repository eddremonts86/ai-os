---
id: "3879"
slug: cushion-pouchdb-on-deno-kv
title: Cushion – PouchDB on Deno KV
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

## Value Proposition

The comfort of PouchDB's document and sync API on top of Deno KV's FoundationDB-backed storage. Cushion is a storage adapter that maps the PouchDB/CouchDB surface onto Deno KV primitives, for people who like Deno and CouchDB and find Deno KV's own ergonomics unpleasant. Built by its author primarily for his own use.

**One-liner:** PouchDB with Deno KV as the storage adapter — CouchDB-style documents and sync on FoundationDB-backed storage.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Deno developers | They keep Deno's runtime but get a document API and sync model they already know. |
| PouchDB and CouchDB users | A path to Deno KV's FoundationDB-backed storage without giving up the replication model they rely on. |
| Storage-curious builders | Follow the FoundationDB thread connecting Deno KV today with CouchDB 4.0 plans. |

The post is a personal-project note; the table reflects the audiences the author himself names (Deno users, CouchDB users).

## Jobs To Be Done

1. **Functional job** — Run PouchDB code against Deno KV as the storage backend.

2. **Functional job** — Keep the CouchDB replication model working on top of Deno KV's transaction primitives.

3. **Functional job** — Escape Deno KV's native ergonomics without leaving Deno.

4. **Emotional job** — Work with tools you enjoy: Deno, CouchDB, and storage that no longer fights you.

## Success Metrics

- **API coverage:** the PouchDB surface the adapter implements, tracked as a share of the documented API.
- **Sync correctness:** document revisions replicate through the adapter without loss under concurrent writes.
- **Author adoption:** the author uses it for his own work — his stated purpose and acceptance test.
- **Transaction mapping:** PouchDB conflicts map onto Deno KV's versioning without silent overwrites.

## Pricing & Monetization

None stated. It is an open personal project built for the author's comfort.

## Competitive Landscape

The post names no competitors. The category is document-database adapters and sync layers — projects that bring CouchDB-style replication to other storage backends. The differentiator here is the FoundationDB thread: Deno KV is FoundationDB-backed today and CouchDB 4.0 has (or had) plans to use FoundationDB, so Cushion sits on the convergence point of two ecosystems the author already likes.

## Risks & Open Questions

- [ ] Comfort project: no stated ambition beyond the author's own use; the adapter may cover only the paths he exercises.
- [ ] Semantics gap: CouchDB's replication and conflict model does not map one-to-one onto Deno KV primitives.
- [ ] Deno KV's ergonomics are the stated pain point, but the adapter's own ergonomics are unproven beyond one user.
- [ ] FoundationDB plans for CouchDB 4.0 are cited as maybe (were/are) — the premise may shift under the project.
- [ ] No performance or durability numbers are published anywhere in the capture.
