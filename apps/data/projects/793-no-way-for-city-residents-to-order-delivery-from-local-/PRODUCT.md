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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A relay service for city-to-village orders that hands a city-side delivery off to a registered village-side courier for the last leg, with a per-order tracking page the city requester can inspect, a handoff protocol that produces a record rather than a promise, and payment held in escrow until the recipient confirms receipt — so a city resident with an elderly relative in a remote village can order what the relative needs without taking the relay on faith.

The service does not own vehicles. The city leg is routed to a courier network that already covers the city store; the village leg is assigned to a verified village courier who has declared coverage for the recipient's address. The requester sees each transition; the recipient confirms at the door; the village courier is paid only on confirmation.

**One-liner:** A relay from a city courier network to a registered village-side courier for the last leg of a delivery to an elderly relative, with the handoff logged and payment held until the recipient confirms receipt.

## Target Users

| Stakeholder | Why they care |
|---|---|
| City residents with elderly relatives in remote villages | Want to send what the relative needs without taking a once-a-week market trip on faith. |
| Elderly recipients in remote Russian villages | Want everyday goods delivered without depending on a neighbour's goodwill. |
| Village-side couriers (individuals, small operators) | Want a channel that fills their existing informal route with paid, tracked orders. |
| City-side stores selling everyday goods | Want to extend delivery radius without standing up a new logistics arm. |
| City-side courier networks | Want to keep the order and get paid for the city leg without owning the village leg. |
| Family members arranging care for an elderly relative | Want a way to send supplies on a recurring schedule without re-explaining the address each time. |

## Jobs To Be Done

1. **Functional job** — Order a delivery from a city store to an elderly relative in a remote village and watch each leg progress without having to call the courier.
2. **Functional job** — Set up a recurring order so a relative receives the same supplies on a known cadence without the resident remembering each time.
3. **Functional job** — Receive confirmation that the order reached the relative, not just that the village courier picked it up.
4. **Emotional job** — Stop the guilt of being unable to send what the relative needs from a distance.
5. **Social job** — Be the family member who arranged reliable deliveries rather than relying on the relative's neighbours.

## Success Metrics

- **End-to-end delivery rate** — share of orders that complete all legs and reach the recipient. A relay that drops orders is worse than no relay at all.
- **Handoff-record completeness** — share of orders with a logged handoff timestamp and the village courier's identifier. An order without a handoff record is the failure mode the service is built to prevent.
- **Recipient confirmation rate** — share of delivered orders where the recipient confirmed receipt and payment was released. A low rate is the signal that the village-side leg is failing without a clean signal.
- **Village coverage growth** — number of villages with at least one verified courier declaring availability, since coverage is the prerequisite for selling the order at all.
- **Recurring-order retention** — share of recurring orders that complete their second cycle, since the service's value compounds only if the resident trusts the relay enough to automate.
- **Time-to-relay** — median time from the city leg completing to the village courier picking up, since a long wait at the handoff point breaks perishable goods and erodes trust.

## Pricing & Monetization

The source names no fee, no rate and no tier. What the architecture fixes is the cost shape: the service has two surfaces to charge — the city requester (per order, per recurring cycle, or subscription for a known recipient) and the village courier (a take-rate per delivery or a flat registration fee). The source does not pick one. Any future monetization has to be evaluated against the recipient confirmation rate and the village coverage growth, because both metrics depend on the courier and the requester feeling fairly paid.

## Competitive Landscape

- **Existing city-side delivery platforms (the names the source does not provide)** — cover the city leg but stop at the city boundary, which is exactly the gap the source names.
- **Postal services (Russian Post and equivalents)** — cover long-distance delivery but not the same-day, perishable, or short-notice shape of a city-resident-to-elderly-relative order.
- **Informal village-side couriers** — already run the last-leg route informally, without a tracking record the requester can inspect and without escrow that protects either side.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the regulatory path (Russian personal-data handling, payment-processor licensing, courier classification) before launching with real orders.
- [ ] Define the village-courier verification rubric so concretely that two reviewers would agree on the same pass-or-fail outcome for the same applicant.
- [ ] Decide how the service handles a handoff point that fails — the city courier delivers but the village courier does not pick up — so the requester is not stuck at a logged handoff with no relay.
- [ ] Confirm the recipient confirmation step works for an elderly recipient who may not use a smartphone (a phone call, a one-tap SMS, or a door-button is each a different shape).
- [ ] Validate with five city residents with elderly relatives in remote villages that the per-order tracking shape is what they actually need, or whether a recurring-subscription shape is the primary surface.
- [ ] Confirm the documented data-retention policy is compatible with Russian personal-data rules and with the payment-processor's recordkeeping requirements.
