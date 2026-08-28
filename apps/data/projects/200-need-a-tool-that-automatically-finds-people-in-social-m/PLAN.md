---
id: "200"
slug: need-a-tool-that-automatically-finds-people-in-social-m
title: Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/6stv96yp21-need-a-tool-that-automatically-finds-peo"
category: social
date: "2026-04-28"
tags: [Social, Marketing, Business, Startups, AI, Productivity, Other]
country: USA
wtp:
  raw: $50/month
  currency: USD
  min: 50
  max: 50
  period: month
tech: [Next.js 14, TypeScript, PostgreSQL, Twitter API v2, LinkedIn API, BullMQ + Redis]
---
# Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

## Tech Stack

Next.js 14 with TypeScript for the web app. PostgreSQL for prospect lists, queries, and rate-limit accounting. BullMQ + Redis for the worker queue. Twitter API v2 (Basic or Pro) and LinkedIn Marketing Developer Platform API. OpenAI API for behavioural-query interpretation when the user writes natural-language criteria.

## Architecture

A Next.js front-end where the user composes a query (structured filters or natural-language prompt). The server compiles the query into per-platform search invocations. BullMQ workers throttle the calls against each platform's quota, persist results, and compute the ranked list. CSV export and webhook delivery.

## Milestones

M0 — Twitter/X connector with structured filters. M1 — LinkedIn connector. M2 — natural-language query interpretation. M3 — behavioural ranking (recency × topical depth × follower band). M4 — webhook delivery and Zapier integration.

## Risks

Twitter/X API cost spike could make the unit economics fail at $50/month. LinkedIn ToS enforcement can disable OAuth apps overnight.
