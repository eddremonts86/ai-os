---
id: "818"
slug: traders-lose-money-due-to-emotional-decisions-fear-gree
title: "Traders lose money due to emotional decisions (fear, greed) and lack a tool for real-time control of their psychological state during trading"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/vhe68ui8b1-traders-lose-money-due-to-emotional-deci"
category: psychology
date: "2025-12-06"
tags: [Psychology, AI, Finance, Other]
country: India
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Traders lose money due to emotional decisions (fear, greed) and lack a tool for real-time control of their psychological state during trading

## Tech Stack

React with TypeScript for the trader-facing app, TanStack Start as the Node.js API, SQLite with Drizzle ORM for sessions and nudge history, deployed via Coolify and Docker. Chosen because the MVP is a personal companion that needs to be reliable during market hours.

## Architecture

A single-user web app with three surfaces: a session start that captures the trader's intent and risk budget, an in-session nudge engine that watches simple behavioural signals, and an end-of-session review that shows what the nudges triggered.

## Milestones

- M1 — Manual session start and end with the trader's intent and risk budget captured.
- M2 — In-session nudge engine driven by self-reported state and time-since-last-trade.
- M3 — End-of-session review that shows the pattern of nudges and the trades that followed.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- "Real-time control" implies a tighter feedback loop than v1 can credibly provide.
- Touching retail trading in India means clear SEBI disclosure language from day one.
