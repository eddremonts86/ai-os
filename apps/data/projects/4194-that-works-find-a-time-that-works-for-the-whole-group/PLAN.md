---
id: "4194"
slug: that-works-find-a-time-that-works-for-the-whole-group
title: "That works - Find a time that works for the whole group"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509567"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# That works - Find a time that works for the whole group

## Tech Stack

- React + TypeScript single-page app
- TanStack Start as the Node.js API for event creation, share-link resolution, and reply persistence
- SQLite with Drizzle ORM for event metadata and per-link reply storage
- Coolify + Docker for self-hosted deployment
- WebSocket or server-sent events for the live "who is free" overlay
- Short, opaque share tokens (no user accounts)
- Cookie-based responder identity so the same browser does not double-count

## Architecture

The organiser opens the page, picks candidate dates and time blocks, and gets a short shareable link. Invitees open the link, tap the slots they are free, and a per-event channel (SSE) updates every connected viewer with the running free count. The server stores event metadata plus per-cookie reply state in SQLite and never asks for an email. The browser renders the calendar, the live count overlay, and a copy-to-clipboard share message. Time-zone display is normalised to each viewer's local zone on read, with the organiser's zone captured at create time.

## Milestones

1. Static landing page with the three-step flow and the example "Italian Night" demo
2. Event creation form with candidate dates and time blocks
3. Share-link resolution and per-event reply persistence
4. Live "fits everyone" overlay with server-sent updates
5. Mobile-first grid rendering with tap-to-mark interaction
6. Confirmation share message generator and clipboard helper
7. Self-hosting recipe on Coolify with Docker

## Risks

- Anonymous share links can be guessed if the token space is small
- Time-zone handling drifts when invitees move or travel mid-poll
- Live overlay needs backpressure if many viewers connect to one event
- Abuse vector: anonymous links could be used to spam a target's view