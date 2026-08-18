---
id: "281"
slug: the-problem-of-discrimination-wage-delays-and-fear-of-f
title: "The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ydplsur631-the-problem-of-discrimination-wage-delay"
category: other
date: "2025-12-01"
tags: [Other]
country: USA
tech: [Next.js 14, TypeScript, PostgreSQL, Stripe (for legal-aid donations), Twilio SMS, Retool / Airtable-style case tracker, Multilingual UI (Spanish / English)]
---
# The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA

## Tech Stack

Next.js 14 (TypeScript) for the multilingual web app. PostgreSQL with strict data-retention policies. Twilio for the SMS hotline (no persistent caller ID logging). Stripe for legal-aid donations. Retool-style internal case tracker for partner NGOs. Multilingual UI (Spanish / English).

## Architecture

Three services: a Next.js multilingual worker-facing app, a Twilio SMS hotline with subpoena-resistant caller-ID handling, and an internal case tracker for partner NGOs and lawyers (Retool or Airtable-style).

## Milestones

M1: Multilingual worker-facing app with anonymous wage tracker. M2: Twilio SMS hotline with no-caller-ID logging. M3: Legal-aid referral directory with vetting pipeline. M4: Anonymous incident reporting. M5: Partner-NGO case tracker.

## Risks

Worker identity protection is existential — a single breach ends the programme. SMS subpoena risk must be designed against in the telephony layer. Legal-aid partner recruiting is the gating item. Multilingual UX quality must be native, not machine-translated.
