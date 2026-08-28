---
id: "843"
slug: low-trust-level-in-nigerian-e-commerce-due-to-lack-of-r
title: Low trust level in Nigerian e-commerce due to lack of reliable logistics service
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: logistics
date: "2025-11-14"
tags: [Logistics, Other]
country: Nigeria
tech: [Node.js API (Fastify), TypeScript, Postgres, Coolify, Docker]
---
# Low trust level in Nigerian e-commerce due to lack of reliable logistics service

## Tech Stack

Node.js API (Fastify), TypeScript, Postgres, Coolify, Docker.

## Architecture

API polls or hooks multiple Nigerian couriers, normalizes their status into one event stream, and serves a public tracking page per shipment. Dashboard is a small Vue SPA.

## Milestones

- M1: single-courier tracking aggregation
- M2: multi-courier normalization and SLA label
- M3: WhatsApp-shareable link and seller dashboard

## Risks

Multi-tenant API in front of public courier tracking endpoints. No scraping of courier sites beyond their public tracking pages.

- Couriers change their public endpoints often; treat the integration layer as the fragile surface.
- Trust is built over months of accurate tracking; do not promise more than the data supports.
