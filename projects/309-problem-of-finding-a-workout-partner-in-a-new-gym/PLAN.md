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

## Tech Stack

- **Web app:** Next.js 14 (App Router), TypeScript, deployed on Vercel.
- **Database:** Postgres (Neon) for users, gyms, profiles, match queues, chats, opt-ins.
- **Mobile:** Expo React Native wrapper for Android, plus a PWA fallback for low-end Android browsers.
- **Maps:** Mapbox for the gym picker and "gyms near me" view.
- **Notifications:** Resend for email; Firebase Cloud Messaging for push, since most Indian users run Android with Play Services.
- **Search:** Postgres full-text for the gym directory at this scale; no Elasticsearch needed.

## Architecture

A Next.js app serves the user app (profile, gym picker, match queue, mutual-opt-in chat) and the gym-manager console. Profiles live in Postgres; the matcher ranks candidates by level, schedule overlap, and goal alignment and writes a shortlist to the user's match queue. Chat is one-to-one and only opens after both sides accept — until then, no contact info is revealed.

```
Browser / mobile ─▶ Next.js (user app, gym console)
                          │
                          ├─▶ Postgres (users, gyms, matches, chats)
                          ├─▶ Mapbox (gym picker)
                          └─▶ FCM (push for new match)
```

## Milestones

1. **M0 — Spec freeze + gym directory seed.** 200 gyms across Bengaluru, Mumbai, Delhi. End of week 1.
2. **M1 — Profile + match queue.** Profile wizard, daily match refresh. End of week 3.
3. **M2 — Mutual-opt-in chat.** Both accept before contact info shared. End of week 5.
4. **M3 — Gym-manager console.** Claim your gym, pin weekly partner-finder post. End of week 7.
5. **M4 — 1000-user pilot in 3 metros.** End of week 10.

## Risks

- **Safety** — partner-matching apps attract harassment reports; mitigation is a 24-hour human review SLA and an in-app block that hides a profile from both sides permanently.
- **Gym directory quality** — bad addresses or hours poison the matching experience; mitigation is a "report a gym" button and a weekly re-verification cron.
- **Cold-start** — without enough profiles per gym, matches stay thin; mitigation is a city-wide launch instead of per-gym to seed matches faster.
