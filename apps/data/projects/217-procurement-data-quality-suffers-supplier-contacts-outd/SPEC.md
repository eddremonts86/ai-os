---
id: "217"
slug: procurement-data-quality-suffers-supplier-contacts-outd
title: "Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing tools are slow, expensive, or built for the wrong region."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: b2b
date: "2026-03-10"
tags: [B2B, Procurement, Data]
country: Brazil
tech: [Python, FastAPI, PostgreSQL, Redis, Playwright, Next.js]
---
# Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing tools are slow, expensive, or built for the wrong region.

## Problem

Procurement teams in Brazil and surrounding regions keep their supplier data in spreadsheets and emails. Contacts go stale within months, prices drift, and decision history (why we chose this supplier, when we last negotiated) is lost. Existing procurement tools (Coupa, Ariba, SAP) are slow, expensive, and built for the US/EU market. Local alternatives (TOTVS, Oracle NetSuite for Brazil) are aimed at large enterprises and do not address the data-quality problem directly. What is missing is a service that ingests a procurement team's existing spreadsheet trail, enriches supplier contacts, refreshes prices on a cadence, and preserves the decision history in a structured way — without requiring months of implementation.

## Objective

A lightweight procurement data service that takes a Brazilian SMB's existing supplier spreadsheet, enriches it, refreshes it on a schedule, and preserves decision history in a structure the team can actually use.

## Target Users

SMB procurement teams in Brazil and Latin America (5-50 people) whose supplier data lives in spreadsheets and whose procurement decisions are losing auditability as the team grows.

## MVP Scope

Spreadsheet import (CSV, XLSX). Supplier enrichment (web lookup for company data, contact refresh, price-band estimate). Weekly refresh job. Decision history per supplier (notes, contracts, last-negotiated). Web dashboard with a list view and a per-supplier page. No full RFQ-to-pay workflow in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `217-.../SPEC.md` and the chosen stack (Python, FastAPI, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Brazil.

For Brazil, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Data must stay in-region (Brazil). No uploads to global SaaS providers. Refresh must respect the source's own robots.txt. Cost must stay under a small-team budget per month. No AI surprises (every enrichment must be auditable).
