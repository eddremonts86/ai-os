---
id: "232"
slug: republished-there-is-no-app-for-nigerian-passengers-tha
title: "Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps with transit, hotel, and the embassy line."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: travel
date: "2026-01-26"
tags: [Travel, Nigeria, Information]
country: Nigeria
tech: [Flutter, Python, FastAPI, PostgreSQL, AviationStack, Paystack]
---
# Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps with transit, hotel, and the embassy line.

## Tech Stack

Flutter for the mobile app. Python + FastAPI for the orchestration. PostgreSQL for the trip and visa data. AviationStack for the flight status. Google Maps for the transit. Paystack for the in-app purchases.

## Architecture

Flight status pull → transit suggestion → hotel option → visa/embassy rules. Offline cache for the non-flight sections. Per-user trip history. Curated visa data with an expiry date per route.

## Milestones

M0 — flight status + visa rules for Lagos-London. M1 — transit and hotel. M2 — 10,000 active users in pilot. M3 — 100,000 active users. M4 — public launch with a clear curated visa, not LLM visa stance.

## Risks

AviationStack latency can produce stale status. Visa/embassy rules change frequently and must be human-curated. Hotel affiliate revenue is thin. Nigerian market requires careful payment-rail integration (Paystack).

## Data Model

## Integrations

Flutter for the mobile app. Python + FastAPI for the orchestration. PostgreSQL for the trip and visa data. AviationStack for the flight status. Google Maps for the transit. Paystack for the in-app purchases.
