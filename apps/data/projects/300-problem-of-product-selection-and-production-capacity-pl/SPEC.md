---
id: "300"
slug: problem-of-product-selection-and-production-capacity-pl
title: Problem of product selection and production capacity planning
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/cbc7zd9891-problem-of-product-selection-and-product"
category: business
date: "2025-11-13"
tags: [Business, Manufacturing, Other]
country: India
tech: [Python (FastAPI), Next.js 14, Postgres + TimescaleDB, Prophet forecasting, WhatsApp Business API, Razorpay]
---
# Problem of product selection and production capacity planning

## Problem

Indian small and mid-sized manufacturers (especially in tier-2 and tier-3 cities — Tirupur, Ludhiana, Surat, Moradabad, Kanpur) make product-selection decisions (which SKU to add, which to drop) and production-capacity decisions (how many units to run next week) based on gut feel and yesterday's WhatsApp forwards. The title records the gap as a planning failure: they under-produce a hot SKU and lose a season, or over-produce a cold SKU and eat the inventory. There is no accessible decision support that combines last season's sales, current demand signals, and capacity constraints into a 'produce this much' answer.

## Objective

Ship a planning product that ingests a manufacturer's order history and gives a weekly 'produce X units of Y SKU' recommendation, with the reasoning and a confidence score. Outcome: a small Indian manufacturer cuts obsolete inventory by a meaningful margin and stops missing hot-SKU seasons.

## Target Users

Indian small and mid-sized manufacturers in apparel, textiles, handicrafts, light engineering, food processing. Owners and operations managers who already use WhatsApp for orders and want a planning surface that does not require an ERP. Secondary: regional industry associations (Tirupur Exporters' Association, Surat Textile Traders) that want a planning benchmark for their members.

## MVP Scope

Order history ingest via WhatsApp forwards, CSV upload, or direct integration with a basic Tally/Zoho Books export. Demand-forecasting per SKU via Prophet (Facebook) with seasonality and Indian-festival calibration (Diwali, Eid, Holi, wedding season). Capacity-constraint solver: how many units of each SKU given the available machine-hours and labour. Weekly 'produce this much' recommendation delivered to WhatsApp. Reasoning and confidence score per recommendation.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/business/cbc7zd9891-problem-of-product-selection-and-` follows the constraints in `300-.../SPEC.md` and the chosen stack (Python (FastAPI), Next.js 14, Postgres + TimescaleDB). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must run on low-end Android (operators often work from a phone). INR pricing throughout. No ERP required in v1; CSV / Tally export is enough. Hindi + English UI in v1. Recommendations must include 'why this number' so the owner can sanity-check; no black-box AI decisions.
