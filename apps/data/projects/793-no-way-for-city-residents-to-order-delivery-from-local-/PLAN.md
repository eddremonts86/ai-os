---
id: "793"
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
tech: [Python, FastAPI, PostgreSQL with PostGIS, Redis, Celery, Telegram Mini App, WhatsApp Business API, Yandex Maps geocoder, Sberbank or Tinkoff payment integration, Coolify]
---
# No way for city residents to order delivery from local stores to their elderly relatives in remote villages

## Tech Stack

- **Python with FastAPI** for the relay API and the order-routing path, because the city-and-village shape is integration-heavy and FastAPI's type hints keep the city and village leg surfaces separated cleanly.
- **PostgreSQL with PostGIS** for orders, handoff points, village coverage zones, and courier availability, so the routing decision is a spatial join rather than an application-level distance calculation.
- **Redis** for the live order-state cache and the village-courier availability window, so the routing path can answer availability without hitting the database on every order.
- **Celery** for the scheduled work (recurring-order generation, courier availability reset, escrow-release timer), because the relay is a long-lived state machine rather than a request-response shape.
- **Telegram Mini App** as one of the city-side requester surfaces, since Telegram is the messaging surface the city side already uses; **WhatsApp Business API** as a second surface where the recipient or the requester prefers it.
- **Yandex Maps geocoder** for the village address resolution, since the village address is a Russian-language rural address that needs a geocoder tuned to the locale.
- **Sberbank or Tinkoff payment integration** as the licensed payment processor for the requester's payment and the escrow that releases on recipient confirmation.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The relay has three planes — a requester plane, a routing plane, and a courier plane — and one order-state machine that drives all three. An order moves through states: placed, city-leg assigned, city-leg picked up, city-leg delivered to handoff, handoff logged, village-leg assigned, village-leg picked up, delivered, recipient confirmed, escrow released. Each transition writes to PostgreSQL and updates the Redis live-state cache so the tracking page reflects the change immediately.

The requester plane is a Telegram Mini App (with a WhatsApp Business API surface as a parallel channel). The requester enters the recipient's village address, picks a city store, lists the goods, sees the two-leg price broken out (city leg and village leg relay fee), and pays. The Telegram surface handles the common case of a city resident who already uses Telegram with the relative; the WhatsApp surface handles the case where the recipient or the requester prefers WhatsApp. Both surfaces share the same order model underneath.

The routing plane takes a placed order and runs a spatial join in PostGIS: it finds a city courier who covers the city store, finds a registered village courier who has declared availability for the recipient's village zone, and assigns the two legs. The plane refuses to assign a village leg when no verified village courier has declared availability — that is the documented coverage rule. The plane writes both legs to the order-state machine with the assigned courier identifiers, so the tracking page can show the parties involved.

The courier plane has two surfaces — a city-courier surface and a village-courier surface — and one shared handoff protocol. The city courier delivers to the named handoff point, logs the handoff with a timestamp and (where the courier's app allows) a photo, and the village courier picks up from the handoff point, logs the pickup, and delivers to the recipient. The handoff protocol produces the record the requester can inspect. A handoff that is not logged within a stated window is escalated to the relay operator, because the order is at risk.

The recipient confirmation step closes the order and releases escrow. For an elderly recipient who may not use a smartphone, the village courier confirms at the door via a one-tap SMS to a number the requester registered for the recipient, or via a phone call to the requester if no number is registered. The escrow-release event writes to the order-state machine and triggers the payment release to both legs.

The recurring-order path is a Celery job that generates orders on the configured cadence, with the recipient and goods carried from the previous order. The job is bounded by the same coverage rule — a recurring order is paused when no village courier has declared availability for the recipient's address, and the requester is notified rather than the order failing silently.

## Milestones

1. **M1 — Village-courier registry** — sign-up flow, verification rubric, coverage-zone declaration, the availability window model.
2. **M2 — Order model and routing plane** — PostgreSQL schema with PostGIS, the spatial-join routing decision, the coverage-rule gate.
3. **M3 — Requester plane (Telegram Mini App)** — order placement, two-leg price breakdown, payment integration, recurring-order setup.
4. **M4 — City-courier integration** — handoff protocol, handoff logging, photo upload where the courier app supports it.
5. **M5 — Village-courier surface** — pickup confirmation, delivery confirmation, recipient confirmation via SMS or call.
6. **M6 — Tracking page and escrow release** — per-order tracking, escrow hold, recipient-confirmation-triggered release.
7. **M7 — WhatsApp Business API plane** — second requester surface, same order model.
8. **M8 — Regulatory confirmation** — sign-off on Russian personal-data and payment-processor rules before live orders.

## Risks

- **Handoff window miss** — the city courier delivers but the village courier does not pick up within the stated window. Mitigation: escalation to the relay operator, automatic reassignment to another village courier where available, and perishable-goods flag that shortens the window.
- **Recipient confirmation starvation** — the village courier delivers but cannot get a confirmation because the elderly recipient does not answer the SMS or the door. Mitigation: explicit fallback to a phone call to the requester, with a documented escalation path.
- **Coverage-rule bypass** — an order is sold when no village courier has declared availability, because the check is in the wrong layer. Mitigation: coverage gate enforced in the routing plane's database transaction, not in application code that can be bypassed.
- **Village-courier trust drift** — a registered village courier's verification ages and is no longer trustworthy. Mitigation: re-verification on a stated cadence, with the courier's active orders paused until re-verification completes.
- **Regulatory gate** — Russian personal-data and payment-processor rules block the launch. Mitigation: regulatory review is its own milestone before live orders, not a launch-day scramble.
- **Recurring-order failure mode** — a recurring order is generated when the recipient has moved or passed away and the order fails on every cycle. Mitigation: recurring orders pause after a stated number of consecutive failures and the requester is notified.
- **Photo-upload privacy** — handoff photos taken near identifiable addresses create a personal-data risk. Mitigation: photos kept only on the order record, retention bounded by the documented policy, and the courier's app handles redaction where the surface allows.
