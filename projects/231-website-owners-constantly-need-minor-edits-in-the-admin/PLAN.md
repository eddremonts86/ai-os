---
id: "231"
slug: website-owners-constantly-need-minor-edits-in-the-admin
title: Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute changes. Need an AI that resolves those edits in plain English.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: ai
date: "2026-01-28"
tags: [AI, Web, CMS]
country: USA
tech: [Python, FastAPI, Claude API, PostgreSQL, React, WordPress]
---
# Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute changes. Need an AI that resolves those edits in plain English.

## Tech Stack

Python + FastAPI for the orchestration. Claude API for the intent interpretation. PostgreSQL for the audit log. React for the dashboard. WordPress REST API for the first integration. Webflow and Shopify APIs second.

## Architecture

Plain-English request → intent interpretation → CMS API call → before/after preview → approval → audit log. Per-CMS adapter. Per-tenant isolation of the audit log.

## Milestones

M0 — WordPress integration with plain-English edits. M1 — before/after preview. M2 — Webflow and Shopify. M3 — 100 users in pilot. M4 — public launch with a clear no auto-apply stance.

## Risks

AI may misinterpret a request and apply the wrong change. Multi-CMS support is non-trivial. Audit log must be tamper-proof. Role permissions must be respected to avoid privilege escalation.

## Data Model

## Integrations

Python + FastAPI for the orchestration. Claude API for the intent interpretation. PostgreSQL for the audit log. React for the dashboard. WordPress REST API for the first integration. Webflow and Shopify APIs second.
