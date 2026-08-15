---
id: "488"
slug: ive-built-an-app-that-runs-real-spoken-mock-job-intervi
title: "I've built an app that runs real spoken mock job interviews with an AI — it researches the company first, then grills you for 30 minutes"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo0ipz/ive_built_an_app_that_runs_real_spoken_mock_job/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Next.js, OpenAI Realtime API, PostgreSQL, Stripe, Vercel]
---
# I've built an app that runs real spoken mock job interviews with an AI — it researches the company first, then grills you for 30 minutes

## Problem

Source: [reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vo0ipz/ive_built_an_app_that_runs_real_spoken_mock_job/)

Original post:

> I've built an app that runs a real, spoken mock job interview with an AI. Most interview-prep apps hand you a list of questions to read. That never helped me, because the part I'm bad at isn't knowing the answer — it's saying it out loud, under pressure, without rambling. So I built the version I wanted. How it works: You enter the role you're going for and the company. It researches that company live and generates 8–12 questions tailored to that specific job, not a generic list. Optionally upload your CV and it works your actual experience into the questions. Then it interviews you. Out loud, voice only, up to 30 minutes. No typing, no script to read from. Afterwards you get a report: an overall score out of 10, per-question analysis of what worked and what didn't, and a rewritten version of each answer so you can see what a stronger response sounds like. Sessions are tracked so you can see whether you're actually improving. Privacy: the audio is never retained. Only the transcript is kept, because the feedback report is generated from it. Pricing, up front so nobody wastes their time: the first full interview is free. After that it's credit packs — 3 interviews for $9.99, 10 for $24.99, 25 for $49.99, 60 for $89.99. No subscription, nothing auto-renewing. You buy interviews, you use them whenever, they don't expire on a monthly cycle. iOS: https://apps.apple.com/us/app/jobjitsu-ai-interview-practice/id6793413285 Android: https://play.google.com/store/apps/details?id=app.jobjitsu.android English only for now. Happy to answer questions — and if you try the free interview and it's bad, I'd rather hear that here than not hear it. submitted by /u/CloudInsideAToaster [link] [comments]

---

What this plan addresses: A spoken mock-job-interview app that conducts real-time conversations and provides a structured scorecard.

## Objective

A spoken mock-job-interview app that conducts real-time conversations and returns a structured scorecard with a recording for self-review. When I am preparing for a job interview, I want a tool that runs a real spoken mock interview and gives me a structured scorecard, so I can rehearse without scheduling a human.

## Target Users

- Job seekers preparing for technical or behavioural interviews
- Career switchers running practice loops
- Bootcamp graduates doing interview warm-ups

## MVP Scope

- Spoken mock interview via realtime voice API
- Post-interview scorecard: clarity, structure, technical depth
- Recording + transcript for self-review
- No human interviewer in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vo0ipz/ive_built_an_app_that_runs` follows the constraints in `488-.../SPEC.md` and the chosen stack (TypeScript, Next.js, OpenAI Realtime API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes a "real spoken mock job interview with an AI" app
- Plan keeps the spoken + scorecard framing
- Source did not name a price
