---
id: "243"
slug: searching-for-direct-hotel-contacts-to-book-without-ove
title: "Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/travel/kymbn6kp61-searching-for-direct-hotel-contacts-to-b"
category: travel
date: "2026-01-19"
tags: [Business, Other]
country: UK
tech: [Next.js 14, TypeScript, PostgreSQL, Playwright (Python), Stripe, SendGrid, Redis]
---
# Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%

## Tech Stack

Next.js 14 (TypeScript) for the marketing site and admin. Python + Playwright for the property-contact verification pipeline (chosen for browser-automation reliability). PostgreSQL for properties and verified contacts. Redis for the extension's cached lookup. Stripe for any future monetisation (free extension in MVP). SendGrid for transactional email.

## Architecture

Three pieces: a browser extension that queries the backend on aggregator pages, a Next.js admin for hotel-contact verification, and a Python Playwright pipeline that crawls hotel websites to verify direct contacts and capture pricing where available.

## Milestones

M1: Hotel-contact database seed for top 200 UK hotels. M2: Browser extension on Chrome and Firefox. M3: Markup estimate per property. M4: Verification pipeline and per-property confidence score. M5: Expansion to 2,000 UK hotels.

## Risks

Browser-extension distribution on Chrome Web Store is restrictive; alternative distribution is required. Aggregator ToS risk for scraping is real and needs legal review. Hotel pricing pages change format constantly and break verification.
