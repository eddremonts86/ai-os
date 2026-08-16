---
id: "645"
slug: showoff-saturday-how-i-built-an-offline-first-erp-that-
title: "[Showoff Saturday] How I built an Offline-First ERP that processed $30k+ in a live retail environment (React 19 + Electron + Prisma)"
status: draft
source:
  name: manual
category: other
---
_Lúa generó este análisis automáticamente el 2026-08-15_

## Phase 1: Core

- [ ] Bootstrap Electron + React 19 shell
- [ ] Prisma schema for sales, returns, inventory, customers
- [ ] Local event-log table capturing every state change
- [ ] Sync worker pulls unsynced events, ships to server
- [ ] Event-Replay engine on server: idempotent apply + conflict table
- [ ] Admin console: store list, sync state, conflicts
