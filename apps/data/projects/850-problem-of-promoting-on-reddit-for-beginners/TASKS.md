---
id: "850"
slug: problem-of-promoting-on-reddit-for-beginners
title: Problem of promoting on Reddit for beginners
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/rs2248ze51-problem-of-promoting-on-reddit-for-begin"
category: marketing
date: "2025-11-09"
tags: [Marketing, AI, Other]
country: UK
tech: [Vue 3, TypeScript, Vite, Rust rules-engine compiled to WASM, Cloudflare Workers for hosted checks, Cloudflare KV for subreddit-rule snapshots, Reddit JSON API (.json endpoints), Coolify]
---
# Problem of promoting on Reddit for beginners

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/850-problem-of-promoting-on-reddit-for-beginners/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the subreddit-rules ingestion from the public `.json` endpoints, the sidebar normalisation, and the one-page brief render in Vue 3 + Vite.
- [ ] Implement the recent-posts ingestion and the language-pattern summary the beginner can read.
- [ ] Implement the moderation-log reader where the subreddit has one, with the honest "no public moderation log" state for subreddits without one.
- [ ] Build the Rust rules-engine compiled to WebAssembly: per-rule match path, per-conflict explanation in plain English, local-browser execution.
- [ ] Wire the pre-post draft check: draft-input, rules-engine integration, per-conflict explanation view.
- [ ] Build the ban-recovery surface: removal-message classifier, rule-match output, plain-English explanation, "no match found" fallback.
- [ ] Surface the honesty boundary on every page: the documented purpose, the README, the per-page reminder that the tool is a pre-post guide.
- [ ] Deploy the Cloudflare Worker with the subreddit-brief cache, the KV snapshot store, and the stated refresh cadence.
- [ ] Confirm Reddit's public API terms permit the subreddit-lookup and the moderation-log reading the tool needs before launch.
- [ ] Add the documented escalation path for a subreddit moderator who disputes the tool's reading of their subreddit's rules.
- [ ] Add the subreddit-coverage metric: number of subreddits with a current brief, since coverage is the prerequisite for the beginner to find their subreddit.
- [ ] Wire English-language copy throughout the lookup, draft-check and ban-recovery surfaces; keep other languages out of scope at MVP.
- [ ] Run an end-to-end test: a beginner looks up a subreddit, reads the brief and the recent-posts sample, drafts a post, runs it through the rules-engine and sees a per-conflict explanation, then either posts or decides not to; a returning beginner pastes a removal message and gets a plain-English explanation of which rule was most likely violated.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
