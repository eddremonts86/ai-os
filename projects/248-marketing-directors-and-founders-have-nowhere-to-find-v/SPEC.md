---
id: "248"
slug: marketing-directors-and-founders-have-nowhere-to-find-v
title: "Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/lk4uc1xvl1-marketing-directors-and-founders-have-no"
category: marketing
date: "2026-01-17"
tags: [Marketing, Business, Freelance, Career, Other]
country: Russia
---
# Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget

## Problem

In Russia, marketing directors and founders who need to hire a contractor — most often a targeting specialist (performance / paid-traffic) or an SMM manager — describe the hiring process as a lottery. They post on Telegram channels, freelance platforms, and referrals; they get a stack of résumés; they run paid test assignments; and the result is still unreliable: some contractors deliver, many do not, and the time and money spent on the search eats into the budget the contractor was supposed to spend on actual work.

The pain is asymmetric information. The buyer cannot tell, before paying, which contractor will actually perform. Portfolio screenshots, case-study PDFs, and self-reported numbers are easy to fabricate. A "verified" signal that the buyer can trust is missing.

The post does not quote specific numbers (no CAC, no conversion rate, no cost-per-hire), but it is unambiguous that the loss mode is wasted search, not the eventual engagement itself.

## Objective

Build a directory of marketing contractors — targeting specialists and SMM managers first — where each profile carries verification signals the buyer can rely on: identity, prior engagements, client references that can be contacted, and outcome claims that are tied to evidence. The buyer can shortlist from a smaller, more trustworthy pool and skip the lottery.

The MVP focuses on the discovery and verification layer. Engagement, payment, and contract management are not in scope.

## Target Users

- Marketing directors at Russian SMBs and startups who hire contractors for paid-traffic or social-media work.
- Founders of early-stage Russian companies who handle marketing hiring themselves.
- Outsource marketing leads at agencies who sub-contract to specialists for overflow work.
- Senior contractors (targeting, SMM) who want a profile that signals quality without having to re-prove it on every new engagement.

The source frames the user as the buyer, not the contractor.

## MVP Scope

- A public directory of contractor profiles. Each profile carries: identity (full name or business name, city, languages), specialization (targeting platform, vertical, account size band), prior-engagement summary, references (one to three clients who agree to be contacted), and outcome claims with evidence the buyer can request.
- A verification workflow: each contractor submits identity and references; an operator checks the references and marks the profile as "verified" or "unverified." Verification status is shown on the profile.
- A search and filter surface: by specialization (targeting platform, SMM vertical), city, languages, and minimum budget band. The source does not state a budget range, so filters reflect whatever data the contractor supplies.
- An inquiry form that records the buyer's contact and the contractor they're reaching, with the contractor notified by email.

The MVP does not include escrow, dispute resolution, contract templates, or paid promotion of profiles. It is a directory with verification, not a marketplace with transaction rails.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/lk4uc1xvl1-marketing-directors-and-founders` follows the constraints in `248-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Verification is honest, not theatrical. The MVP must not invent fake badges; every status reflects a real check the operator can document.
- Identity handling: the verification flow needs to keep personal data (passport, registration) on a need-to-know basis and document a retention policy.
- Russian-language first. Some contractors work with English-speaking clients, but the buyers named in the post are Russian; the directory's primary language is Russian.
- The MVP must not become a freelancer race-to-the-bottom. The verification signal only works if the directory is curated, not if it accepts everyone.
- Test-assignment culture is part of the pain. The MVP does not solve test assignments directly, but the reference check is intended to reduce how often buyers need to commission one.
