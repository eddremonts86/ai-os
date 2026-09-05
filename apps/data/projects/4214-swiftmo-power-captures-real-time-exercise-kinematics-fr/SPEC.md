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

## Problem

Wearable motion sensors (IMUs, suits, depth cameras) are expensive, fragile, and slow to set up. SwiftMo Power (app.swiftmo.com) captures real-time exercise kinematics from a standard webcam — no hardware, no calibration rig. The site lists the menu as Training diary, Manual mode, Next session, Body fat estimation, Power loss test, plus Explore & Facilities, Profile & Settings, Social, and Q&A / Service Status / Support. The system pages include Start, Pause, Next session, Select Exercise, and Social. A Terms of Service & Safety Disclaimer is prominent at the foot. "Manual mode" is a route for the user to drive an exercise session live, with a "stage/:manualMode/:demo" route as the URL convention.

## Objective

Replace wearables and depth cameras with a webcam and a software model so a coach, gym, or home user can measure exercise kinematics in real time without buying hardware.

## Target Users

- Coaches and personal trainers who want to track client progress without sensors
- Home fitness users who want objective feedback on their form
- Gyms offering tech-enabled training without buying motion-capture rigs
- Sports scientists doing field studies without instrumenting the subject

## MVP Scope

- Webcam-based real-time kinematics capture
- Manual mode with a "stage/:manualMode/:demo" route
- Training diary, Next session, Body fat estimation, Power loss test
- Profile, Settings, Social toggle, Service Status
- Terms of Service and Safety Disclaimer gating
- iPhone and iPad apps via Capacitor / React Native (parity implied by the site)

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Webcam-only — no depth sensor or IMU
- Safety disclaimer must be acknowledged before the first session
- Service status must be visible; downtime must not silently mislead the user
- Subject privacy: webcam capture stays on device unless the user opts into cloud