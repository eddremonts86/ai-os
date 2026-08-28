---
id: "834"
slug: protection-against-fraudulent-schemes-in-trading-and-cr
title: Protection against fraudulent schemes in trading and cryptocurrency investments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/lux1195af1-protection-against-fraudulent-schemes-in"
category: finance
date: "2025-11-18"
tags: [Finance, Legal, Other]
country: Madagascar
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Protection against fraudulent schemes in trading and cryptocurrency investments

## Problem

A retail investor in trading or cryptocurrency wants to know whether an opportunity is a known fraudulent scheme before they put money in. The post, filed under "Finance" with a Legal tag from Madagascar, frames the gap as detection before commitment. Source names no specific scheme type, no platform, no amount lost.

## Objective

Give a retail investor in Madagascar one place to check a trading or cryptocurrency opportunity against a list of known fraudulent schemes before they commit funds.

## Target Users

Retail investors in Madagascar who face trading and cryptocurrency schemes and want a pre-commitment check. Secondary: the consumer-protection and financial-regulator functions that already publish warnings but in places the investor does not read first.

## MVP Scope

- A short check that takes the scheme description or the platform name and returns a verdict from a known-schemes database.
- A known-schemes database sourced from public regulator and consumer-protection lists, versioned by date.
- A short explainer per match that names the regulator warning and the date, without inventing legal conclusions.
- A "report a scheme" intake that records cases not yet in the database.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Country of submission is Madagascar; consumer-protection law and crypto regulation are local and not addressed by the post.
- Source names no specific scheme; the MVP scheme taxonomy must come from the regulator lists it references, not invented.
- The product is a detection aid, not legal advice; the UI must say so before the verdict is rendered.
- No named competitor appears in the source.
