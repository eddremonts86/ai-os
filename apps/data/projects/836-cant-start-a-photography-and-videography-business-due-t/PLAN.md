---
id: "836"
slug: cant-start-a-photography-and-videography-business-due-t
title: "Can't start a photography and videography business due to lack of clients and systematic approach"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: business
date: "2025-11-14"
tags: [Business, Other]
country: Kenya
tech: [Vue 3 (Vite), Node.js API (Express), SQLite with better-sqlite3, Coolify, Docker]
---
# Can't start a photography and videography business due to lack of clients and systematic approach

## Tech Stack

Vue 3 (Vite), Node.js API (Express), SQLite with better-sqlite3, Coolify, Docker.

## Architecture

Client (Vue 3 SPA) talks to a small Node API. The API owns the lead tracker and proposal templates and persists to SQLite. No background workers; reminders are computed on read.

## Milestones

- M1: scaffold + portfolio template + lead tracker shell
- M2: proposal generator + follow-up reminders wired in
- M3: deployment + first 3 pilot users in Nairobi

## Risks

Single-tenant deploy on Coolify or any small VPS. SQLite is enough at MVP scale. Mobile-first UI because most users will be on phones in the field.

- Lead generation without paid ads depends on Instagram/TikTok work that the user may not have time for; this is a sales risk, not a product risk.
- Kenyan SMB clients often pay by M-Pesa, which is outside the MVP scope; flag this as a follow-up rather than building it now.
