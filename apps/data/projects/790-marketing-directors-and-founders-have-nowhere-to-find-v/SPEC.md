---
id: "790"
slug: marketing-directors-and-founders-have-nowhere-to-find-v
title: "Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/lk4uc1xvl1-marketing-directors-and-founders-have-no"
category: marketing
date: "2026-01-17"
tags: [Marketing, Business, Freelance, Career, Other]
country: Russia
tech: [Next.js, TypeScript, PostgreSQL, Prisma, Meilisearch, S3-compatible object storage, Stripe Connect, Coolify]
---
# Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget

## Problem

Marketing directors and small-business founders in Russia cannot find a reliable way to locate vetted contractors for niche marketing work — specifically targeting specialists and SMM managers. The post frames the current search process as a lottery that wastes both time and budget: a founder who needs a targeting specialist today has no central place to look, no shared signal of who is actually competent, and no consistent way to filter out the freelancers who look fine on paper but cannot deliver. The implication is that hiring is an uncalibrated gamble every time.

The capture is a one-line problem statement from ProblemHunt, with country listed as Russia and no further detail. There is no information in the source about which platforms are currently used, what vetting signals already exist, what budget ranges founders are working with, or how the targeting-specialist and SMM-manager segments differ in practice. What the source names — and this is the entire ground truth — is the actor (a marketing director or founder), the pain (the search is a lottery, time and budget are wasted), and the missing thing (a place to find verified contractors for these two specific niches).

What follows from those bare facts is the shape of the problem: any solution has to distinguish between different marketing specialties rather than treat "marketer" as a single category, has to surface verification that a buyer can actually trust rather than a self-rated star count, and has to be reachable without the founder already knowing someone in the niche. The source does not claim the gap is unprecedented — only that it is unfilled for these particular roles — so the plan scopes the narrowest honest MVP that addresses exactly those two segments.

## Objective

Build a curated directory of pre-vetted marketing contractors in Russia for two specific niches — targeting specialists (paid acquisition, audience segmentation, campaign setup) and SMM managers (community management, content scheduling, engagement) — so a marketing director or founder can hire one in days rather than weeks, with verification the buyer can rely on rather than a self-reported profile.

## Target Users

- Marketing directors at small and mid-sized Russian companies who need a targeting specialist or SMM manager for a specific campaign and have no in-house recruiting pipeline.
- Founders of early-stage Russian startups who wear the marketing hat themselves and need to delegate one slice (paid ads, social) to a specialist without spending weeks filtering resumes.
- Independent targeting specialists and SMM managers in Russia who want a channel that surfaces their work to verified buyers rather than competing on a generic freelance marketplace.
- Small marketing agencies in Russia that subcontract overflow work and need a vetted bench of specialists they can pull from.
- A returning buyer — a director who already hired through the directory once and comes back for the next role, since repeat use is the practical trust signal the directory is meant to earn.

## MVP Scope

- Two specialty lanes at launch — targeting specialists and SMM managers — with separate qualification rubrics for each, since the source explicitly names these two roles.
- A public profile page per specialist, showing their niche, a portfolio of named past work, a short case write-up for at least one engagement, and a verification badge tied to a documented check (identity, references, or portfolio authenticity).
- A short screening questionnaire the specialist fills in once during onboarding, which a buyer can read in under two minutes and use as a first filter.
- Search and filter by niche, city, language, rate band, and availability window — the four filters the founder actually needs to narrow the field.
- An inquiry flow that creates a private conversation thread between buyer and specialist, captures the brief, and logs the eventual outcome (hired, declined, no response) so the directory accumulates real hiring data over time.
- A written verification policy that names exactly what the directory checks and what it does not, so the verification badge means the same thing to every buyer.
- A founder-facing shortlist: save up to a small fixed number of specialists per search, share the shortlist internally if needed, and message them all from one thread.
- Russian-language copy throughout the buyer and specialist surfaces, since the source country is Russia and the actors are Russian.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The directory is for two named niches only — targeting specialists and SMM managers. Adding a third niche (SEO, copywriting, etc.) is out of scope at MVP and would dilute the verification signal.
- Verification must be a check the directory can document and replay, not a self-rated star count. The badge has to mean the same thing to every buyer or the directory becomes the same lottery it is replacing.
- The source names no price, so the plan does not invent one. The architecture must support either a take-rate per hire or a subscription for buyers, and that choice is open.
- Specialist profiles are public so a buyer can browse without registering, which means the directory cannot hide that a specialist is listed — opt-in to being listed is mandatory.
- Russian-language copy is in scope; English-language copy is not in scope at MVP unless a Russian specialist is serving an English-speaking buyer explicitly.
- The directory does not process the actual payment between buyer and specialist — the contract is between them. The directory can recommend or escrow a payment but does not become the employer.
- The verification check the directory performs has to be auditable: if a buyer later disputes the specialist's claimed work, the directory can show exactly what was checked and when.
