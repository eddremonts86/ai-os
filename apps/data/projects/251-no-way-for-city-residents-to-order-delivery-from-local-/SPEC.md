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

## Problem

In Russia, an adult child living in a city cannot reliably send groceries, medicine, or household goods from a city store to an elderly parent in a remote village. The existing delivery services are optimised for city-to-city or city-to-suburb routes; village addresses fall outside their coverage areas, and the local stores in the village rarely offer delivery of their own.

The pain is structural. The buyer is not in the same place as the recipient; the buyer's payment instruments and the recipient's address do not match; the recipient may not be online at all. The post frames this as an unmet need: city residents have the money and the willingness, but no channel that closes the gap.

The post is short. It does not quote specific distances, populations, store counts, or ruble amounts. The framing is that the gap exists, not that it is quantified.

## Objective

Build a service that lets a city resident place an order at a store (city or village) and have it delivered to a named recipient in a remote village. The service handles the buyer–store–courier–recipient handoff, including the inevitable asymmetry: the buyer pays online, the recipient receives goods, and neither needs to be in the same place at the same time.

The MVP focuses on the coordination problem: matching the order to a local store near the recipient, dispatching a courier who can reach the village, and confirming delivery to the buyer. The post does not specify which stores or couriers are involved; the design space stays open.

## Target Users

- City residents in Russia who have an elderly relative in a remote village and want to send groceries, medicine, or household goods.
- Adult children who care for a parent from a distance and want a reliable, repeatable channel.
- Smaller village stores that would accept orders if the order-taking and payment were handled for them.
- Local couriers (often private drivers or motorbike riders in villages) who would take on last-mile delivery if the orders arrived structured.

The source frames the buyer as the city resident. The recipient is named but is the recipient of goods, not a buyer of the service.

## MVP Scope

- An order form: the buyer names the recipient, the village, the goods category (groceries, medicine, household), and a budget. The form does not require the recipient to register or install an app.
- A local-store matcher: a small directory of stores per village (initially seeded manually for the first 20–30 villages), with each store's catalogue reduced to a small, deliverable set of goods.
- A courier handoff: when an order is placed, the service notifies a courier who can reach the village. The MVP uses a single courier per pilot village, paid per delivery.
- A delivery confirmation: the courier marks the order delivered (photo, optional recipient signature), and the buyer receives a notification.
- A payment flow: the buyer pays online; the store and courier are paid by the service after delivery is confirmed.

The MVP is intentionally narrow: one delivery per order, one store per village, one courier per pilot. Multi-store carts, scheduled recurring orders, and prescription medicine handling are out of scope.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/logistics/kos2aznku1-no-way-for-city-residents-to-ord` follows the constraints in `251-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Recipient is offline by definition. The MVP must not require the recipient to install an app, register, or sign for delivery. A photo and a courier note are sufficient evidence.
- Last-mile economics are unforgiving in remote villages. A courier driving 30 km for a 1,500₽ order is not viable at the same rate as a city delivery. The MVP must price rural delivery at a sustainable rate, even if that rate is higher than city rates; the post does not state a price.
- Store onboarding is manual. Village stores do not have APIs, do not have staff to learn software, and do not have inventory systems. The MVP must work with a printed catalogue and a phone call to the store.
- Medicine handling is sensitive. Over-the-counter items are in scope; prescription medicine, controlled substances, and anything that requires a pharmacist's verification is out of scope until the regulatory path is clear.
- Russian-language and village-name transliteration. Village names in Russia vary in transliteration and abbreviation; the MVP must accept what the buyer types and reconcile it with the courier's knowledge of the area.
