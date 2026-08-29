---
id: "783"
slug: automating-cross-posting-of-an-indie-hackers-technical-
title: "Automating cross-posting of an indie hacker's technical content across multiple platforms (Twitter, LinkedIn, Product Hunt) while adhering to each platform's best practices."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/3i2dy4ryd1-automating-cross-posting-of-an-indie-hac"
category: media
date: "2026-01-20"
tags: [Media, Marketing, AI, Startups, Other]
country: Morocco
tech: [Node.js, Hono, TypeScript, PostgreSQL, BullMQ, Redis, OpenAI API, Anthropic API, Next.js, Tailwind CSS, Vercel, Docker]
---
# Automating cross-posting of an indie hacker's technical content across multiple platforms (Twitter, LinkedIn, Product Hunt) while adhering to each platform's best practices.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/783-automating-cross-posting-of-an-indie-hackers-technical-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Hono + TypeScript API with the source intake, the three per-platform generation calls and the draft rows in PostgreSQL.
- [ ] Build the Next.js preview surface with the per-platform editors and the version history that records every edit.
- [ ] Wire the BullMQ scheduler with the per-platform connectors and the encrypted token store, plus a single worker that owns the post timing.
- [ ] Add the retry-with-backoff path for failed posts and the dashboard view for posts that exceed the retry bound.
- [ ] Add the 24-hour per-platform impression readback, sourced from each platform's own API, with the dashboard honest about what the platform exposes.
- [ ] Ship the single Vercel project for the web app and the API, plus the Docker worker on a small container host.
- [ ] Validate end-to-end on one real release: one source draft, three platform-shaped posts, three scheduled posts, three impression readbacks, zero token leaks.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
