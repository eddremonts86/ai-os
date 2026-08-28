---
id: "3518"
slug: supabase-has-had-our-production-db-down-37-hours-after-
title: Supabase has had our production DB down 37 hours after a billing error
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49472642"
category: ask-hn
date: "2026-08-27"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Supabase has had our production DB down 37 hours after a billing error

## Problem

We're on Supabase's Pro plan. Our organization was downgraded and all projects paused over a failed payment. We paid, their system confirmed the invoices, the org went back to Pro, and I manually unpaused every project as their email instructed.All of them came back except one — our production database. That was 37 hours ago.The project sits in a contradictory state: their control plane still reports it as ACTIVE_HEALTHY, while GET /platform/projects/{ref} returns 500 "Project services not found", the health endpoint returns "No active services available", and the project's domain doesn't resolve at all (NXDOMAIN). It was also left on "nano" compute (Free tier) while every other project in the same paid subscription returned to "micro".Support identified the cause within hours — a billing restriction that was never lifted after payment — and escalated it to their Billing team yesterday afternoon. Since then: 24 hours of silence, and no ETA despite asking three times.What makes this hard is that we can't do anything ourselves. "Restart project" and "Pause project" are both disabled in the dashboard. There's no restore option. We can't restart it, can't restore it, can't even download our own backup. Email is the only support channel — no phone, no chat — and it's gone quiet. I posted in their Discord and was told (correctly) that it's a user-to-user forum not monitored by staff.There's a second concern: the project is still flagged with Free-tier settings, and the Free plan has zero backup retention. Our 8 physical backups are the only copy of our data that we cannot reach ourselves.We're a small business in Mexico, not a big account. We're now on our second working day with no system, it's affecting our customers, and we're at real risk of losing one.I found several similar cases in their GitHub discussions — one Pro user was down 72+ hours after a failed dashboard restore — so this doesn't appear to be a one-off.Is there anyone here who can point this at someone able to lift a billing flag? Ticket SU-455781.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
