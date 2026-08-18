---
id: "281"
slug: the-problem-of-discrimination-wage-delays-and-fear-of-f
title: "The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ydplsur631-the-problem-of-discrimination-wage-delay"
category: other
date: "2025-12-01"
tags: [Other]
country: USA
tech: [Next.js 14, TypeScript, PostgreSQL, Stripe (for legal-aid donations), Twilio SMS, Retool / Airtable-style case tracker, Multilingual UI (Spanish / English)]
---
# The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA

## Problem

Immigrant construction workers in the USA face a stack of overlapping problems: wage theft by contractors, discrimination on job sites, fear of firing if they complain, and fear of deportation if they contact authorities. The poster wants a service that supports these workers across the stack.

## Objective

Ship a multilingual (Spanish / English) support service that combines (a) a confidential wage-claim tracker that records hours and pay without identifying the worker, (b) a legal-aid referral network with vetted immigration and labour lawyers, (c) anonymous reporting of unsafe or discriminatory job sites, and (d) an SMS-based hotline for workers who cannot or do not want to use a smartphone.

## Target Users

Immigrant construction workers in the USA, primarily Spanish-speaking. US-based immigration and labour lawyers willing to take wage-claim cases. Worker-advocacy NGOs.

## MVP Scope

Web app (Spanish / English) with anonymous wage-claim tracker, legal-aid referral directory, anonymous incident reporting, and Twilio SMS hotline. Retool-style case tracker for partner NGOs. Stripe for legal-aid donations.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ydplsur631-the-problem-of-discrimination-wage-delay` follows the constraints in `281-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must protect worker identity — no persistent identifier unless the worker explicitly opts in. SMS hotline must not log numbers in a way that can be subpoenaed. Legal-aid referrals must be vetted for both credentials and willingness to take wage-claim cases. Source does not state a price; the service is a non-profit-style support tool.
