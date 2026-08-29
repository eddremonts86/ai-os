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

## Problem

City residents in Russia cannot order a delivery from a local store to an elderly relative in a remote village. The post frames this as a missing path: the city side has stores and couriers, the village side has a person who needs what the city store sells, and the two sides have no relay that can hand the order from a courier network into a place with no courier network. The implication is that an act that takes minutes in the city is impossible across the distance, and the gap is structural rather than logistical.

The capture is a one-line problem statement from ProblemHunt, with country listed as Russia and no further detail. The post does not name a specific city, a specific village, a courier network, a payment processor, a regulator, or a price. What the source names is the actor (a city resident with an elderly relative in a remote village), the pain (no way to order delivery across the distance), and the missing thing (a relay from courier-network coverage to a place without it). The plan treats those bare facts as the ground truth.

What follows from those bare facts is the shape of the problem: any solution has to take an order placed by the city side, route it through whatever delivery network covers the city, and then hand it to a human courier on the village side who can reach the relative's address — and that village-side leg is the missing piece, because no platform owns it. The plan scopes the narrowest honest MVP that addresses exactly that handoff, without inventing a city, a courier network or a price.

## Objective

Build a relay service that takes a city-side order placed by a city resident, hands it to a courier network that covers the city store, and then transfers it to a village-side courier — an individual or small local operator registered on the service — who delivers it to the elderly relative's address, with the city-side requester able to track the handoff and the village-side recipient able to confirm receipt.

## Target Users

- City residents in Russia with an elderly relative in a remote village who cannot order a delivery across the distance and would rather send what the relative needs than rely on the relative going to a store.
- Elderly recipients in remote Russian villages who currently rely on a neighbour or a once-a-week market trip for goods the city takes for granted.
- Village-side couriers — individuals or small local operators who already run informal delivery runs — who want a channel that fills their existing route with paid, tracked orders rather than building their own.
- City-side stores that sell everyday goods (groceries, pharmacy, household basics) and want to extend their delivery radius without opening a new logistics arm.
- City-side couriers who would lose the order if it stopped at the city boundary, and want the relay to pay them for the city leg without owning the village leg.

## MVP Scope

- A city-side requester flow: the resident enters the recipient's village address, picks a city store, lists the goods, places the order, and pays for both the city-side delivery and the village-side relay fee.
- A village-side courier registry where individuals or small operators in a target village zone sign up, declare their availability window, declare a coverage radius, and pass a basic verification check (identity + reference).
- An order-routing path that places the city-side order with a city courier network, then assigns the village-side leg to a registered village courier based on the recipient address and the courier's declared coverage.
- A handoff protocol: the city courier delivers to a named handoff point (a shop, a bus station, a village landmark), the village courier picks up from that point, and the handoff is logged with timestamp and (where possible) a photo.
- A per-order tracking page the city requester can open to see the city-side status, the handoff confirmation, and the village-side status, with each transition timestamped.
- A recipient confirmation step (a one-tap SMS or a call from the village courier at the door) that closes the order and releases payment to both legs.
- A documented coverage model: a village is in scope when at least one verified village courier has declared availability for it, so the service never sells an order it cannot relay.
- Russian-language copy throughout, since the source country is Russia and the actors are Russian.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The service is a relay, not a courier network. It does not own vehicles or employ couriers; it routes orders to existing city couriers and to registered village couriers.
- A village is in scope only when at least one verified village courier has declared availability, so the service cannot sell what it cannot deliver.
- Village-side courier identity and reference must be documented before the courier can receive an order, because the recipient is elderly and the handoff is unsupervised by the requester.
- The handoff protocol must produce a record the requester can inspect — a timestamp, a photo where possible, and the village courier's identifier — so the requester does not have to trust the relay on faith.
- Payment is held in escrow until recipient confirmation, so neither leg is paid for an order that was not delivered.
- Russian personal-data rules apply; the MVP must confirm what is permissible before launch, and the documented data-retention policy must reflect that.
- The city-side and village-side legs are priced separately and visibly, so the requester understands the relay fee is a real cost and not hidden inside a single delivery charge.
