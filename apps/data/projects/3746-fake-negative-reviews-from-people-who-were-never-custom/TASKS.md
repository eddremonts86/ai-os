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

## Phase 0: Scaffold

- Stand up the Node.js service skeleton on Coolify.
- Wire Google Business Profile OAuth and the per-listing review pull.
- Define the SQLite schema for reviews, reviewers, daily digests, and takedown packages.
- Build the rules engine for the risk score (single-review account, no photos, posted in cluster).
- Render the takedown package as a printable PDF and an email-friendly HTML.
- Schedule the daily digest; add a small dashboard for the takedown-letter editor.
- Hand-test with one real listing; iterate on the risk-score thresholds.

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- Owner can pull a takedown package in under five minutes from a flagged review.
- Daily digest lands in the owner's inbox with a clickable list of new reviews.
- Risk-score rules have a documented rationale and are tunable from the dashboard.
- Test coverage on the rules engine and the takedown-package renderer.

## Phase 2: Deploy

- Production deploy on Coolify behind HTTPS.
- Monitor API quota and digest send failures.
- Capture the first three real takedown attempts as case studies for future customers.
- Document the Google API approval process so the next signup does not hit the gating surprise.
