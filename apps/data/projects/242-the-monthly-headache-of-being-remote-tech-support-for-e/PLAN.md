---
id: "242"
slug: the-monthly-headache-of-being-remote-tech-support-for-e
title: The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/u9prt4av11-the-monthly-headache-of-being-remote-tec"
category: ai
date: "2026-01-20"
tags: [Productivity, Other]
country: Serbia
tech: [Next.js 14, TypeScript, Tauri (Rust), OpenAI GPT-4o-mini, WebRTC, PostgreSQL, Cloudflare TURN]
---
# The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems

## Tech Stack

Tauri (Rust) for the companion desktop app — chosen for low resource footprint on elderly machines. Next.js 14 (TypeScript) for the helper web app and admin. WebRTC for screen-share and remote control, with Cloudflare TURN for NAT traversal. OpenAI GPT-4o-mini for the AI triage step. PostgreSQL for users, sessions, knowledge-base entries.

## Architecture

Two clients (Tauri companion, Next.js helper), a WebRTC signalling server (small Node.js), and an AI triage service that runs on session start to surface the top-3 likely causes from the knowledge base and the screen-share first frame.

## Milestones

M1: Tauri companion with one-click "Call my helper" button. M2: WebRTC screen-share between companion and helper. M3: Remote-control channel. M4: AI triage with knowledge-base of 30 common issues. M5: Pilot with 20 helper / elderly pairs in Serbia.

## Risks

Elderly user abandonment if the icon is not extremely obvious. WebRTC on flaky home connections in Serbia requires aggressive TURN fallback. AI triage can confidently wrong; needs a strong "I'm not sure" fallback.
