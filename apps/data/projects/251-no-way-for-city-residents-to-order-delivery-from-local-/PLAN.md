---
id: "251"
slug: no-way-for-city-residents-to-order-delivery-from-local-
title: No way for city residents to order delivery from local stores to their elderly relatives in remote villages
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/kos2aznku1-no-way-for-city-residents-to-order-deliv"
category: logistics
date: "2026-01-13"
tags: [Logistics, Retail, Other]
country: Russia
---
# No way for city residents to order delivery from local stores to their elderly relatives in remote villages

## Tech Stack

- Next.js + TypeScript for the buyer-facing order form and the courier / store / operator consoles; the buyer surface is mobile-first and must load on mid-range Android over village-edge 3G/4G.
- PostgreSQL with Prisma for villages, stores, couriers, orders, and delivery confirmations.
- A small Node.js API (Express) for the order lifecycle (place, match, dispatch, confirm) and the SMS notifications to the courier.
- SMSC.ru (or a comparable Russian SMS provider) for courier notifications, since couriers in villages are unlikely to have reliable mobile data but will have SMS.
- Object storage (S3-compatible MinIO) for delivery-confirmation photos.
- YooKassa (or Tinkoff Payments) for online payment by the buyer.
- Self-hosted on a single VPS via Coolify; the workload is per-order, low-throughput, and predictable.

## Architecture

Three pieces:

1. **Buyer surface** — order form (recipient, village, goods category, budget), payment, and delivery status page. Mobile-first, low-bandwidth-tolerant.
2. **Operator console** — used by the service operator to onboard villages, register stores with a printed catalogue, and register one courier per village.
3. **Courier + store flow** — the courier receives an SMS with the order details, picks up at the store, delivers to the recipient, and marks the delivery done via a single-tap link in the SMS (the link opens a small mobile page that asks for a photo and a confirmation). The store is notified by SMS to expect the courier.

There is no real-time tracking map in the MVP. The courier's confirmation photo and timestamp are the proof of delivery.

## Milestones

- **M1 — Village onboarding.** Operator console seeds 20–30 villages, each with one store (printed catalogue) and one courier (phone number).
- **M2 — Buyer order form.** Order placement, payment via YooKassa, and order record in PostgreSQL.
- **M3 — Dispatch SMS.** Order triggers an SMS to the courier with pickup details and a single-tap delivery-confirmation link.
- **M4 — Delivery confirmation.** Courier uploads a photo and marks the order delivered; buyer is notified.
- **M5 — Repeat-buyer view.** Buyer dashboard that shows the buyer's order history and a one-click "send the same basket again" shortcut for recurring needs.

## Risks

- Last-mile cost: a 30 km trip at 1,500₽ per order is not viable. The MVP must price rural delivery at a rate the buyer accepts and that covers the courier; the post does not state a price, so this is a discovery task.
- Store onboarding is manual and slow. The MVP depends on an operator who can physically visit or call village stores. Growth is gated by that operator's bandwidth.
- Recipient safety and dignity: an elderly recipient may not understand why a courier is at the door with goods they did not order. The MVP must include a printed note the courier hands over (in Russian) explaining the order and the buyer's name.
- Connectivity gaps: village stores and couriers may have intermittent mobile data. The MVP must work over SMS and a single mobile-link tap, not require a smartphone app.
- Regulatory scope on medicine: over-the-counter items only in the MVP. Prescription medicine is a separate regulatory path and is out of scope.
