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

## Problem

Cushion is PouchDB with Deno KV as the storage adapter. The author's motivation is explicit: he knows Deno KV is backed by FoundationDB, and that there were (or are) plans to use FoundationDB for CouchDB 4.0 too. He likes working on Deno, he likes working in CouchDB, and he likes Deno KV but does not enjoy its ergonomics. So the project was made mostly for his own comfort — bring the PouchDB API and its sync model to Deno KV as a storage backend.

## Objective

Ship Cushion as a PouchDB storage adapter on Deno KV, combining the PouchDB/CouchDB API and replication model with Deno KV's FoundationDB-backed store. The MVP is the adapter itself, working well enough for the author's own comfort, with the PouchDB feature surface mapped onto Deno KV primitives.

## Target Users

- Developers who prefer the PouchDB/CouchDB API and replication model but deploy on Deno.
- Deno users who find Deno KV's native ergonomics unpleasant and want a familiar document-sync interface instead.
- Anyone watching the FoundationDB convergence between Deno KV and CouchDB 4.0 and wanting one storage layer underneath.

## MVP Scope

- PouchDB-compatible API over a Deno KV storage adapter.
- Replication semantics mapped onto Deno KV's transaction and version primitives.
- A working local workflow the author uses himself as the acceptance test.

## Constraints

- The adapter must respect Deno KV's consistency model rather than emulating every CouchDB behavior exactly.
- The project exists for the author's comfort first; production fit is not claimed.
- The FoundationDB link (Deno KV today, CouchDB 4.0 plans) is the author's stated inspiration, not a compatibility guarantee.
- The capture is a short Show HN post; no performance numbers or user reports exist.

## Design Direction

See `DESIGN.md` for this project's design tokens.
