---
id: "267"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-par
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/frug7pmx31-startup-teams-have-nowhere-to-find-relev"
category: startups
date: "2025-12-15"
tags: [Research, Other]
country: Russia
tech: [Next.js 14, TypeScript, PostgreSQL, Telegram Bot API, Stripe, Resend, YooMoney]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Tech Stack

Next.js 14 (TypeScript) for the dashboard and admin. Telegram Bot API for participant recruitment (highest reach in Russia). PostgreSQL for participants, personas, interviews, payouts. YooMoney, Tinkoff, SBP for participant payouts. Stripe as fallback for non-Russian participants. Resend for email fallback.

## Architecture

Three services: a Next.js dashboard for startups, a Telegram bot for participant recruitment and vetting, and a payout worker that handles Russian-rail disbursement after interview completion.

## Milestones

M1: Participant vetting flow with persona-matching score. M2: Telegram bot recruitment and screening. M3: YooMoney / Tinkoff / SBP payouts. M4: Startup dashboard with interview scheduling. M5: Feedback-quality scoring and participant repeat-rate tracking.

## Risks

Russian payment-rail KYC can block participant payouts. Participant vetting quality directly determines product quality. Honest-feedback incentive design must be careful not to reward positive responses.
