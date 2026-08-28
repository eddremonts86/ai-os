---
id: "831"
slug: a-year-of-searching-for-an-affordable-solution-for-remo
title: A year of searching for an affordable solution for remote US business opening without citizenship
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/zosvs04rp1-a-year-of-searching-for-an-affordable-so"
category: business
date: "2025-11-20"
tags: [Business, Legal, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A year of searching for an affordable solution for remote US business opening without citizenship

## Problem

A non-citizen, non-resident founder spent a year looking for an affordable way to open a US business remotely. The post, filed under "Business" with a Legal tag from the USA, frames the pain as a search that did not resolve — not as a single missing feature. Source names no specific entity type, no state, no price the founder would have called affordable.

## Objective

Give a non-citizen, non-resident founder one path through the US business-formation paperwork, with the cost shown before the founder pays anything and the steps doable remotely.

## Target Users

Non-citizen, non-resident founders who want to open a US business from outside the country without paying for an avoidable agent step on every form. Secondary: the small legal and formation services that already serve this market but price out the budget-conscious founder.

## MVP Scope

- A short eligibility check that confirms the founder can open a US business from outside the country without a US visa.
- An entity-type picker (LLC, C-Corp, single-member) with the trade-offs the founder has to read, not invented.
- A step-by-step formation flow per state with the filings, fees, and registered-agent requirement called out.
- A cost summary before the founder pays anything.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Country of submission is USA; entity-formation rules and registered-agent requirements are per-state and must be confirmed, not assumed.
- Source names no price the founder calls affordable; any "affordable" claim on landing pages must come from interviews, not from this post.
- Legal advice is regulated; the product is a workflow tool, not a substitute for a lawyer, and must say so.
- No named competitor appears in the source.
