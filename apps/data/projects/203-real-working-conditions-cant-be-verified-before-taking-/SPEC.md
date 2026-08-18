---
id: "203"
slug: real-working-conditions-cant-be-verified-before-taking-
title: "Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct, anonymous, verified reports from current employees."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: hr
date: "2026-04-24"
tags: [HR, Trust, Marketplace]
country: UK
tech: [Python, Django, PostgreSQL, Redis, Vue.js, Stripe]
---
# Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct, anonymous, verified reports from current employees.

## Problem

Job review sites in the UK (Glassdoor, Indeed, Reed) are saturated with management-written, scrubbed, or recency-biased reviews. Job seekers cannot tell which reviews are real, which departments are covered, and whether the writer still works there. The information that matters — actual on-call rotations, tech debt, the unwritten rules of office politics — does not appear because it is too risky for the writer to share under their name.

What is missing is a service that verifies the writer is genuinely employed at the company (without ever publishing their name), and that produces a structured report on the things UK professionals actually want to know: payslip reality, manager behaviour, working hours, and notice-period games.

## Objective

Build a UK-only anonymous reporting service where current employees submit a structured report after a verified employment check, and job seekers pay for access to company-by-company reports that go beyond the public review surface.

## Target Users

UK mid-career professionals considering a job change. Senior engineers, finance professionals, lawyers, and anyone whose offer includes a 3-6 month notice period and therefore a high cost of a bad move.

## MVP Scope

Employer checks via HMRC-style token in the payslip PDF (no personal data stored). Structured report form with 30 fields covering pay, hours, manager, culture, exits. Company pages with anonymised aggregate reports. Free first report per month, paid credits after that.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `203-.../SPEC.md` and the chosen stack (Python, Django, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in UK.

For UK, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

UK GDPR compliance. No public attribution of a review to a person, ever. No automated scraping of LinkedIn. Employment verification must not leak back to the employer. Reports must be challenged by the company publicly if they dispute a fact.
