---
id: "737"
slug: moving-with-furniture-is-a-weeks-long-headache-no-servi
title: "Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/9na53d57r1-moving-with-furniture-is-a-weeks-long-he"
  captured: "2026-05-27"
category: logistics
date: "2026-05-27"
tags: [Logistics, Transportation, Retail, Other]
country: USA
wtp:
  raw: "40-50% commission to a service"
  currency: USD
  period: one-shot
  min: 40
  max: 50
  mrrMid: 0
tech: [TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, React for ops console, third-party pickup logistics APIs]
---
# Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (intake form tokens, manifest preview, payout-report layout)
- [ ] Lock the share-percentage policy (40 / 45 / 50% of realised sale) and document the rationale in the signup flow
- [ ] Define the markdown + donate policy after pickup (day-30 auto-discount, day-90 donate)
- [ ] Provision SQLite + Drizzle schema: manifests, items, sales, payouts, dispatch exports
- [ ] Pick the launch metro based on a 90-day pre-launch form-fill waiting list

## Phase 1: Core

- [ ] Intake web form: address, furniture count, photos, target move-out date, contact, tier selector (full buyout vs on-site buyout)
- [ ] Auto-generated per-item manifest from photos (item description + condition tier A/B/C + estimate), shown to the household for approval before pickup
- [ ] Household e-signs the manifest; signing locks the tier and the items the operator must take
- [ ] Daily route manifest export to the third-party dispatcher; read-only integration, no dispatch control in v1
- [ ] Ops console: per-item intake grading confirmation, photo upload to the resale channel, listing creation, sale price recording
- [ ] Manifest adherence check: any item on the signed manifest missing at pickup triggers an automatic apology email and partial deposit refund
- [ ] Resale accounting: per-item sale recording, fee split, household share calculation
- [ ] ACH payout engine running on the 1st and 15th of each month for items sold in the prior window
- [ ] Household report page: realised sale, fee split, net share, item-by-item line — on one screen, no buried appendix
- [ ] On-site buyout tier: instant offer at intake, same-day ACH or check, no resale accounting
- [ ] End-to-end test: household submits photos → manifest approved → pickup → items listed → item sells → payout sent → household opens the report

## Phase 2: Deploy

- [ ] Warehouse lease + two pickup crews in the launch metro
- [ ] Pilot 25 moves; collect household-satisfaction survey on every job
- [ ] Resale-velocity dashboard: % of items sold within 30 / 60 / 90 days
- [ ] Marketing landing page that contrasts the "40-50% of realised sale" model against Remoov's "pennies after expenses" example
- [ ] Post-pilot retrospective at week 14: revisit share %, tier mix, launch-metro economics
