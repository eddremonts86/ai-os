---
id: "3746"
slug: fake-negative-reviews-from-people-who-were-never-custom
title: "Fake negative reviews from people who were never customers are appearing on Google Business. Extortionists offer to remove them for money. Google won't help. Need a real solution"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/bgkxok2tu1-fake-negative-reviews-from-people-who-we"
category: business
date: "2026-08-29"
tags: [Business, Security, Marketing, Other]
country: USA
wtp: "unspecified (extortion pain implies SMB WTP)"
tech: [TypeScript, Node.js API, SQLite + Drizzle ORM, Coolify + Docker]
---

# Fake negative reviews from people who were never customers are appearing on Google Business. Extortionists offer to remove them for money. Google won't help. Need a real solution

## Tech Stack

TypeScript, Node.js API, SQLite + Drizzle ORM, Coolify + Docker.

## Architecture

Single Node.js service that pulls reviews on a schedule, runs a rules-based risk score, and emails the owner a digest with a printable takedown package. No frontend beyond the email and a small owner-only dashboard for the takedown letter generator.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Google Business Profile OAuth flow + review ingestion.
- **M2:** Risk-score rules + takedown-package generator.
- **M3:** Daily digest + dashboard; deploy on Coolify.

## Risks

- Google API gating can stretch the schedule.
- Takedown success is hard to measure; the MVP cannot prove Google acted because of the package.
- False positives on the risk score can erode trust quickly.
