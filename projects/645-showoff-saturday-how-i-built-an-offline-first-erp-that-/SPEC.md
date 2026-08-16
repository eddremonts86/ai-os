---
id: "645"
slug: showoff-saturday-how-i-built-an-offline-first-erp-that-
title: "[Showoff Saturday] How I built an Offline-First ERP that processed $30k+ in a live retail environment (React 19 + Electron + Prisma)"
status: draft
source:
  name: manual
category: other
---
## Objective

An offline-first ERP/POS for retail that keeps transacting when the network drops. The poster (Manzoma.online) reports 1.5M+ EGP (~$30k) processed through it in a live retail environment with zero data loss, built on a Local-First architecture (React 19, Electron, SQLite/Prisma local layer) that syncs with PostgreSQL via an Auditable Event-Replay engine.

## Target Users

Retail operators who cannot afford a frozen POS when Wi-Fi drops — small and mid-size stores, especially in markets where connectivity is intermittent. The poster's domain is small-format Egyptian retail but the technical brief (React 19 + Electron + Prisma + Postgres sync) generalises to any offline-prone retail environment.

## MVP Scope

- Local SQLite (Prisma) data store on the till device.
- POS UI for sales, returns, and inventory movements, fully usable offline.
- Background sync worker that ships committed local events to a central Postgres.
- Auditable Event-Replay engine that resolves out-of-order events and detects divergence.
- Admin console surfacing sync status and conflict logs.
- Per-store reporting (sales by day, inventory shrink) computed locally and reconciled after sync.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Cannot stop when the Wi-Fi dies" is the non-negotiable constraint — the entire architecture is in service of it.
- Sync must be auditable: every state-changing operation on the till must be replayable on the server.
- React 19 + Electron stack choice is stated; cannot deviate without inventing.
