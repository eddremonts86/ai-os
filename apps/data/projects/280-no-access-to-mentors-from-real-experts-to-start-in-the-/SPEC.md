---
id: "280"
slug: no-access-to-mentors-from-real-experts-to-start-in-the-
title: No access to mentors from real experts to start in the real estate field
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/x9ojkb1fc1-no-access-to-mentors-from-real-experts-t"
category: education
date: "2025-12-01"
tags: [Real Estate, Other]
country: India
tech: [Next.js 14, TypeScript, PostgreSQL, Daily.co video API, Stripe Connect, Razorpay, Resend]
---
# No access to mentors from real experts to start in the real estate field

## Problem

Indians starting in real estate (buying first home, becoming an agent, investing in property) cannot access mentors from real experts — established brokers, lawyers, interior designers, investors — at reasonable cost. Existing options are either expensive (1:1 advisory at $200+/hour) or low-signal (free YouTube channels). The poster wants structured access to verified experts.

## Objective

Ship a real-estate mentorship platform that connects Indians starting in real estate with vetted experts (brokers, lawyers, interior designers, investors) for affordable 1:1 video sessions, with topic-routed matching and structured post-session notes.

## Target Users

Indians starting in real estate (first-home buyers, aspiring agents, first-time investors). Indian real-estate experts (brokers, lawyers, interior designers, investors) wanting a side channel of paid mentorship.

## MVP Scope

Web app with expert profile and topic tags, mentee intake, 1:1 video session booking via Daily.co, Stripe Connect / Razorpay for expert payouts, structured post-session notes template. Resend for booking emails and reminders.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/education/x9ojkb1fc1-no-access-to-mentors-from-real-e` follows the constraints in `280-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Expert vetting must be defensible — false experts destroy trust. Pricing must be accessible to mentees (target: ₹500-2,000 per session) and meaningful for experts (target: 70% payout share). Indian payment rails (Razorpay) for Indian mentees.
