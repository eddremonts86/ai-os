---
id: "508"
slug: scanmyemails-super-simple-email-scanner-for-those-forgo
title: Scanmyemails - super simple email scanner for those forgotten important emails.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vny8mw/scanmyemails_super_simple_email_scanner_for_those/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, Gmail API, PostgreSQL, Resend, Vercel]
---
# Scanmyemails - super simple email scanner for those forgotten important emails.

## Tech Stack

Chosen for this problem:

- Next.js
- TypeScript
- Gmail API
- PostgreSQL
- Resend
- Vercel

## Architecture

Next.js; Gmail API for read access; PostgreSQL for digests + scores; Resend for daily digest; Vercel.

## Milestones

- Gmail OAuth connect
- Daily digest
- Per-email importance scoring
- No-auto-archive flow

## Risks

- Gmail API rate limits
- Scoring honesty
