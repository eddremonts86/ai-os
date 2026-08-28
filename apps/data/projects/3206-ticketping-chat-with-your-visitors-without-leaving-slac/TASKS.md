---
id: "3206"
slug: ticketping-chat-with-your-visitors-without-leaving-slac
title: Ticketping – Chat with your visitors without leaving Slack
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/ticketping?utm_campaign=startup-184497&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ticketping – Chat with your visitors without leaving Slack

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3206-ticketping-chat-with-your-visitors-without-leaving-slac/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the TanStack Start skeleton with a Drizzle + SQLite connection
- [ ] Register the Slack app and store its credentials in the env

## Phase 1: Core

- [ ] Build the routing service: chat widget, support email (IMAP), and form submissions all create one Slack thread + one ticket record
- [ ] Implement the Slack reply path: agent replies in the thread, the message is persisted on the ticket
- [ ] Implement the Slack mention path: @-mentions notify teammates and update the ticket's participants list
- [ ] Implement the Slack status path: status changes via slash commands or reactions update the ticket and the SQLite audit trail
- [ ] Build the admin dashboard (React + TanStack Start) for tickets, roles, and performance numbers
- [ ] Add the optional AI layer that drafts a suggested reply into the thread as a draft (not auto-sent)
- [ ] Add per-channel routing rules so high-volume inboxes do not flood the Slack channel
- [ ] Write tests for the routing service, the Slack event handlers, the audit trail, and the AI draft path

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Smoke-test: receive a chat widget message, an email, and a form submission; confirm each opens a Slack thread; reply, mention, and change status from Slack; confirm the dashboard reflects every change

---

_Generated automatically by Lúa on 2026-08-26_
