---
id: "330"
slug: student-needs-a-reliable-and-affordable-tool-for-exam-p
title: Student needs a reliable and affordable tool for exam preparation
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-affordable"
category: education
date: "2025-10-29"
tags: [Education, AI, Other]
country: India
tech: [Next.js, Supabase, OpenAI API, Telegram Bot API, Razorpay]
---
# Student needs a reliable and affordable tool for exam preparation

## Problem

An Indian student preparing for a competitive exam (JEE, NEET, UPSC, SSC, banking) faces a market that is saturated with paid coaching that costs a significant share of a middle-class family's monthly budget, and with free YouTube channels that are inconsistent in depth. What the student reports wanting is a reliable, low-cost tool that produces structured questions, tracks weak topics, and stays available offline when the family's data plan runs out.

## Objective

Ship an exam-preparation web app for Indian students that delivers daily, exam-tagged practice questions with personal weak-topic tracking, adaptive review sessions, and a parent-readable progress view, at a monthly price below what a single coaching session costs.

## Target Users

- Indian students preparing for JEE / NEET / UPSC / SSC / banking exams on a tight family budget.
- Tier-2 / tier-3 city students with patchy connectivity who need offline-capable revision.
- Parents who want a weekly-readable progress summary without sitting in on coaching.

## MVP Scope

- Choose exam (JEE, NEET, UPSC, SSC, banking) and language (English or Hindi) at signup.
- Daily question set: 20 multiple-choice questions per subject, auto-graded, with explanation on submit.
- Topic-level tracking: rolling 30-day accuracy per topic, flagged when accuracy drops below 60%.
- Adaptive review session pulls questions from the worst-performing topics first, capped at 30 minutes.
- Parent-friendly weekly PDF summary emailed to a parent-supplied email address.
- Offline mode: questions cached for the current day's set via service worker; submissions sync on next connection.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-aff` follows the constraints in `330-.../SPEC.md` and the chosen stack (Next.js, Supabase, OpenAI API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Monthly price ceiling of INR 199 keeps the tool below the cost of one private coaching session.
- Question content is licensed or authored; no scraping from any single coaching brand.
- Mobile-first PWA; native Android / iOS app is a v2 task.
