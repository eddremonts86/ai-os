---
id: "3811"
slug: masareef-android-expense-tracker-that-reads-bank-alerts
title: Masareef – Android expense tracker that reads bank alerts on-device
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495918"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Android expense tracker, on-device SMS alert parsing, local transaction store, bank notification templates, local expense categorization, Play Store distribution]
---
# Masareef – Android expense tracker that reads bank alerts on-device

## Tech Stack

Inferred from the title's on-device claim; the capture contains no source code.

- **Android app:** the tracker client, distributed via Google Play.
- **SMS and notification intake:** broadcast receivers and notification listeners feeding alerts into the parser.
- **On-device parser:** local text processing that extracts amount, merchant and timestamp from alert bodies.
- **Local transaction store:** an on-device database holding the ledger, categories and monthly aggregates.
- **Bank format templates:** a per-bank library of message patterns the parser matches against.
- **Review UI:** confirm, correct and dismiss screens for parsed transactions.

## Architecture

- **Alert intake layer:** receives transaction alerts from SMS and notification channels and normalizes them to raw text.
- **Parsing pipeline:** matches each alert against bank format templates, then extracts structured fields locally.
- **Ledger store:** persists transactions on the device with category assignments and time-series queries for monthly totals.
- **Review loop:** surfaces parsed entries for confirmation or correction, feeding corrections back into template quality.
- **Play distribution:** the only named distribution channel in the capture.

## Milestones

1. **M0 — Ingest and store.** Alerts arrive and raw text lands in a local store on a test device.
2. **M1 — Parse the common formats.** Amount, merchant and timestamp extract correctly for a first set of bank formats.
3. **M2 — Ledger and review.** Categorized monthly totals with a confirm, correct and dismiss flow, corrections improving templates.
4. **M3 — Coverage and release.** Parser coverage expands across more banks; the app ships on the Play Store.

## Risks

- **Channel fragility:** SMS permission tightening or notification-access changes could cut the intake path.
- **Format sprawl:** every new bank and region adds parser work; coverage is a treadmill.
- **Silent misparses:** a wrong amount in the ledger is a trust-killing defect that users may not notice immediately.
- **Thin capture:** the whole plan rests on a title and a store link; the real app may differ.
