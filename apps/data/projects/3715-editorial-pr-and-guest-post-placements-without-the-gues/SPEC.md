---
id: "3715"
slug: editorial-pr-and-guest-post-placements-without-the-gues
title: "Editorial PR and guest post placements, without the guesswork"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488777"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, SEO, Marketing]
tech: [Next.js, Postgres, Stripe, Ahrefs API, Moz API, Majestic API]
---
# Editorial PR and guest post placements, without the guesswork

## Problem

Marketers and SEO agencies who want editorial coverage or guest-post links today have to juggle a fragmented market: hand-rolled outreach to publishers with no way to verify traffic or authority, marketplace listings with stale prices, and resold inventory whose DR/DA numbers are not actually re-checked. The Show HN post [https://pr.seolutions.biz/](https://pr.seolutions.biz/) markets itself as a vetted guest-post and digital-PR catalog with 1,330 publishers, metrics pulled from ahrefs (DR, RD, traffic), Moz (DA), and Majestic (TF), and a "pay only for live links" workflow. The captured brief is just the URL, so the source-of-truth problem this plan describes is the pain the listing solves: SEO buyers need a single inventory where DR/DA/TF/traffic/niche/price are comparable across publishers, and where the link goes live only after the buyer approves the draft.

## Objective

Ship a transparent guest-post and digital-PR marketplace where every listing exposes comparable third-party SEO metrics, the buyer selects exactly the placements they want before any money moves, and the seller only gets paid after the link is live. The MVP must cover browse + filter + quote, content brief intake, editorial approval, link-purchase invoice, and a post-publication verification step that re-pulls the live URL.

## Target Users

- Primary: in-house SEO managers and link-building specialists at agencies who currently buy placements via email and spreadsheets and want to consolidate the workflow into a single inventory with comparable metrics.
- Secondary: solo founders and growth marketers who do their own link building and want to skip outreach and trust a pre-vetted catalog; tertiary: digital PR teams buying news placements in news niches (Tech, Real Estate, Health, Finance) at higher price points.

## MVP Scope

- A browsable catalog of vetted publishers with filters for niche, DR/DA/TF minima, traffic range, price range, LLM/AEO eligibility, DoFollow-only, sponsored/discreet flags, and ETA.
- A quote builder: select any number of publishers into a single quote, submit a brief, and receive availability confirmation without an upfront payment.
- An editorial approval step: the buyer reviews the draft before it goes live and can request revisions.
- A live-link invoicing flow: invoice is generated only after the link is verified live on the publisher's domain.
- A public metrics panel per publisher: last refresh date, ahrefs DR + traffic + RD, Moz DA, Majestic TF, ETA, sponsored flag.
- Admin back-office to onboard publishers, refresh metrics, and adjudicate disputes.
- No built-in CMS for editorial content; no AI auto-drafter in v1; no programmatic link-exchange network.

## Design Direction

See `DESIGN.md` for this project's design tokens. The catalogue table is the primary surface: dense, scannable, with quick-filter chips (DR50+, DR60+, LLM/AEO, New Only, Bestseller) above the table and an inline Add-to-Quote action per row. Colour palette should be neutral (off-white page, near-black text, one accent for the Quote action and one muted accent for sponsored/discreet flags); typography is one display family for headings and one text family for body, with tabular numerals enabled for the metrics columns so DR/DA/TF align cleanly across rows.

## Constraints

- No fabricated metrics: every DR/DA/TF/traffic number shown must be tied to the most recent ahrefs/Moz/Majestic refresh on file.
- Sponsored or discreet placements must be flagged on both the catalogue row and the live-link confirmation; the buyer opts in explicitly.
- The invoice must never be issued before the link is verified live; refunds or credits for non-delivery are first-class.
- Per-publisher ETA must be a window (for example "7–10 days (often less)") rather than a single date, because publisher editorial calendars are not predictable.
