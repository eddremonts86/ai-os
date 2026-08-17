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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (profile card, match card, gym picker, chat thread)
- [ ] Provision Vercel + Neon Postgres + Firebase Cloud Messaging
- [ ] Seed gym directory for Bengaluru, Mumbai, Delhi (200 entries, manual verification)
- [ ] Decide on auth: phone OTP (Indian users)

## Phase 1: Core

- [ ] User signup: phone OTP, name, optional photo
- [ ] Profile wizard: gym picker (Mapbox), level, schedule windows, goals
- [ ] Match queue: nightly cron ranks candidates, pushes top 5 to the user
- [ ] Mutual-opt-in chat: both sides must accept before chat opens or contact info is revealed
- [ ] Block + report: in-app block hides both profiles; reports route to a human review queue
- [ ] Gym-manager console: claim your gym, pin a weekly partner-finder post, see retention stats
- [ ] Push notifications via FCM for new matches
- [ ] End-to-end test: 100 test users across 3 metros, measure time to first match

## Phase 2: Deploy

- [ ] Recruit 1000 users via partner gyms and Reddit / Instagram fitness communities
- [ ] Vercel-side deployment of the console
- [ ] Status page + Mapbox quota monitoring
- [ ] Post-mortem after week 10 with the pilot cohort
