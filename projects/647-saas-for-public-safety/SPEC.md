---
id: "647"
slug: saas-for-public-safety
title: SaaS for Public safety?
status: draft
source:
  name: manual
category: other
---
## Objective

A shift handoff platform for public safety agencies (the poster is a 911 dispatcher whose own agency is using it and likes it). The stated problem is not the product — it is the GTM: the founder has one agency as a customer and is struggling to sell into the rest of the market.

## Target Users

Public safety agencies — 911 dispatch centres, police, fire, EMS — that need to pass operational state between shifts without losing context. The poster mentions the difficulty of marketing to this market, which is itself a sub-problem: the audience is small, sceptical, and procurement-driven.

## MVP Scope

- Shift handoff record (incoming / outgoing) with structured fields (active incidents, equipment state, pending follow-ups).
- Cross-device hand-off (web + mobile), since dispatchers are rarely at a desktop.
- Per-agency tenancy and audit log.
- Public-safety-friendly access controls (chain-of-custody, retention policy).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Public safety procurement is slow and risk-averse; sales cycle is long and the product has to be defensible on compliance grounds.
- The market is small (number of US PSAPs is bounded) — the ceiling is the size of the niche, not the price per seat.
- The poster's own agency is the design partner; if it does not love it, no other agency will either.
