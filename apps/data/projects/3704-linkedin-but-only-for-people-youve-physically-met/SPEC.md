---
id: "3704"
slug: linkedin-but-only-for-people-youve-physically-met
title: "LinkedIn, but only for people you've physically met?"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49486567"
category: ask-hn
date: "2026-08-29"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# LinkedIn, but only for people you've physically met?

## Problem

I keep getting requests for an intro with people who are my LinkedIn connections, but I don't actually know them.I'm thinking of an app that would generate a unique QR code, but the person scanning has to be in the same location. May also need to take a selfie together. There seems to be additional value in making it a little more complicated. This means you really should have a good conversation with each other and want to stay connected, so both have a more exclusive connection.You build a network like that -- you have a guarantee that all the contacts of someone you have met that are in this network actually know them, or at least met them once.Am I missing any obvious things? Any technical difficulties? How could you hack this system for verification?Thanks!

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
