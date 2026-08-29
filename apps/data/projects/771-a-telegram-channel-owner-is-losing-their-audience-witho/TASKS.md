---
id: "771"
slug: a-telegram-channel-owner-is-losing-their-audience-witho
title: A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. There is no simple tool for automatically collecting feedback from departed subscribers.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/dkr31xnko1-a-telegram-channel-owner-is-losing-their"
category: media
date: "2026-01-29"
tags: [Media, AI, Other]
country: Georgia
tech: [TypeScript, Node.js, Fastify, grammY (Telegram bot framework), PostgreSQL, Plausible]
---
# A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. There is no simple tool for automatically collecting feedback from departed subscribers.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/771-a-telegram-channel-owner-is-losing-their-audience-witho/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Node.js + Fastify + TypeScript + Postgres
- [ ] Implement the Telegram bot with grammY, including /setup for channel registration
- [ ] Hook the chat-member update event for the leave case with leaver id, channel id, and timestamp
- [ ] Build the feedback DM with a single short question and canned reasons plus free-text reply
- [ ] Add the response collector that parses canned and free-text replies into category and reason
- [ ] Implement the dashboard with aggregations by reason, by week, and by channel
- [ ] Add the per-channel pause toggle without removing the bot
- [ ] Implement the weekly summary delivered to the channel owner's Telegram inbox
- [ ] Add the leaver opt-out after first message with persistence by Telegram id
- [ ] Wire configurable retention with a 90-day default and a CSV export of anonymised responses
- [ ] Add Plausible for meta-only analytics with no leaver data ingestion
- [ ] Write an integration test that exercises a leave event, a feedback DM, a canned reply, and a weekly summary against a staging bot

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
