---
id: "4164"
slug: i-built-snapquo-because-i-hated-doing-quotes-and-invoic
title: I built Snapquo because I hated doing quotes and invoices at night
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511368"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# I built Snapquo because I hated doing quotes and invoices at night

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — fits the web app and API behind Snapquo. Native iOS and Android apps are separate codebases wrapping or sharing the same API; they are not changed here. SQLite/Drizzle holds quotes, invoices and pipeline state; payments go through a third-party processor.

## Architecture

Multi-tenant SaaS: each trade business is a workspace with customers, quotes, invoices, and a pipeline. Quote and invoice objects are first-class; signatures and deposits are attached to quotes. A web app (TanStack Start) and native iOS/Android clients share a JSON API. Payments go through a third-party processor; webhooks update invoice state. Coolify hosts the backend behind Docker.

## Milestones

- M1 — Quote builder with photos, optional extras and saved prices.
- M2 — Customer acceptance and signature on a quote.
- M3 — Deposit capture via online payments.
- M4 — Automatic follow-ups and quote-open tracking.
- M5 — Quote-to-invoice conversion and online payment on the invoice.
- M6 — Pipeline and win/loss view.
- M7 — iOS, Android and web clients in the same UX.
- M8 — Free calculators (VAT, CIS, day-rate, invoice generator).

## Risks

- iOS/Android native apps are the most expensive platform to maintain; mitigation is to share API contracts and keep client logic thin.
- Payment provider risk; mitigation is to pick a provider that owns PCI scope and supports webhooks.
- 'Feature creep toward a CRM' is a discipline risk; mitigation is to write a one-page 'what we are not' guide and revisit it before each release.
- Source post mentions Checkatrade by name; mitigation is to make sure Snapquo complements — not competes with — listing sites.
