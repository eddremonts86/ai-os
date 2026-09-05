---
id: "3893"
slug: time-tracking-for-solo-consultants-that-ends-in-a-pdf-i
title: Time tracking for solo consultants that ends in a PDF invoice
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497476"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [timer engine, PDF generation, local-first storage, offline PWA, currency formatting, client management]
---
# Time tracking for solo consultants that ends in a PDF invoice

## Tech Stack

- **Timer engine:** pause, resume and idle handling.
- **Local-first storage:** tracking survives offline work.
- **PDF generation:** the invoice artifact.
- **Currency and locale formatting:** rates and totals.
- **Offline-capable PWA:** the tool runs without a constant connection.
- **Client and project structures:** the ledger's backbone.

## Architecture

- Client records with rate, currency and contact details.
- A timer state machine per client: running, paused, stopped, with sessions persisted locally.
- A ledger view aggregating sessions by period.
- An invoice generator reading the ledger and emitting the PDF.
- A sync layer added later; the MVP stays local-first.

## Milestones

1. **M0 — Scaffold:** app shell, timer state machine, local persistence, demo route.
2. **M1 — The loop:** clients, timers, ledger, manual entries.
3. **M2 — The invoice:** PDF generation from a selected period, clean default layout.
4. **M3 — Polish:** idle handling, export history, the public demo path polished for the Show HN audience.

## Risks

- Retention: solo consultants abandon trackers quickly if the timer is not frictionless.
- PDF layout expectations vary by client and country.
- Local-first storage must never lose a session — data loss kills a tracker's trust.
- The category is crowded; the invoice ending must be visibly better than rivals.
