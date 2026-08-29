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

## Tech Stack

- **Node.js with Hono and TypeScript** for the API, because the per-platform connectors and the model-call orchestration fit a small, fast Node service, and Hono keeps the surface area tight enough for a single Vercel function plus a worker.
- **PostgreSQL** for sources, drafts, edit history, scheduled posts, posted posts and the per-platform impression readback; the relational model is the right shape for the version history the user keeps.
- **BullMQ and Redis** for the scheduler queue, with one worker process that owns the post timing so a deploy does not double-post.
- **OpenAI API and Anthropic API** for the three per-platform generation calls, with three distinct system prompts that enforce each platform's character and structural conventions.
- **Next.js + Tailwind CSS** for the preview surface, served on Vercel because the audience is the indie hacker on a laptop and a phone.
- **Vercel** for the web app hosting and the API, because the shape is one project plus one worker.
- **Docker** for the BullMQ worker, so the worker runs as a small container with the same environment locally and in production.
- Per-platform OAuth tokens encrypted at rest in PostgreSQL with envelope encryption, so the token compromise incidents metric stays at zero.

## Architecture

A user lands on the intake and pastes the source Markdown. The Hono API stores the source, then fires three generation jobs — one per platform — each with a tight system prompt that enforces character limits, tone and structural shape. The jobs write three draft rows into PostgreSQL, each linked back to the source. The Next.js preview surface reads the source and the three drafts and renders them side by side, with per-platform editors and a version history that records every edit.

The scheduler is a BullMQ queue with a single worker. The worker reads the next due scheduled post, checks the platform's connector, posts through the official API, and records the posted artefact with the platform's response payload. The token used is fetched from the encrypted store just-in-time and never appears in a log line or an analytics payload; the analytics write only records the platform's own response handle. Failed posts are retried with a backoff up to a small bound, and any post that exceeds the bound is surfaced in the dashboard with the failure reason so the user can decide whether to retry or skip.

The per-platform analytics panel reads back the impressions the platform's own API exposes for the first 24 hours after posting, so the user sees the same numbers they would see if they looked at the platform directly. The product never invents an impression number; the metric is the platform's own.

## Milestones

1. **M1 — Source intake and generator** — the intake form, the three per-platform generation calls, and the draft rows in PostgreSQL.
2. **M2 — Preview surface** — Next.js side-by-side preview with per-platform editors and the version history.
3. **M3 — Scheduler and connectors** — BullMQ queue, the per-platform connectors with encrypted token storage, and the worker that posts at the scheduled time.
4. **M4 — Failure surfacing** — retry-with-backoff path and the dashboard view for posts that exceed the retry bound.
5. **M5 — Per-platform analytics** — 24-hour impression readback for each posted artefact, sourced from each platform's own API.
6. **M6 — Vercel + Docker launch** — single Vercel project for the web app and the API, plus the Docker worker on a small container host.

## Risks

- **Generated drafts read as cross-posted** — a Twitter-shaped sentence in the LinkedIn draft is the failure the post is rejecting; the per-platform system prompts have to be measured, not assumed.
- **Connector API drift** — Twitter, LinkedIn and Product Hunt change their APIs more often than a small team can react; the connector layer has to be the smallest possible surface so a breaking change is a bounded diff.
- **Token compromise** — a single log line printing an OAuth token invalidates the user's accounts; the encryption-at-rest path and the just-in-time fetch have to be tested, not assumed.
- **Approval-loop friction** — a strict approval gate satisfies the constraint but adds friction the indie hacker may resist; the gate has to be one click, not a workflow.
- **Impression readback limited** — some platforms gate their own impression API, so the 24-hour metric may be partial; the dashboard has to be honest about what the platform exposes.
- **Schedule slippage** — a deploy of the worker at the wrong moment can double-post or skip a post; the BullMQ queue's idempotency keys are the control, and they have to be tested under deploy.
