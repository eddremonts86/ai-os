---
id: "289"
slug: a-year-of-searching-for-an-affordable-solution-for-remo
title: A year of searching for an affordable solution for remote US business opening wi
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/xnzvy42z31-a-year-of-searching-for-an-affordable-solution"
category: business
date: "2025-10-29"
tags: [Business, Legal, Finance]
country: USA
tech: [Next.js 14, TypeScript, Postgres, Stripe Connect, dLocal (payment for non-US cards), DocuSign API, Clerky compliance workflow, Hetzner]
---
# A year of searching for an affordable solution for remote US business opening wi

## Problem

Foreign entrepreneurs who are not US residents or green-card holders want to open a US business — most often a Wyoming or Delaware LLC — without flying to the US, paying a US-resident-agent markup, or hiring an immigration-aware attorney at $1,500+ per filing. The title records that the search lasted a year: the affordable paths that exist (clerkly-tier services) target US residents, and the resident-agent bundles that claim to be 'non-resident friendly' either add 2–4× the price or skip the EIN/ITIN step that is the real bottleneck.

## Objective

Ship a guided, end-to-end path for a non-US-resident to form a US LLC, get an EIN, set up a US bank or Mercury-style fintech account, and stay compliant for the first year, at a flat transparent price below the market floor for the same workflow. Outcome: the entrepreneur goes from 'I want a US LLC' to 'I have a US bank account and an EIN' in 7–14 days without flying to the US.

## Target Users

Non-US-resident founders (most commonly from India, Nigeria, Brazil, Pakistan, the Philippines, Mexico, the UK, and Germany) who want a US LLC to invoice US customers, hold a US Stripe account, or position a US entity for fundraising. Adult entrepreneurs with a passport and a US tourist visa or visa-waiver entry. Secondary: existing US-formation services that want a non-resident arm without building the ITIN/EIN path themselves.

## MVP Scope

Eligibility quiz: does the user actually need a US LLC vs a non-US entity + Stripe Atlas? Step-by-step formation flow: state picker (Wyoming / Delaware / New Mexico) with reasoning, articles of organisation filing via state API or registered-agent partner, operating agreement template (DocuSign). EIN application via IRS fax/mail shortcut (no SSN/ITIN required path is documented in IRS instructions). US business bank account setup via a Mercury/Brex/Relay partner with non-resident-friendly onboarding. Stripe Atlas if eligible. First-year compliance checklist: annual report, registered agent, state franchise tax reminders.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/business/xnzvy42z31-a-year-of-searching-for-an-afford` follows the constraints in `289-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must not give legal advice; the product is a workflow, not a substitute for an attorney. Disclaimers per service step (registered agent, EIN, bank account) are explicit. Pricing must be transparent — no surprise add-ons at checkout. State picker defaults to the lowest-cost + non-resident-friendly path (Wyoming) and explains why. KYC for the entrepreneur uses passport + selfie; the registered-agent partner's KYC is delegated, not duplicated.
