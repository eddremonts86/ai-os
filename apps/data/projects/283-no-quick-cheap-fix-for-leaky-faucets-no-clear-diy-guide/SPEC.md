---
id: "283"
slug: no-quick-cheap-fix-for-leaky-faucets-no-clear-diy-guide
title: "No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/e59sb30221-no-quick-cheap-fix-for-leaky-faucets-no"
category: other
date: "2025-12-01"
tags: [Other]
country: India
tech: [Flutter mobile app, Dart, SQLite offline cache, Firebase Auth, WhatsApp Business API, Razorpay]
---
# No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber

## Problem

In Indian middle-class households, a leaking bathroom or kitchen faucet is a daily nuisance that households want fixed fast and cheap. The title says two failures stack here: there is no concise, India-specific DIY guide that walks a non-technical person through diagnosing which washer, O-ring, or cartridge their tap actually needs, and the plumber alternatives they can find via local contacts are expensive for the size of the repair or simply not reachable at short notice. A household ends up either tolerating the leak, paying a call-out fee that dwarfs the cost of a ₹20 washer, or buying a full replacement tap when only a 50 paise seal failed.

## Objective

Ship a phone-first app that turns 'tap is dripping' into a 90-second diagnosis, a parts list with Indian retail links, and either a guided DIY repair or a booking with a vetted local plumber — whichever fits the user's time and skill. Reduce the cost and time of resolving a typical Indian household faucet leak by an order of magnitude versus the call-a-plumber default.

## Target Users

Urban and semi-urban Indian homeowners and tenants dealing with a single dripping tap in a bathroom or kitchen. Adults 25–55, comfortable with a smartphone, limited plumbing knowledge, with a household budget where a plumber visit at ₹300–600 is a noticeable line item. Secondary: independent local plumbers who want a steadier flow of small jobs without marketing themselves.

## MVP Scope

Symptom chooser (drip from spout, drip from base, low pressure, handle stiff) with short video clips showing the typical cause. Decision tree that maps symptom → likely part (washer, O-ring, cartridge, supply hose) → part photo and a 3-step replacement procedure. Indian parts catalogue with images, MRP, and direct purchase links to Amazon.in, Flipkart, or nearby local hardware stores via pin-code lookup. DIY mode: timer-based checklist with photo checkpoints. Plumber mode: book a vetted plumber within a 4-hour window in pilot cities (Bengaluru, Mumbai, Pune, Hyderabad), with fixed-price slabs per repair type. In-app chat with the assigned plumber. Post-repair rating and a history log per household tap.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/other/e59sb30221-no-quick-cheap-fix-for-leaky-faucets` follows the constraints in `283-.../SPEC.md` and the chosen stack (Flutter mobile app, Dart, SQLite offline cache). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must run on low-end Android (Android 8+, 2GB RAM) and survive patchy connectivity — diagnosis steps cached locally after first view. Plumber pool must be verified (photo ID + work sample) before being shown to users. No live video plumbing sessions in v1; chat and step-by-step photos only. Prices shown in INR with GST-inclusive totals; no hidden fees.
