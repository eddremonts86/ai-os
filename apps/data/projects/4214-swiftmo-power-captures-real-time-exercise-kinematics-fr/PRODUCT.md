---
id: "4214"
slug: swiftmo-power-captures-real-time-exercise-kinematics-fr
title: "SwiftMo Power captures real-time exercise kinematics from a webcam"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508062"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# SwiftMo Power captures real-time exercise kinematics from a webcam

## Value Proposition

Real-time exercise kinematics from a standard webcam — no IMUs, no depth cameras — so a coach, gym, or home user can measure form and progress without buying hardware.

## Target Users

- Coaches and personal trainers tracking client progress
- Home fitness users wanting objective feedback on form
- Gyms offering tech-enabled training without rigs
- Sports scientists doing field studies without instrumenting subjects

## Jobs To Be Done

- When I run a session, I want a webcam to capture my form so I can review kinematics after
- When I am mid-set, I want manual mode so I can drive the analysis live
- When I train over weeks, I want a training diary so I can see progress
- When the service is down, I want a status page so I do not blame my form for a missing measurement

## Success Metrics

- 10,000 weekly active users within the first quarter
- Median session length over 12 minutes
- 70% of returning users record at least one diary entry per week

## Pricing & Monetization

_TODO:_ source did not state a price. Likely free + Pro tier for advanced analytics, social features, and gym-side dashboards.

## Competitive Landscape

- Wearable IMU stacks (Whoop, Garmin) — hardware-first, not webcam
- Depth-camera apps (Kinect-based) — hardware-required
- Form-check apps that rely on manual video review — no kinematics
- AI pose-estimation libraries (MediaPipe, OpenPose) — DIY, no product surface

## Risks & Open Questions

- Webcam-only kinematics are inherently noisy compared to IMUs
- Lighting, clothing, and occlusion can break the model
- Safety disclaimer is a regulatory hedge; claims must be modest
- Privacy of webcam capture is a sensitive surface