---
id: "250"
slug: aviation-safety-expert-seeks-a-technical-co-founder-to-
title: Aviation safety expert seeks a technical co-founder to develop an AI solution that prevents daily collisions between aircraft and birds/drones — a problem causing massive losses.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/9g9de9og51-aviation-safety-expert-seeks-a-technical"
category: ai
date: "2026-01-13"
tags: [AI, Dev, Logistics, Travel, Hardware, Other]
country: France
---
# Aviation safety expert seeks a technical co-founder to develop an AI solution that prevents daily collisions between aircraft and birds/drones — a problem causing massive losses.

## Problem

Bird and drone strikes against aircraft are a daily occurrence at busy airports and a documented source of aircraft damage, flight delays, and in worst cases hull losses. The poster, an aviation-safety expert based in France, frames the problem as a missing AI-driven detection-and-warning layer that could prevent many of these collisions before they happen.

The post is short. It does not quote specific loss figures, strike counts, airports, or aircraft types. The framing is dual: a domain expert with the operational knowledge (bird behaviour, drone flight patterns, airport coordination, civil-aviation regulation) is looking for a technical co-founder who can build the AI side — perception, classification, alerting — and turn it into a product that an airport or airline would actually buy.

This is not a "build a SaaS" problem. Aviation safety is regulated, slow to adopt, and procurement-heavy. The MVP has to respect that.

## Objective

Pair the aviation-safety expert with a technical co-founder and produce a working AI-assisted detection prototype that an airport operations team could trial. The deliverable in scope is a fixed-site detection system (radar + optical + AI classification) that emits an early warning when an incoming bird flock or unauthorised drone is on a collision course with an aircraft on approach or departure.

The MVP is a single-site pilot: one airport, one runway approach corridor, one season of validation data. The post does not name an airport, an airline, or a regulator; the design space stays open on partnerships.

## Target Users

- Airport operations directors responsible for wildlife-strike prevention and runway safety.
- Air traffic controllers and tower supervisors who need an early-warning signal they can act on.
- Civil aviation authorities (DGAC in France, EASA at EU level) that set the standards a detection system must meet.
- Drone detection buyers: airport security, critical-infrastructure operators, and event organisers.

The source frames the user as the aviation-safety expert, but the actual paying customer is an airport or regulator, not the expert.

## MVP Scope

- A fixed-site detection stack at one airport: a radar unit and an optical camera (PTZ or fixed) covering a defined approach corridor.
- An AI perception pipeline that ingests radar tracks and optical frames, classifies the contact (bird flock, single bird, drone, other), and predicts whether the contact is on a collision course with an active aircraft.
- A real-time alerting surface for the tower: a simple desktop view that shows contacts, classifications, and collision-risk scores with the runway context (which runway, which aircraft, time-to-closest-approach).
- A validation season: the system runs in shadow mode for three to six months, recording its predictions alongside actual operational events, so the team can measure recall and false-alarm rate.
- A co-founder agreement: equity split, IP ownership, decision rights. The post is explicit that the expert does not have a technical co-founder yet.

The MVP does not include a commercial product, certification (EASA / DGAC type approval), or multi-site deployment. Those are next steps, not scope.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/9g9de9og51-aviation-safety-expert-seeks-a-technica` follows the constraints in `250-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in France.

For France, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Civil-aviation regulation: any detection system that drives operational decisions at a controlled airport falls under aviation-safety regulation. The MVP must run in shadow mode (read-only, advisory) until type approval is granted. Acting on AI output without certification is unsafe and out of scope.
- Sensor placement and integration with airport infrastructure (radar, cameras, power, networking) require airport authority cooperation. The MVP cannot proceed without that partnership.
- False-alarm rate is a hard constraint. Tower staff will mute an alert that fires ten times an hour if only one is real. The MVP must measure and report false-alarm rate honestly, even when the number is unflattering.
- Weather and lighting: optical sensors degrade in fog, heavy rain, and night. The MVP must publish its operating envelope and not overpromise detection in those conditions.
- The expert is looking for a co-founder, not a vendor. The MVP is a partnership, not a procurement. Equity, IP, and decision rights must be settled before code is written.
