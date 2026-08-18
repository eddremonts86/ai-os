---
id: "682"
slug: im-14-and-my-mom-will-only-buy-me-a-domain-if-one-stran
title: "I'm 14 and my mom will only buy me a domain if one stranger actually pays for my app."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpskax/im_14_and_my_mom_will_only_buy_me_a_domain_if_one/"
category: saas
date: "2026-08-16"
tags: [saas, education, consumer, anti-cheat]
tech: [Next.js, TypeScript, ProseMirror, Supabase, Cloudflare R2, Stripe]
---
# I'm 14 and my mom will only buy me a domain if one stranger actually pays for my app.

## Problem

A 14-year-old student was accused of using AI on an essay they wrote themselves, with no way to prove otherwise. Google Docs history shows snapshots (200 words became 700 between 4:10 and 4:25) but not the keystroke-level evidence. The student built an essay-verification app that records every keystroke, every paste, every correction, and verifies through 25 different methods; a teacher clicks one link and watches a full replay of the student typing the essay. The implicit product: a B2C student tool that produces tamper-evident proof of human authorship, with a viral teacher → student → parent distribution loop.

## Objective

Define a student-facing essay-verification app that records every keystroke and paste, generates a tamper-evident replay, and surfaces it as a single link a teacher can open. The plan treats the source as a thin brief from a 14-year-old founder and focuses on the product shape that can be shipped and trusted.

## Target Users

- **Primary:** high-school and undergraduate students who want tamper-evident proof of authorship on essays and exams.
- **Secondary:** teachers and professors who want a verifiable artifact before grading or honour-code enforcement.
- **Tertiary:** parents who want to confirm their child's work is original.

## MVP Scope

- A web-based essay editor that captures every keystroke, paste, correction, and idle moment.
- 25 verification methods (typing-cadence analysis, paste-detection heuristics, idle-gap analysis, etc.) — the source names 25 but the plan scopes the MVP to 5-7 of them for shippability.
- A single replay link the student can share with a teacher; the replay shows the keystroke-level reconstruction.
- Free tier: 5 essays/month, 720p replay. Paid at $4.99/month or $29.99/year: unlimited essays, full-fidelity replay, teacher-team sharing.
- Web-first; no mobile, no native editor in v1.
- Excluded in v1: AI-text detection, plagiarism matching, school-district integrations, LMS integrations.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single essay surface that looks like Google Docs but with a small "recording" indicator at the top-right and a replay-link generator at the bottom. Minimal chrome; the product is the editor.

## Constraints

- The replay must be tamper-evident; a teacher must be able to verify the recording was not edited after the fact.
- The 25 verification methods are a founder-claim; the plan scopes 5-7 for shippability and lists the rest as roadmap.
- The founder is 14; the product must not depend on their personal availability.
