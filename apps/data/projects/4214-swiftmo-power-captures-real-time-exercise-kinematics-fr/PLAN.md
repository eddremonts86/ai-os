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

## Tech Stack

- React + TypeScript single-page app for the studio and dashboard
- TanStack Start as the Node.js API for account, diary, and analytics
- SQLite with Drizzle ORM for diary entries, sessions, and settings
- Coolify + Docker to self-host
- Browser MediaPipe or a custom pose-estimation model for webcam kinematics
- Service status page and on-call rotation
- Mobile wrappers (Capacitor / React Native) for iPhone and iPad
- Optional cloud sync (opt-in) with explicit consent

## Architecture

The client captures webcam frames, runs pose estimation in the browser, and derives kinematics (joint angles, velocity, repetition count). The diary and Power loss test pages persist per-session data to the backend via TanStack Start. Service status is a public page that reflects the current health of capture, persistence, and analytics. A Terms of Service & Safety Disclaimer gate appears before the first session.

## Milestones

1. Webcam capture and pose-estimation pipeline in the browser
2. Manual mode at the `stage/:manualMode/:demo` route
3. Training diary with per-session entries
4. Body fat estimation and Power loss test flows
5. Profile, Settings, Social toggle
6. Service status page and Terms of Service / Safety Disclaimer gate
7. iPhone and iPad apps via Capacitor / React Native

## Risks

- Webcam kinematics are inherently noisy vs IMUs
- Lighting, clothing, and occlusion can break the model
- Safety disclaimer is a regulatory hedge; claims must be modest
- Privacy of webcam capture is a sensitive surface