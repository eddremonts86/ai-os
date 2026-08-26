---
id: "807"
slug: clients-struggle-to-verify-the-competence-and-pricing-h
title: "Clients struggle to verify the competence and pricing honesty of freelancers when creating websites — there is no AI tool for real-time proposal analysis."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/8zqy6g4g71-clients-struggle-to-verify-the-compet"
  captured: "2026-01-03"
category: freelance
date: "2026-01-03"
tags: [Freelance, AI, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Clients struggle to verify the competence and pricing honesty of freelancers when creating websites — there is no AI tool for real-time proposal analysis.

## Problem

A US client evaluating freelance proposals for a website build has no fast way to spot inflated scopes, padded hours, vague deliverables, or claims that don't match the freelancer's prior public work. Comparing 5–10 proposals side-by-side is a manual spreadsheet exercise; by the time the client notices the padded line items they have already shortlisted and replied. The post names the failure: clients overpay, freelancers who pad win the work, and the honest freelancers lose because their proposals look thin next to inflated ones.

## Objective

Ship a proposal-analysis tool for clients that takes one or more freelancer proposals as input and returns a side-by-side comparison with red flags called out — inflated hours, scope that doesn't match the brief, vague acceptance criteria, prior-work mismatch, and price-vs-scope sanity checks — so the client can spot the bad-faith proposals before responding.

## Target Users

- Primary: SMB and startup clients in the US evaluating 3+ freelancer proposals for a website or app build.
- Secondary: agency procurement leads and fractional CTOs doing the same comparison work for portfolio companies.

## MVP Scope

- Paste-in or PDF/DOCX upload of one proposal at a time; the tool parses line items, hours, deliverables, and price into a normalised structure.
- Side-by-side comparison view across up to 5 proposals: line items matched on similarity, hours-vs-scope ratio, deliverable specificity score, and a price-vs-scope sanity band per deliverable type.
- Red-flag callouts: hours-per-deliverable that exceed the 90th-percentile band for the deliverable type; deliverables with no acceptance criteria; line items the brief didn't ask for.
- Public-work match: the freelancer's claimed prior work (URLs in the proposal) compared against the freelancer's actual public portfolio pulled from the web — flag mismatches.
- Export the comparison as a PDF the client can share with a co-founder or board member.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/freelance/8zqy6g4g71-clients-struggle-to-verify-the-compet` follows the constraints in `807-.../SPEC.md` and the chosen stack (React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM). The visual language follows `DESIGN.md`: neutral surface, single primary accent, dense table-driven comparison view.

For USA, the defaults lean toward left-to-right reading, USD currency glyph, MM/DD/YYYY date format, and English-only output. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface, one accent for primary actions, one muted accent for red-flag callouts. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for hour/cost numbers. Type scale is small (4 steps).

**Density** — table-driven side-by-side comparison; generous spacing on the per-proposal detail view.

**Motion** — minimal: page transitions only when the user explicitly navigates.

## Constraints

- Red flags must cite the underlying signal (e.g. "this line item exceeds the 90th-percentile band for 'custom CMS integration' at this scope").
- Public-work mismatch checks are advisory only — the tool flags, the client decides.
- Proposal content stays on-device by default; sync to a hosted backend is opt-in and end-to-end encrypted.
- Must run on a $5/month VPS via Coolify + Docker; no managed services that would push infra cost above that ceiling.