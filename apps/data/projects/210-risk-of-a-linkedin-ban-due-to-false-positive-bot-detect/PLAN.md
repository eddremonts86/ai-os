---
id: "210"
slug: risk-of-a-linkedin-ban-due-to-false-positive-bot-detect
title: Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that produces human-readable audit trails and warning signals before the ban.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: productivity
date: "2026-03-26"
tags: [Productivity, Risk, LinkedIn]
country: UK
tech: [Python, Playwright, SQLite, Next.js, Webhook]
---
# Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that produces human-readable audit trails and warning signals before the ban.

## Tech Stack

Python service for the risk scoring. Playwright for the browser-side actions (read-only). SQLite for the local audit log. Next.js for the dashboard. Webhook delivery for the daily summary email. Signed JSON export for the audit trail.

## Architecture

Browser extension records actions → forwards to the Python service → service computes a risk score against the user's rolling 7-day window → daily summary pushes to the dashboard and email → on restriction, the user exports the audit log for the appeal.

## Milestones

M0 — extension recording actions and computing a basic rate-of-fire. M1 — risk score calibrated against real accounts. M2 — daily summary. M3 — exportable audit log. M4 — public launch with a clear 'no automation' stance.

## Risks

Risk of being flagged by LinkedIn for the extension itself. Risk of being interpreted as a 'ban avoidance' tool. Risk of LinkedIn changing their detection heuristics and breaking the risk score. Legal risk if a user uses the audit log to falsely claim innocence on actual automation.

## Data Model

## Integrations

Python service for the risk scoring. Playwright for the browser-side actions (read-only). SQLite for the local audit log. Next.js for the dashboard. Webhook delivery for the daily summary email. Signed JSON export for the audit trail.
