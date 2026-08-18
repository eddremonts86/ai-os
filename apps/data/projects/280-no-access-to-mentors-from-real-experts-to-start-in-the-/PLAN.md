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

## Tech Stack

Next.js 14 (TypeScript) for the web app. PostgreSQL for experts, mentees, sessions, notes. Daily.co for 1:1 video sessions. Stripe Connect and Razorpay for expert payouts (Razorpay for Indian mentees, Stripe for international). Resend for booking emails and reminders.

## Architecture

Three services: a Next.js app for expert profiles and mentee intake, a Daily.co-backed video session layer, and a payout worker that handles Stripe Connect / Razorpay splits after session completion.

## Milestones

M1: Expert onboarding and topic tags. M2: Mentee intake and 1:1 booking. M3: Daily.co video sessions. M4: Stripe Connect / Razorpay expert payouts. M5: Post-session structured notes and reminders.

## Risks

Expert vetting quality directly determines product trust. Mentee churn is high for educational services. Expert-side supply is bounded by the size of the Indian real-estate expert pool willing to mentor.
