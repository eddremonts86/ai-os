---
id: "309"
slug: problem-of-finding-a-workout-partner-in-a-new-gym
title: Problem of finding a workout partner in a new gym
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/fitness/r2fyzjpa11-problem-of-finding-a-workout-partner-in"
category: fitness
date: "2025-11-12"
tags: [Fitness, Social, Other]
country: India
tech: [Next.js, TypeScript, Postgres, Expo React Native, Mapbox, Resend, Vercel]
---
# Problem of finding a workout partner in a new gym

## Problem

An Indian user describes a specific social fitness gap: when you join a new gym, you do not know anyone, you do not know the local etiquette, and you do not have a workout partner at your level. Cold-approaching strangers at the squat rack is awkward; asking the gym staff to introduce you is worse. The title captures the real ask: a way to find a workout partner in a new gym without making it weird.

## Objective

Ship a lightweight partner-matching service for gym-goers in Indian metros: a user picks a gym, fills in a short profile (level, schedule, goals), and the app suggests 3–5 compatible partners in the same gym within a 30-day window.

## Target Users

- New joiners at a commercial gym (Cult, Gold's, Snap, local chains) in Indian metros who moved cities or gyms.
- Returning lifters who trained alone for too long and want an accountability partner.
- Gyms themselves, who can use the tool to increase member retention in the first 30 days.

## MVP Scope

- Gym directory: searchable list of gyms in 3 metros with verified address and hours.
- Profile: name, level (beginner / intermediate / advanced), schedule windows (3 slots/week), goals (strength / hypertrophy / general fitness).
- Match queue: given a profile, the app proposes 3–5 candidates per gym, ranked by level, schedule overlap, and goal alignment.
- Mutual-opt-in chat: both sides accept before the chat opens.
- Gym-side optional claim: a gym manager can claim their gym page and pin a weekly partner-finder post.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/fitness/r2fyzjpa11-problem-of-finding-a-workout-partn` follows the constraints in `309-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Profile data is sensitive (real name, schedule, gym location) — strict opt-in for both sides before any contact info is shared.
- No public list of "single people at this gym"; only mutual opt-in reveals identities.
- Must work on a low-end Android browser — India is mostly mobile-first.
