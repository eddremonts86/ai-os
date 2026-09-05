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

## Problem

The author spent years working in their family's tiling/painting/decorating business. The trade work was fine; what they hated was getting home after a day on site and then sitting down to write quotes, send invoices and chase customers. Snapquo exists because of that lived experience, not because the author observed it from outside. After measuring up jobs and talking to customers all day, the team still had to write quotes once home. Snapquo is mobile and web, designed for on-site or office use, and turns a quote into a customer-accepted, signed, deposit-taking, invoice-generating flow.


---

## Objective

Give small trade businesses a single tool to build quotes on site, get customer signatures and deposits, follow up automatically, convert quotes into invoices, and take online payments — without dragging them into a heavyweight CRM.


## Target Users

Tradespeople and very small trade businesses (tiling, painting, decorating, similar) who run on their phone or a laptop and need to quote and invoice quickly without adopting a complex CRM. Assumes they already deal with customers who accept quotes by signature and pay deposits.


## MVP Scope

- Build a quote quickly from a phone or the web; add photos and optional extras.
- Customer acceptance and signature on the quote.
- Take a deposit on a quote.
- Automatic follow-ups for open quotes.
- Quote-open tracking.
- Saved prices for reuse.
- Convert a quote into an invoice.
- Online payments on the resulting invoice.
- A pipeline and win/loss view for the business.
- iPhone, Android and web clients.
- Free calculators: VAT, CIS, day-rate, invoice generator, etc.
- Intentionally NOT a full CRM.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source explicitly states the product must not become a 'massive CRM with loads of features a small trade business probably doesn't need'.
- Multi-platform delivery (iOS, Android, web) is in scope from day one.
- Payments are online (card/wallet); the source does not detail which providers.
- No stated pricing model in the source post.

