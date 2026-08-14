---
id: "203"
slug: real-working-conditions-cant-be-verified-before-taking-
title: "Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct, anonymous, verified reports from current employees."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: hr
date: "2026-04-24"
tags: [HR, Trust, Marketplace]
country: UK
tech: [Python, Django, PostgreSQL, Redis, Vue.js, Stripe]
---
# Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct, anonymous, verified reports from current employees.

## Tech Stack

Django backend because of the data-model complexity. PostgreSQL with row-level security for report isolation. Redis for queuing the verification challenge. Vue.js for the company pages. Stripe for one-time credits.

## Architecture

Payslip challenge → verification → structured report submission → moderation queue → publication. Job seeker → company page → aggregate report → paywall. Dispute → company response → public thread.

## Milestones

M0 — payslip verification flow working in private test. M1 — structured report form and company pages. M2 — payment and dispute mechanism. M3 — 50 UK companies with at least 3 reports each. M4 — public launch with PR push.

## Risks

Risk of legal pressure from a UK employer if a report is identifiable. Risk of an employer punishing an employee whose verification token is spotted. Risk of bad-faith reports from competitors. Risk of being classified as a defamation intermediary.

## Data Model

## Integrations

Django backend because of the data-model complexity. PostgreSQL with row-level security for report isolation. Redis for queuing the verification challenge. Vue.js for the company pages. Stripe for one-time credits.
