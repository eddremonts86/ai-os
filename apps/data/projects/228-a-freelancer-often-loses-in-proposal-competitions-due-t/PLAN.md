---
id: "228"
slug: a-freelancer-often-loses-in-proposal-competitions-due-t
title: A freelancer often loses in proposal competitions due to the inability to quickly create personalized proposals — weeks of work wasted.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: freelance
date: "2026-01-29"
tags: [Freelance, Productivity, AI]
country: Australia
tech: [Next.js, Python, FastAPI, Claude API, PostgreSQL, Stripe]
---
# A freelancer often loses in proposal competitions due to the inability to quickly create personalized proposals — weeks of work wasted.

## Tech Stack

Next.js for the UI. Python + FastAPI for the orchestration. Claude API for the proposal generation. PostgreSQL for the per-freelancer and per-client memory. Stripe for the subscription.

## Architecture

Brief → per-client retrieval → portfolio item pass → voice-style pass → draft proposal → 5-minute review. Per-freelancer voice derived from past proposals. Per-tenant isolation.

## Milestones

M0 — single brief to draft end-to-end. M1 — per-freelancer voice. M2 — per-client memory. M3 — 100 freelancers in pilot. M4 — public launch with a clear you own the voice stance.

## Risks

Voice imitation may drift toward generic. Per-client memory must respect confientiality. The freelancer may over-rely on the service and lose the genuine edge. Rate-line auto-suggestions must respect the freelancer's pricing.

## Data Model

## Integrations

Next.js for the UI. Python + FastAPI for the orchestration. Claude API for the proposal generation. PostgreSQL for the per-freelancer and per-client memory. Stripe for the subscription.
