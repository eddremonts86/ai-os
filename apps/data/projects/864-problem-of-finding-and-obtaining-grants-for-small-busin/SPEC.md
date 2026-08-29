---
id: "864"
slug: problem-of-finding-and-obtaining-grants-for-small-busin
title: Problem of finding and obtaining grants for small businesses
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/gkrcgpelx1-problem-of-finding-and-obtaining-grants"
category: finance
date: "2025-10-29"
tags: [Finance, Business, Legal, Other]
country: Canada
tech: [Python, FastAPI, Elasticsearch, Redis, Playwright, PostgreSQL]
---
# Problem of finding and obtaining grants for small businesses

## Problem

The capture for this plan carries only the title and the country (Canada) — the original ProblemHunt post named no specific sector, no quoted budget and no named incumbent. The title, taken at face value, says the pain is grant discovery and grant capture for a small business: knowing which grants exist, which ones the business is eligible for, and how to actually win one.

For a Canadian small business the grants surface is fragmented across federal programmes (Canada Small Business Financing Program, NRC IRAP, regional development agencies), provincial programmes (which differ in every province and territory), municipal programmes (often sector-specific, sometimes one-off), and industry-specific programmes (agriculture, clean tech, digital adoption). Each programme has its own eligibility test, its own deadline, its own portal and its own application template. A business that hears about one grant from a peer usually does not know whether similar grants from other programmes are open, whether they would qualify, or whether the application effort would pay back.

The capture does not name an interview, a quoted success rate or a named programme, so none are invented here. What is named by the title alone is the gap: there is no service that takes a Canadian small business's situation and returns the ordered set of grants they are eligible for right now, with a deadline and an eligibility fit per grant, and a way to track the application through to a decision. The MVP is scoped to that one gap and nothing more — it does not file the application on the founder's behalf, and it does not replace a grants consultant.

## Objective

Ship a web service that, given a Canadian small business's situation (sector, province, headcount, revenue band, ownership profile, project type if any), returns the ordered list of federal, provincial, municipal and industry-specific grants they are eligible for right now, with a deadline, an eligibility fit score and a link to the official application portal. The output is a grant list the business can work through, with per-application tracking, not a grants-consulting service.

## Target Users

- Canadian small-business owners hearing about one grant from a peer and wanting to know what else exists that they could apply for right now.
- Early-stage founders seeking non-dilutive funding to extend runway and unwilling to spend grant-application effort on programmes they are not actually eligible for.
- Owner-operators in specific sectors (agriculture, clean tech, digital adoption, manufacturing) who want a sector-filtered view rather than a generic federal listing.
- Grants consultants and bookkeepers who maintain grant lists for multiple client businesses and want a shared, versioned source they can update as programmes open and close.
- Economic development offices and business improvement areas that need to point their member businesses at the programmes they are eligible for, without rebuilding the eligibility logic themselves.

## MVP Scope

- Business profile form capturing sector, province, headcount, revenue band, ownership profile and any active project the business is seeking a grant for.
- Ordered grant list filtered to programmes the business is eligible for right now, with a deadline, an eligibility fit score and a link to the official application portal.
- Coverage of at least the federal programmes with broad small-business reach, plus provincial programmes for the four largest provinces (Ontario, Quebec, British Columbia, Alberta), with municipal and industry programmes added behind feature flags.
- Eligibility fit score that surfaces which eligibility test the business passes and which it does not, so the user knows why a grant is on the list.
- Per-business application tracker with stages: identified, drafting, submitted, decision, outcome, with the deadline visible at every stage.
- Grant lifecycle feed that flags newly opened programmes, closing deadlines and outcome announcements relevant to the business's profile.
- Source-data editor (admin-only) so a programme change, threshold change or deadline change can be reflected without a code deploy, with the change timestamped.
- A clear line that the service does not file applications on the founder's behalf and does not replace a grants consultant.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The MVP surfaces only publicly announced programmes from official portals; no claim is made about private foundation grants, family-office grants or programmes behind a login.
- The eligibility fit score is a heuristic against the publicly stated criteria, not a guarantee of approval; the product wording has to make that explicit on every grant entry.
- Provincial coverage is incremental — federal plus the four largest provinces is the MVP target, with the rest behind feature flags.
- The service does not file the application, does not integrate with grant portals via authenticated submission APIs and does not write the application narrative.
- Programme thresholds and criteria change without notice, so any link-checker or eligibility-criteria update must be visible to the user rather than silently dropped.
- Industry-specific programmes are surfaced as a filter on top of the federal and provincial lists, not a separate corpus that risks going stale on its own.
- The product does not position itself as a substitute for a grants consultant or a professional grant writer, and the wording on every page reflects that.
