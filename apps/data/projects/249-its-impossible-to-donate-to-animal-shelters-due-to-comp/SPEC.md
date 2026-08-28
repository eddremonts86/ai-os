---
id: "249"
slug: its-impossible-to-donate-to-animal-shelters-due-to-comp
title: "It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/1adxzgi7b1-its-impossible-to-donate-to-animal-shelt"
category: other
date: "2026-01-17"
tags: [Other]
country: Russia
---
# It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit

## Problem

In Russia, people who want to support animal shelters do not donate because they do not trust the fundraisers that stand between them and the shelter. Distrust is not abstract: it covers concerns that money is skimmed, that "rescued animal" stories are fabricated, that overhead eats the donation, and that no one verifies what happened after the money was collected. The poster names the gap as a missing service with *guaranteed transparency and audit*.

The post is short. It does not quote specific charities, scandals, ruble amounts, or shelter counts. The framing is structural: the missing piece is verifiable proof that money and goods reached the shelter and produced a specific outcome (an animal fed, vaccinated, treated, rehomed).

## Objective

Build a service that connects a donor to a specific shelter and gives the donor a verifiable, ongoing record of how their contribution was spent — including a third-party audit trail the donor can inspect. The output is not a one-time receipt; it is a chain of evidence the donor can revisit and share.

The MVP focuses on a small set of partnered shelters and a small set of recurring donation types (food, veterinary care, shelter utilities), so the audit trail can be kept narrow and verifiable. Crowdfunding a specific animal is intentionally not in scope — that model is what the poster's framing rejects.

## Target Users

- Russian donors who want to support animal welfare but currently refuse to donate because they do not trust the intermediary.
- Donors who have donated in the past, lost confidence, and stopped.
- Shelter operators who would accept third-party audits if it brought in more sustainable funding.
- Independent journalists and charity watchdogs who would use the audit trail as a public accountability tool.

The source frames the user as the donor. The shelter is named as the destination of the donation, not as a buyer of the service.

## MVP Scope

- A profile page per partner shelter: location, capacity (number of animals), staff, monthly operating cost, and the specific line items the shelter needs covered (food, vet, utilities).
- A donation flow: the donor picks a shelter, picks a line item (e.g., "veterinary care for the next month"), and pays. The donation is held by the service, not transferred directly to the shelter.
- An expense ledger: the shelter uploads receipts (invoices, vet bills, supplier delivery notes) tagged against each line item. Receipts are timestamped and publicly viewable.
- A monthly audit report per shelter, published by an independent auditor (a contracted accountant or a watchdog organization), confirming which expenses were verified against receipts.
- A donor view that shows "your donations in 2026 funded 14kg of feed and 3 vet visits at Shelter X," with the underlying receipts linked.

The MVP does not include direct bank-to-shelter transfers (the donor's distrust is precisely about that path). It does not include general crowdfunding or "save this animal" campaigns.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/other/1adxzgi7b1-its-impossible-to-donate-to-animal-s` follows the constraints in `249-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The money path must be observable. If the service holds funds and disburses them on receipt approval, the donor sees the path; if it transfers in bulk and asks the shelter to account later, the donor's distrust is not addressed.
- Audit independence: the auditor must not be the service operator, the shelter, or a paid vendor of either. The MVP must contract or partner with a genuinely independent auditor.
- Receipt quality varies. A photo of a hand-written supplier note is not the same evidence as a tax invoice from a vet clinic. The MVP must publish the receipt *as submitted* and let the auditor's confirmation carry the weight, not pretend the receipts are uniform.
- Russian-language output. The donor audience is Russian; receipts and copy stay in Russian.
- The MVP must not pick a side on what "good" animal welfare looks like (no-kill vs. euthanasia policy, breed-specific rescue, etc.). It only verifies that money went where the donor was told it would go.
