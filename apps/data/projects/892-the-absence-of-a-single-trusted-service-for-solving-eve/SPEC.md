---
id: "892"
slug: the-absence-of-a-single-trusted-service-for-solving-eve
title: The absence of a single trusted service for solving everyday tasks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-service"
category: freelance
date: "2025-10-16"
tags: [Freelance]
country: Russia
---
# The absence of a single trusted service for solving everyday tasks

## Problem

The author (Alexander, Russia) accumulates household and life tasks faster than they can solve them — car service appointments (tire change, maintenance), organising delivery of goods from another region, legal disputes (document collection, damage assessment), planning a complex trip, finding a nanny or accompanying a child to training sessions. Some tasks can be performed remotely and others require the physical presence of a contractor. Today the author either handles them personally, delegates ad-hoc, or avoids aggregators like Avito and Profi.ru because they do not trust private contractors. The author wants a service that acts as a legal entity — guarantees transparency, takes on the risk, and promptly finds verified generalists — rather than another marketplace of unknown individuals. The problem became especially acute after moving to a metropolis, where logistics and contractor verification eat too much time. The author is definitely willing to pay, but the price depends on the level and type of task and the interaction model.

## Objective

Ship a concierge service — backed by a single legal entity — that accepts a task description, matches it to a verified generalist contractor, takes responsibility for the outcome (acts as the legal counterparty, holds escrow, mediates disputes), and reports back when the task is done. The MVP must (1) act as the legal entity the customer pays (not a marketplace of private contractors), (2) cover both remote tasks (planning, document collection) and on-site tasks (car service, child accompaniment), (3) verify every contractor before they appear in the pool, and (4) hold escrow so the customer pays only when the task is accepted as done.

## Target Users

- Primary: busy urban professionals (and their households) in major Russian cities (Moscow, St Petersburg, Novosibirsk, Kazan, Yekaterinburg) who need to outsource life tasks but do not trust private contractors from open aggregators.
- Secondary: relocating professionals and families who arrive in a new city without an existing contractor network and need a single point of contact for life logistics.
- Tertiary: small-business owners whose operational tasks (courier dispatch, document collection, light legal research) overflow their own bandwidth.

## MVP Scope

- Task intake: customer describes a task in free text + a category (car service, delivery, legal, travel, childcare, errands, other), preferred time, location, and budget band.
- Verified-contractor pool: every contractor is identity-verified (passport + INN / self-employed status), background-checked, and tagged with categories and geography; only verified contractors see the task.
- Concierge assignment: a human concierge (in v1, the founding team) reviews the task, picks the best-fit contractor from the pool, and confirms the match within a stated SLA (30 min for urgent, 4 h for normal, 24 h for planned).
- Escrow: customer pre-authorises payment via the platform; the platform holds the funds and releases them to the contractor on customer acceptance of the task as done.
- Legal-entity relationship: the platform is the legal counterparty to the customer (an act / invoice is issued), and the platform is the legal counterparty to the contractor (a separate contractor agreement). The customer never pays the contractor directly.
- Dispute mediation: if the customer rejects the result, a human concierge mediates, decides a partial refund, and removes the contractor from the pool if the failure repeats.
- Coverage at launch: Moscow and St Petersburg, with the four biggest task categories (car service, delivery, legal, childcare).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The platform must be the legal entity in every transaction — no marketplace-style payment from customer to private contractor.
- Every contractor must be identity-verified (passport + INN) and background-checked before they appear in the pool; the verification cost is borne by the platform, not the contractor.
- Both remote and on-site tasks must be supported; a single concierge workflow must handle "send a courier" and "be at the school at 3 pm to pick up my child" without bifurcating the product.
- Escrow must hold the customer's funds until task acceptance; the customer must be able to reject and trigger dispute mediation without losing contact with a human.
- The author did not name a price; pricing must be calibrated against the value of time saved, not against a stated ceiling.
- v1 coverage is two cities (Moscow, St Petersburg) and four categories; expansion beyond that is a phase-2 decision tied to concierge hiring.
