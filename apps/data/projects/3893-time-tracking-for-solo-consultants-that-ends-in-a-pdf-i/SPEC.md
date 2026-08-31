---
id: "3893"
slug: time-tracking-for-solo-consultants-that-ends-in-a-pdf-i
title: "Time tracking for solo consultants that ends in a PDF invoice"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497476"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [timer engine, PDF generation, local-first storage, offline PWA, currency formatting, client management]
---
# Time tracking for solo consultants that ends in a PDF invoice

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://hourtobill.com/demo. The product claim carried by the title is a time-tracking tool built for solo consultants whose workflow ends in a PDF invoice: hours are tracked, and the tracked time becomes an invoice document the consultant can send. The capture states nothing else — no feature list, no pricing, no user stories and no technical details.

## Objective

Build the MVP the title promises: a solo consultant starts and stops a timer against a client, the tool accumulates billable hours, and at the end of a period it exports the tracked time as a PDF invoice. The demo URL in the capture suggests a walkthrough-first product, so the MVP should be demonstrable end to end in minutes.

## Target Users

- Solo consultants billing by the hour who currently juggle a timer and a separate invoicing step.
- Freelance developers, designers and coaches whose month-end ritual is reconstructing timesheets.
- Contractors who need a clean PDF artifact clients will actually pay from.

## MVP Scope

- Client setup with hourly rate.
- Start/stop timers per client with a running session log.
- An hours ledger that accumulates tracked sessions.
- One-click PDF invoice generation from the ledger, matching the demo URL's promise.

## Constraints

- The source is a bare URL plus title; workflow details beyond time tracking ending in a PDF invoice are ours to define.
- Invoice compliance (taxes, numbering) varies by country; the MVP must keep the invoice simple and not promise legal compliance.
- The demo URL implies a demo-first product; the MVP needs a working demo path before anything else.
- No pricing, user counts or competitive claims exist in the capture; none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
