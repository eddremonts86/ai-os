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

> Auto-generated product brief. Reviewed and enriched from source.

## Value Proposition

Run the till through a Wi-Fi outage without losing a sale or a SKU.

## Target Users

Retail operators in markets with intermittent connectivity (Egyptian retail per the poster, but applies broadly). Operators who want a POS they can trust on the floor without depending on a network round-trip.

## Jobs To Be Done

- When the network drops, keep selling.
- When the network returns, reconcile without manual intervention.
- When two till events diverge from the server view, see exactly which transaction lost and why.

## Success Metrics

- Sales completed during offline windows without data loss (the poster already reports zero data loss at 1.5M EGP scale).
- Time to reconcile after a network outage returns.
- Conflict events surfaced per 1,000 transactions (should trend toward 0 with good client design).

## Pricing & Monetization

Not stated. A POS product typically prices per till, per month; the source does not commit to a number.

## Competitive Landscape

Adjacent offline POS: Square (limited offline), Lightspeed, TouchBistro, LS Retail. The poster does not name competitors but the offline-first angle is the differentiator; most cloud-POS vendors have offline as an add-on.

## Risks & Open Questions

- [ ] React 19 + Electron is an opinionated stack; some retail operators prefer native shells for hardware-peripheral reliability (cash drawers, receipt printers).
- [ ] Auditable Event-Replay is the only durable moat — verify it against real concurrent failures.
- [ ] The poster is asking for sync-strategy feedback, which is a real product brief in disguise.
