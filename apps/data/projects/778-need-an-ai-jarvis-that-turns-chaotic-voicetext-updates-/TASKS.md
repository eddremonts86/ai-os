---
id: "778"
slug: need-an-ai-jarvis-that-turns-chaotic-voicetext-updates-
title: "Need an AI «Jarvis» that turns chaotic voice/text updates into automatically structured tasks, projects, and dashboards for managing all of life and work."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/kmtor7kz31-need-an-ai-jarvis-that-turns-chaotic-voi"
category: ai
date: "2026-01-21"
tags: [AI, Productivity, Other]
country: USA
tech: [Python, FastAPI, Whisper, LangGraph, PostgreSQL, pgvector, Redis, BullMQ, Next.js, Tailwind CSS, Docker]
---
# Need an AI «Jarvis» that turns chaotic voice/text updates into automatically structured tasks, projects, and dashboards for managing all of life and work.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/778-need-an-ai-jarvis-that-turns-chaotic-voicetext-updates-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up FastAPI service with the raw_fragments table, per-user settings and the BullMQ queue wired to Redis.
- [ ] Build the web capture inbox plus iOS / Android voice capture with on-device Whisper and a server fallback path.
- [ ] Implement the LangGraph classification graph that routes a fragment to a project, a type, and the extracted fields, with the move-and-correct feedback loop.
- [ ] Add the projects view, the today view and the per-project fragment history to the Next.js dashboard.
- [ ] Wire pgvector for "what did I say about X" and a basic date and source filter on the inbox.
- [ ] Add per-user encryption at rest and a Markdown export that preserves the project structure.
- [ ] Ship a single Docker compose file that boots the whole stack, documented as the self-host reference.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
