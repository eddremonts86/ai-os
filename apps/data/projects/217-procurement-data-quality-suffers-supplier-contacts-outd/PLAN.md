---
id: "217"
slug: procurement-data-quality-suffers-supplier-contacts-outd
title: "Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing tools are slow, expensive, or built for the wrong region."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: b2b
date: "2026-03-10"
tags: [B2B, Procurement, Data]
country: Brazil
tech: [Python, FastAPI, PostgreSQL, Redis, Playwright, Next.js]
---
# Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing tools are slow, expensive, or built for the wrong region.

## Tech Stack

Python + FastAPI for the orchestration. PostgreSQL for the supplier data. Redis for the refresh job queue. Playwright for the contact and price refresh. Next.js for the dashboard. Server in Brazil for data residency.

## Architecture

Spreadsheet import → enrichment pipeline → dashboard → weekly refresh → per-supplier decision history. Each enrichment is logged and reversible. Per-tenant isolation of data.

## Milestones

M0 — spreadsheet import and basic dashboard. M1 — enrichment pipeline for one domain. M2 — weekly refresh. M3 — decision history. M4 — 100 procurement teams in pilot.

## Risks

Enrichment may guess wrong on a small supplier with no public footprint. Pricing data may be misleading if scraped without consent. Competitor scaring tactics if the service is seen as a supplier-relationship database. Costs of repeated enrichment can grow.

## Data Model

## Integrations

Python + FastAPI for the orchestration. PostgreSQL for the supplier data. Redis for the refresh job queue. Playwright for the contact and price refresh. Next.js for the dashboard. Server in Brazil for data residency.
