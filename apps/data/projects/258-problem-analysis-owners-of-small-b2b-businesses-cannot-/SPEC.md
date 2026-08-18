---
id: "258"
slug: problem-analysis-owners-of-small-b2b-businesses-cannot-
title: "Problem Analysis: Owners of small B2B businesses cannot build a growth system. Do they need a fractional CMO, or can a SaaS be built?"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/3pb7gtrku1-problem-analysis-owners-of-small-b2b-bus"
category: business
date: "2026-01-06"
tags: [Business, Marketing, AI, Other]
country: France
---
# Problem Analysis: Owners of small B2B businesses cannot build a growth system. Do they need a fractional CMO, or can a SaaS be built?

## Problem

Owners of small B2B businesses (typically 5–50 employees, selling to other businesses rather than consumers) cannot build a repeatable growth system. The work is fragmented: a bit of LinkedIn, a few referrals, the occasional outbound email, an inconsistent content cadence, and the occasional conference. None of it runs as a system, none of it produces a forecast, and the owner cannot tell which activity is generating pipeline.

The poster's framing is unusual: it explicitly asks whether the answer is a fractional CMO (a hired expert who runs the system) or a SaaS (a tool the owner runs themselves). The pain is shared across both frames — the owner cannot build the system — but the solution shape is open.

The post is short. It does not name an industry vertical, company count, ACV, or growth metric. The framing is structural.

## Objective

Build a small-B2B growth-system surface that combines what a fractional CMO would do (the weekly check-in, the pipeline review, the activity-vs-outcome view) with what a SaaS can do (the dashboards, the campaign templates, the CRM-lite). The deliverable is a system the owner runs weekly, with a human coach available for a monthly review.

The MVP is a hybrid: a SaaS surface plus an optional monthly human review. The split is intentional — SaaS-only tends to become another dashboard the owner ignores; CMO-only is too expensive for a 5–50 person company. The hybrid keeps both pieces.

## Target Users

- Owners of small French B2B businesses (5–50 employees) selling services or products to other businesses.
- Sales leads at the same companies who own a pipeline but not the marketing engine behind it.
- Fractional CMOs and fractional marketing consultants in France who would use the surface as a backbone for their clients.
- Investors and advisors watching small-B2B portfolio companies who want a structured read on the growth system.

The source frames the user as the owner. The fractional CMO is named as a possible solution, not as a buyer of the service.

## MVP Scope

- A weekly dashboard: pipeline value, new leads by source, conversion rate, top campaign, stuck deals. The dashboard surfaces the data the owner already has but cannot see at a glance.
- An activity log: each week, the owner (or their team) records what they did — outbound emails sent, demos run, content published. The activity log feeds the dashboard.
- A monthly review template: a one-page structured review the owner fills in once a month, with prompts (what worked, what didn't, what to try next month).
- An optional human-review upgrade: a fractional CMO / growth consultant reviews the monthly review and runs a 60-minute call with the owner. The MVP includes a small panel of partner consultants.
- A simple CRM-lite: contact, company, deal stage, last-touch date. Not a Salesforce replacement; a structured list.

The MVP does not include email sending, LinkedIn automation, ad buying, or content production. The system observes; it does not execute.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/business/3pb7gtrku1-problem-analysis-owners-of-small-` follows the constraints in `258-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in France.

For France, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The hybrid model is the design choice. Pure SaaS becomes another ignored dashboard; pure CMO is too expensive. The MVP must keep both pieces visible.
- Honest metrics: the dashboard surfaces what the owner has, not what the owner wishes. If the owner has no pipeline data, the dashboard says so rather than filling the space with placeholders.
- Activity logging is the binding constraint. If logging takes more than five minutes per week, the owner stops. The MVP must measure time-to-log and stay under that ceiling.
- French-language output. The post is from France; the dashboard and the monthly review template are in French.
- Privacy: a small-B2B pipeline contains named contacts. The MVP must define a retention policy and a contact-controlled deletion path.
