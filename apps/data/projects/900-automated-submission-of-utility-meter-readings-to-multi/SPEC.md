---
id: "900"
slug: automated-submission-of-utility-meter-readings-to-multi
title: Automated submission of utility meter readings to multiple management companies
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/nn38cp51u1-automated-submission-of-utility-meter-re"
  captured: "2025-10-09"
category: other
date: "2025-10-09"
tags: [Other]
country: Russia
wtp:
  raw: ₽500–₽1000/month ($6–12) for all apartments or ₽250 ($3) per apartment
  currency: RUB
  min: 250
  max: 1000
  period: month
  mrrMid: 500
tech: [Telegram bot + simple web form, Node.js API, headless-browser automation (Playwright) for legacy management-company portals, SQLite with Drizzle ORM, Coolify + Docker]
---
# Automated submission of utility meter readings to multiple management companies

## Problem

Dmitry (Russia) manages several apartments serviced by different utility management companies, and every month he has to manually submit his utility meter readings to each company's separate personal account. Russia's unified services like GIS Housing and Communal Services do not work with every management company, so the unified-state option is incomplete; the per-company submission step is non-negotiable, and it is a routine but mandatory task that has been going on for many years — typically once a month, with different dates per management company, so several reminders per month are needed and they are easy to miss or forget when he is at work or busy. He tried a reminder bot, but per-company deadlines mean multiple reminders, and missing one translates into estimated billing or a fine. Dmitry would pay a monthly subscription in Russia where he could enter meter readings at any convenient time and the service would automatically submit them to the required management companies on the correct dates — ₽500–₽1000 per month ($6–12) for all apartments together, or ₽250 ($3) per apartment. A comment on the post from Muhammad already advertises a human-operator service that does exactly this (submit on the user's behalf, charged at the price Dmitry mentioned), confirming the demand exists in public form and that operators, not just automation, are a viable first shape.

## Objective

Ship a subscription service for Russian residents with multiple utility accounts where the user enters meter readings once per month through a simple bot or web form, and the service submits them to each management company's personal account on the correct date — automated end-to-end where the management company exposes a usable API, and operator-assisted where it does not — so a customer never misses a deadline or absorbs an estimated bill because they were at work on the day the readings were due.

## Target Users

- Primary: Russian residents who own or manage multiple apartments serviced by different utility management companies and currently have to remember and submit readings on several different dates every month.
- Secondary: Russian residents with a single apartment whose management company is one of the many that GIS Housing and Communal Services does not cover, and who still need a third-party submission path.
- Tertiary: property managers / landlords who handle meter readings on behalf of tenants across multiple units and want a single intake form that submits to each management company.

## MVP Scope

- A Telegram bot (and a minimal web form) where the user enters the meter readings for each apartment once per month, with the apartment / management company mapping configured at signup.
- A submission engine that posts the readings to each management company's personal account on the correct date — automated end-to-end via the management company's API where one exists, and operator-assisted (an internal queue an operator works through) where the company's portal is HTML-only or behind a CAPTCHA.
- A per-submission audit trail visible to the user: when the submission was sent, on which date, to which management company, and what response was captured.
- A monthly subscription: ₽250 per apartment, with a ₽500–₽1000 cap for multi-apartment users per Dmitry's stated willingness.
- Management-company coverage in v1: a known-good list (5–10 management companies in Moscow / St. Petersburg / regional capitals) plus a generic "operator-assisted" fallback for everything else; coverage table published on the landing page.
- Per-deadline reminders so the user enters readings before the cutoff, with escalation if readings are missing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated budget is ₽250 per apartment (~$3) up to ₽1000/month (~$12) for all apartments; the service must be viable at that price point, which caps operator-assisted submissions at a per-submission cost well under ₽100 if the operator path is the bottleneck.
- Russia's unified services like GIS Housing and Communal Services do not cover every management company; the v1 must not assume GIS as the path, and the management-company coverage table has to be honest about which ones are automated vs. operator-assisted.
- Where the management company's portal is HTML-only or behind a CAPTCHA, the submission path is operator-assisted by design; automation must not pretend to bypass CAPTCHA, which would create legal and reliability risk.
- Per-submission audit trail is a compliance and trust requirement; "we submitted it" is not credible without "here is the timestamp, here is the response".
- Subscription billing must support Russian payment methods (SBP / YooMoney / cards via a Russian PSP) — Stripe alone does not cover the audience.
- Operator-assisted submissions introduce a labour cost that scales with users; the coverage table and the operator queue must be sized to that reality, not to marketing copy.
