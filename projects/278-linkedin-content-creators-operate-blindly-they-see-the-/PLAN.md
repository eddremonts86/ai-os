---
id: "278"
slug: linkedin-content-creators-operate-blindly-they-see-the-
title: "LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/media/ja0oyjzdd1-linkedin-content-creators-operate-blindl"
category: media
date: "2025-12-02"
tags: [Marketing, Other]
country: India
tech: [Next.js 14, TypeScript, PostgreSQL, LinkedIn API, OpenAI GPT-4o, Stripe, Resend]
---
# LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure

## Tech Stack

Next.js 14 (TypeScript) for the web app — chosen for SSR of playbook pages and SEO. PostgreSQL for creators, posts, analyses, playbooks. LinkedIn API for post-history import. OpenAI GPT-4o for topic and hook-pattern classification. Stripe for paid tier. Resend for playbook delivery email.

## Architecture

Three services: a Next.js app for the user UI, a Python analysis worker that runs per-post classification via GPT-4o and writes results to Postgres, and a playbook-generation worker that aggregates per-post signals into a creator-specific playbook.

## Milestones

M1: LinkedIn OAuth and post-history import. M2: Per-post analysis pipeline (topic, hook, format, timing). M3: Per-post "why this worked / didn't work" report. M4: Creator-playbook view. M5: Paid tier and Resend playbook email delivery.

## Risks

LinkedIn API access has tightened — must respect rate limits and ToS. Analysis quality depends on sample size (target: 30+ posts). Over-fitting hook-pattern classification to small samples is a real risk.
