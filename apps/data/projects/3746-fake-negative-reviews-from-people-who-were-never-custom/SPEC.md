---
id: "3746"
slug: fake-negative-reviews-from-people-who-were-never-custom
title: "Fake negative reviews from people who were never customers are appearing on Google Business. Extortionists offer to remove them for money. Google won't help. Need a real solution"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/bgkxok2tu1-fake-negative-reviews-from-people-who-we"
category: business
date: "2026-08-29"
tags: [Business, Security, Marketing, Other]
country: USA
wtp: unspecified (extortion pain implies SMB WTP)
tech: [TypeScript, Node.js API, SQLite + Drizzle ORM, Coolify + Docker]
---
# Fake negative reviews from people who were never customers are appearing on Google Business. Extortionists offer to remove them for money. Google won't help. Need a real solution

## Problem

A small-business owner in the USA reports that fake negative reviews from people who were never customers are appearing on their Google Business Profile. Extortionists contact the owner and offer to remove the reviews for money. Google does not act on the takedown request. The owner needs a real solution.

## Objective

Build a defence layer that detects fraudulent reviews early, generates evidence packages that Google Business Profile support is more likely to act on, and surfaces ongoing reputation risk before it becomes a paying-out extortion event.

## Target Users

1. **SMB owner with a Google Business Profile** — the primary user. Holds one or more listings and is the person contacted by extortionists.
2. **Local marketing agency** — operates Google Business Profiles on behalf of multiple SMB clients; needs a portfolio view.
3. **Reputation-management consultant** — uses evidence packages to argue for faster takedown.

## MVP Scope

- Pull reviews from one Google Business Profile via the Business Profile API.
- Flag reviews from accounts that show obvious non-customer signals (no photos, no other reviews on the listing's city, single-review account, posted within hours of another flagged review).
- Generate a documented takedown package: review text, reviewer profile, timeline, prior takedown history, and a template cover letter for Google Business Profile support.
- Daily email digest of new reviews with a risk score, so the owner sees the extortion loop forming before it gets weaponised.
- Stop short of: automated takedown filing (Google's process is slow and bespoke), cross-platform review aggregation (Yelp / TripAdvisor), and pricing.

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- Keep the MVP focused on Google Business Profile only — that is where the poster reports the problem.
- No claims about guaranteed takedown. Google's process is opaque; the MVP improves the evidence, not the outcome.
- Do not store reviewer personal data beyond what Google already publishes.
- No unnecessary external dependencies; the takedown-letter generator and risk-score rules are the product, not a paid LLM call.
