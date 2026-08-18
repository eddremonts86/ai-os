---
id: "244"
slug: a-beginner-in-online-business-needs-not-a-course-but-a-
title: "A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/h0x8gh7a71-a-beginner-in-online-business-needs-not"
category: ai
date: "2026-01-18"
tags: [Business, Education, Other]
country: USA
tech: [Next.js 14, TypeScript, PostgreSQL, OpenAI GPT-4o, Stripe, React Native, Resend]
---
# A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan

## Problem

A USA-based beginner in online business has tried courses (and seen them through to completion) but never landed on a concrete next step because the courses are generic and do not adapt to the beginner's actual idea, skills, or weekly capacity. The poster wants an AI guide that produces and walks through a personalised plan.

## Objective

Ship an AI guide that, after a 15-minute intake interview, generates a 90-day personalised plan tailored to the beginner's specific online-business idea, current skills, available hours per week, and budget, and walks them through it step by step with daily or weekly check-ins.

## Target Users

USA-based beginners in online business who have already tried at least one course and bounced off it; people who have a specific idea (dropshipping, services, SaaS, content) but no clear next step. Coaches and communities who want to recommend a guided plan to members.

## MVP Scope

Web app with intake interview, GPT-4o-generated 90-day plan, weekly check-in flow that updates the plan, and a daily "today's step" surface. Stripe subscription for the guided tier.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/h0x8gh7a71-a-beginner-in-online-business-needs-not` follows the constraints in `244-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Plan generation cost per learner must stay below subscription revenue. No false claims about income outcomes — disclaimer in onboarding. Plan content must be specific enough to act on within 24 hours.
