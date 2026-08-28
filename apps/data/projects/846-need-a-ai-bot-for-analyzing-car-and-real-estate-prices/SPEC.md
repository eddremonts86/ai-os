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

## Problem

A Russian poster wants an AI bot to analyze car and real-estate prices. The poster names no specific sites, currencies, or markets. The need is to ask questions about prices in natural language and get a sourced answer.

---

## Objective

Let a Russian-speaking user ask natural-language questions about car and real-estate prices and get a sourced, current answer.

## Target Users

Russian-speaking buyers and sellers of cars and apartments in Russia, plus dealers and agents who screen opportunities.

## MVP Scope

A chat interface that pulls from two public Russian classifieds (cars and real estate) and answers questions like 'what is the median price of a 2-bedroom apartment in Yekaterinburg?' with a cited answer.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Only public sources. No scraping that violates site terms. Russian-language interface and answers.
