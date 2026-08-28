---
id: "846"
slug: need-a-ai-bot-for-analyzing-car-and-real-estate-prices
title: Need a AI-bot for analyzing car and real estate prices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2025-11-14"
tags: [AI, Other]
country: Russia
tech: [Python (FastAPI), Postgres, Redis cache, Docker]
---
# Need a AI-bot for analyzing car and real estate prices

## Tech Stack

Python (FastAPI), Postgres, Redis cache, Docker.

## Architecture

Backend fetches and normalizes listings on a schedule, stores medians and distributions, and serves a chat endpoint that returns answers with citations. A small web UI hosts the chat.

## Milestones

- M1: chat interface with one data source for cars
- M2: add real-estate data source
- M3: median and percentile answers with citations

## Risks

Bot lives close to the data sources. Cache aggressively. Cite every number.

- Source terms of service may forbid scraping; an official or partner API is safer if available.
- Median prices shift; without a freshness tag the bot will mislead.
