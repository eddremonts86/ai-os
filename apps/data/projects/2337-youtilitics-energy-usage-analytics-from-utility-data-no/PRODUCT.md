---
id: "2337"
slug: youtilitics-energy-usage-analytics-from-utility-data-no
title: "Youtilitics, energy usage analytics from utility data, no hardware"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49380974"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Youtilitics, energy usage analytics from utility data, no hardware

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I posted an early version of this 2 years ago. Rebuilt most of it since then, so posting again with what's actually different.Youtilitics still pulls interval data your utility already collects (Green Button/ESPI — 15-60 min whole-house kWh) and turns it into usage analytics.
The analytics stack is different: baseline anomaly detection (median/MAD by time-of-day bucket, not a flat threshold), overnight step-change alerts, usage heatmaps, cycle-over-cycle comparisons, etc.
It is still based on a model trained on human-labelled data: used to differentiate baseline (eg vampire load) vs EV vs HVAC vs the rest. Inference runs with a python script when new data is received from the utility.I also changed the mobile app. It is still mainly used to store the user credentials without us having them (they never leave the device), for security/privacy reasons. This is used to scrape usage data from the utility dashboard, when they don't support Green Button.
However now it also runs an embedded Python interpreter (serious-python) to embed an opower python library. This seems overkill but that was the best way to have a lot of utilities on board (there are a lot on opower without green button support). Mobile stack is flutter.
Curious if anyone has an opinion on that, I'm not too happy with it but looks like the best compromise.New this year: Youtilitics also expands to business with a focus on management of many doors, not just the home you live in. Allowing property managers, portfolio managers and short term rental owners to get alerts on unusual usage. Similar data & analytics, but with a rollup view and targeted at real estate professionals.Same limitation as 2y ago: data latency is 1+ day, so this is not real-time monitoring like Sense/Emporia. It's a different tool for a different question. "what happened and is it normal," not "what's drawing power right now."
Upside is no hardware required + historical data is available on day 1.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49380974) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
