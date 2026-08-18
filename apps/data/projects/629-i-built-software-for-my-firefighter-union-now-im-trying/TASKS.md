---
id: "629"
slug: i-built-software-for-my-firefighter-union-now-im-trying
title: I built software for my firefighter union. Now I’m trying to figure out if other unions would actually pay for it.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voz7dg/i_built_software_for_my_firefighter_union_now_im/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, vertical, union, b2b, public-sector, contract-data]
country: US
scores:
  money: 6.5
  learn: 5.5
  fun: 4.5
---
# I built software for my firefighter union. Now I’m trying to figure out if other unions would actually pay for it.

## Phase 0: Scaffold

- [ ] Inventory the existing platform on the poster's own local — modules live, data shapes, hosting setup, what breaks when the CBA changes
- [ ] Pick the web framework and database (Postgres) for the new instance, justified for a content-heavy member portal
- [ ] Stand up a fresh repo with one deployment per local as the deployment model
- [ ] Write the per-local configuration schema: pay table, pension plan parameters, DROP rules, 457 vendor, benefit carriers, vacation/leave schedule
- [ ] Set up local development environment and a staging deployment for one local
- [ ] Document the password-protected member access model and the board-officer admin role

## Phase 1: Core

- [ ] Build the searchable CBA module — PDF ingest, extraction, and a search page over the local's contract
- [ ] Build the pay calculator driven by that local's actual pay table (config, not code)
- [ ] Build the pension and DROP calculator driven by that local's pension plan parameters (config, not code)
- [ ] Build the 457/retirement summary page from the local's retirement vendor info
- [ ] Build the benefits, vacation/leave/incentive, and documents/links pages from the local's content pack
- [ ] Build the union updates/events page with board-officer editing
- [ ] Stand up a second firefighter local on a different state/pension system end-to-end as a stress test of the configuration schema
- [ ] Write the onboarding runbook — intake checklist, configuration steps, deploy steps, handover to the local's board officer
- [ ] Recruit three design-partner pilots total (own local + the second local + at least one more) with a written setup/license + annual fee proposal
- [ ] Capture willingness-to-pay signals from the three pilots before setting pricing
- [ ] Set concrete setup/license and annual recurring numbers from pilot data, not from a guess
- [ ] Define the annual maintenance tier SLA — what the annual fee buys, how CBA/pay-table changes get incorporated

## Phase 2: Deploy

- [ ] Promote the second-local deployment to a production-ready setup (domain, HTTPS, backups, monitoring)
- [ ] Onboard the third pilot local using the runbook end-to-end
- [ ] Capture setup time per new local in hours across the three pilots — the proxy for service-intensity scaling risk
- [ ] Document the cross-local comparison dataset as a roadmap item, gated on a paying customer base asking for it
- [ ] Revisit vertical expansion to police / other public-sector unions only after the firefighter path is paying and repeatable

_Lúa generated this analysis automatically on 2026-08-15_
