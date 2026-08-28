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

## Problem

The captured source for this plan is a placeholder: only the country (India) and the title were scraped into SPEC.md. No body text was captured from the ProblemHunt post.

## Objective

Give Indian traders a way to notice their fear-and-greed state while they are trading, so they can pause before making the emotional decision they will regret.

## Target Users

Active retail traders in India who recognise that emotions drive their losses and want a lightweight in-session check, not a therapy app.

## MVP Scope

A pre-session check-in and an in-session nudge system that watches simple indicators (typing speed, time of day, consecutive-trade pattern) and prompts a short pause when the pattern looks emotional.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source is thin: only the title and country are available, so scope is derived from the title signal alone.
- The MVP must not access brokerage APIs in v1; behavioural signals are local.
- India-specific session hours and SEBI disclaimers apply to anything visible to retail traders.
