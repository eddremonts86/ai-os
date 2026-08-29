---
id: "784"
slug: the-monthly-headache-of-being-remote-tech-support-for-e
title: The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/u9prt4av11-the-monthly-headache-of-being-remote-tec"
category: ai
date: "2026-01-20"
tags: [AI, Other]
country: Serbia
tech: [Python, FastAPI, SQLite, Twilio Voice + WhatsApp Business API, OpenAI Whisper + GPT-4o, Tailscale, systemd on a VPS]
---
# The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/784-the-monthly-headache-of-being-remote-tech-support-for-e/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Provision a Twilio number and wire the FastAPI webhook that resolves an inbound caller to a known relative in SQLite
- [ ] Define the relatives and sessions schema in SQLite and seed the helper with their first three relatives
- [ ] Stream Twilio media into OpenAI Whisper and persist a rolling transcript per session
- [ ] Serve the helper dashboard over Tailscale only, listing open sessions and per-relative history
- [ ] Implement the AI suggestion loop: GPT-4o proposes the next step from the transcript plus history; helper approves before delivery
- [ ] Deliver approved steps as Twilio text-to-speech or WhatsApp message depending on the channel the relative used
- [ ] Add the recurrence-to-known job that groups new issues against prior issues for the same relative and surfaces the prior fix first
- [ ] Build the first-call consent flow that records the relative's approval before any audio or transcript is retained
- [ ] Add a deletion path the helper can offer the relative, plus a hard kill switch in the dashboard
- [ ] Run a domestic-connection rehearsal with the helper's own phone on a throttled link so the loop survives a poor relative-side connection

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
