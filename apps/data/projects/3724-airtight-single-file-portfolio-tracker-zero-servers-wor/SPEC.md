---
id: "3724"
slug: airtight-single-file-portfolio-tracker-zero-servers-wor
title: "Airtight – single-file portfolio tracker, zero servers, works offline"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487783"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Single-file HTML, JavaScript, IndexedDB, CSV parsing, no backend]
---
# Airtight – single-file portfolio tracker, zero servers, works offline

## Problem

The captured source is a one-line Show HN pitch: "track your portfolio from CSV exports, nothing leaves your browser." Reading that literally, the project is a portfolio tracker that runs entirely in the browser, takes CSV exports from brokers as the input, and never sends data to a server. The post does not name the brokers supported, the metrics produced, or the visualization; the constraint ("nothing leaves your browser") is the headline.

The underlying problem this responds to is a privacy / trust one: existing portfolio trackers want a read-only API key to the user's brokerage, or an email signup that puts holdings in someone else's database. A user who is uncomfortable with that — and many privacy-minded investors are — has no good option short of opening CSV exports in a spreadsheet and hand-rolling formulas. The "single-file" framing implies the author also wanted something you can save to disk, run from a USB stick, or open offline.

The source does not state the file format of the CSV, the units, or whether it supports cost basis, lot tracking, or tax lots. Those choices live in the project, not in the post.

## Objective

Ship a single-file HTML portfolio tracker that ingests broker CSV exports in the browser, computes the metrics a retail investor actually wants (current allocation, P/L, concentration), and persists state in the browser only. The MVP targets the "zero servers, zero accounts, zero data egress" promise. It does not target live broker connections, multi-user collaboration, or a hosted SaaS.

## Target Users

- Privacy-minded retail investors who refuse to hand broker read-only API keys to a third-party dashboard.
- Investors who travel or work in environments with intermittent connectivity and want a tracker that runs offline.
- Tinkerers who want a single HTML file they can read, audit, and fork without a build step.

The post does not name advisors, family offices, or enterprise use; the "nothing leaves your browser" framing is single-user by construction.

## MVP Scope

- A single HTML file (plus embedded CSS/JS) that opens in any modern browser with no install step.
- A CSV ingest flow: the user picks a broker CSV export from disk; the file is parsed locally and never uploaded.
- A portfolio model: positions, cost basis (whatever the CSV carries), current value (whatever the CSV or a manual input provides), and P/L.
- A summary view: total value, allocation by symbol / sector, gainers and losers, concentration warnings.
- A persistence layer: the parsed portfolio is saved in the browser (IndexedDB or localStorage) so reopening the file on the same browser keeps state.

The MVP does not include live price feeds, broker API integrations, multi-user accounts, or tax-report generation.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Zero servers: the file is the product. There is no backend, no telemetry endpoint, no CDN dependency the user cannot read at build time.
- Zero data egress: nothing in the parsed portfolio leaves the browser. The MVP must not silently phone home (no analytics, no remote font loads, no error reporting that ships data).
- Offline-first: the tracker must work with the network disconnected after the HTML is loaded.
- Single-file distribution: the artifact a user saves is one file. Build tooling is fine; the deliverable is not.
- CSV-format honesty: the README must state which broker CSV formats are tested, and the parser must fail visibly (not silently misclassify columns) on an unknown format.
