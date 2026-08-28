---
id: "828"
slug: lack-of-a-simple-and-convenient-reminder-system-in-what
title: Lack of a simple and convenient reminder system in WhatsApp
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/3tct7tk731-lack-of-a-simple-and-convenient-reminder"
category: productivity
date: "2025-11-26"
tags: [Productivity, Business, Marketing, Other]
country: UAE
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Lack of a simple and convenient reminder system in WhatsApp

## Problem

WhatsApp is where the poster's day-to-day conversations already live, but it does not give them a simple reminder of their own — scheduled messages, follow-ups to send, things to come back to. The post, filed under "Productivity" with Business and Marketing tags from the UAE, frames the gap as the absence of a reminder system inside an app the user already trusts enough to use as a hub. Source names no use case in detail and no specific missing feature.

## Objective

Add a reminder surface that lives inside WhatsApp without forcing the user to switch to a separate app, scheduling app, or web tool.

## Target Users

People in the UAE who run their follow-ups, appointments, and marketing follow-throughs through WhatsApp and want the same app to remind them. Secondary: small businesses whose customer follow-up lives in WhatsApp threads.

## MVP Scope

- A WhatsApp-based surface (chat, bot, or Business API integration) where the user can set a reminder with a time and a recipient.
- A way to list and edit the reminders already set.
- Delivery of the reminder back to the same WhatsApp thread at the right time.
- A simple recurrence option for the recurring cases (weekly check-in, monthly invoice follow-up).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- WhatsApp is a Meta platform; any feature that talks to WhatsApp must respect WhatsApp Business API rules and approval, even though the post does not mention them.
- Country of submission is UAE; any localisation assumption (language, working week, Friday-Saturday weekend) must be confirmed before launch.
- Source names no specific reminder need; the use cases in MVP are the agent's inference from "reminder system", not claims from the post.
- No named competitor appears in the source.
