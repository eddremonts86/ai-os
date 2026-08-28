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

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. The WhatsApp side is reached through the official WhatsApp Business API, not a scrape or unofficial client.

## Architecture

A small admin app handles the catalog of reminders, the schedule, and the audit log. A worker fans the firing reminder out through the WhatsApp Business API back to the thread the user set it from. Authentication and approval against Meta's terms sit at the edge before any message is sent.

```
user sets reminder in WhatsApp
        ↓
   admin app stores reminder + schedule
        ↓
   worker fires reminder at scheduled time
        ↓
   WhatsApp Business API delivers to the same thread
```

## Milestones

1. WhatsApp Business API integration approved by Meta, not assumed.
2. Set / list / edit reminders through the WhatsApp conversation.
3. Worker that fires the reminder back into the same thread at the scheduled time.
4. Recurrence option for the cases that repeat weekly or monthly.
5. Audit log of every reminder fired and acknowledged.

## Risks

- WhatsApp Business API approval is the gate that determines whether anything ships; the post does not address it.
- Sending into a personal WhatsApp thread (versus a Business thread) has different rules; the post does not say which the user has in mind.
- Country of submission is UAE; language and weekend assumptions must be confirmed.
- The post tags the product as Productivity / Business / Marketing; trying to serve all three in MVP would dilute focus.
