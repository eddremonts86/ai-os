---
id: "3720"
slug: kith-ai-clinical-notes-for-therapists-from-ambient-sess
title: Kith – AI clinical notes for therapists from ambient session audio
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487976"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Health Tech, Therapists, AI Notes, Compliance]
tech: [Next.js, Postgres, Twilio, Google Calendar API, Whisper (self-hosted), DPDP-compliant storage]
---
# Kith – AI clinical notes for therapists from ambient session audio

## Tech Stack

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite with Drizzle ORM
- **Deployment:** Coolify + Docker

## Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│   API       │────▶│   DB        │
└─────────────┘     └─────────────┘     └─────────────┘
```

## Milestones

1. **M0:** Project setup + SPEC.md + DESIGN.md approved
2. **M1:** Scaffold + auth
3. **M2:** Core feature
4. **M3:** Testing + deployment

## Risks

- Dependency on external APIs
- Ambiguous scope without further detail
