---
id: "485"
slug: i-couldnt-find-a-writing-tool-that-didnt-sound-ai-gener
title: "I couldn't find a writing tool that didn't sound AI-generated for GTM work, so I built my own and dogfooded it for 2 months"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vej4p9/i_couldnt_find_a_writing_tool_that_didnt_sound/"
category: indiehackers
date: "2026-08-03"
tech: [Next.js, TypeScript, Anthropic API, PostgreSQL, Stripe, Resend, Vercel]
---
# I couldn't find a writing tool that didn't sound AI-generated for GTM work, so I built my own and dogfooded it for 2 months

## Tech Stack

Chosen for this problem:

- Next.js
- TypeScript
- Anthropic API
- PostgreSQL
- Stripe
- Resend
- Vercel

## Architecture

Next.js; Anthropic API for drafting; Postgres for drafts + rubric state; Stripe for paid tier; Resend for digest; Vercel.

## Milestones

- Brief intake
- Draft with "sounds human" rubric
- Editor with AI-tell highlighting
- Stripe paid tier

## Risks

- Rubric enforcement
- Paid-tier value clarity
