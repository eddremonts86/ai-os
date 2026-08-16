---
id: "645"
slug: showoff-saturday-how-i-built-an-offline-first-erp-that-
title: "[Showoff Saturday] How I built an Offline-First ERP that processed $30k+ in a live retail environment (React 19 + Electron + Prisma)"
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

React 19 + Electron desktop shell, Prisma over SQLite for the local data layer, Prisma over PostgreSQL on the server, a background sync worker, an Event-Replay engine that treats the server as the source of truth and the till as a log shipper.

## Architecture

Till (Electron + React 19 + Prisma SQLite) ↔ local event log ↔ sync worker ↔ server (Postgres) ↔ admin console. Event-Replay engine consumes the log, applies events idempotently, surfaces conflicts.

## Milestones

- [ ] POS UI with sale/return/inventory movements
- [ ] Local event log persisted on every state change
- [ ] Sync worker to Postgres
- [ ] Event-Replay engine with conflict detection
- [ ] Admin console: sync status, conflict log, per-store reports
- [ ] Receipt printer + cash drawer integration

## Risks

- Hardware-peripheral support across OS versions is a long-tail support cost.
- Sync conflicts at scale require careful product UX; under-surface them and trust erodes.
- The poster's "ask the community for sync strategies" comment signals the engine is the part they want feedback on — that is the right place to invest engineering time.
