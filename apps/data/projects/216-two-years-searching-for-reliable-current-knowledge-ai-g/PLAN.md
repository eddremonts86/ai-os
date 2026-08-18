---
id: "216"
slug: two-years-searching-for-reliable-current-knowledge-ai-g
title: "Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of low-quality links. Need a trustworthy digest in the user's domain."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2026-03-12"
tags: [AI, Research, Knowledge]
country: Russia
tech: [Python, FastAPI, PostgreSQL, pgvector, Claude API, Next.js]
---
# Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of low-quality links. Need a trustworthy digest in the user's domain.

## Tech Stack

Python + FastAPI for the orchestration. PostgreSQL with pgvector for the source embeddings. Claude API for the synthesis. Next.js for the digest interface. Source ingest via RSS, journal APIs, and curated lists per domain.

## Architecture

Source ingest → credibility scoring → per-source embedding → per-user feedback → ranked digest → synthesis with paragraph-level citations. User can drill from any digest line to the source paragraph.

## Milestones

M0 — credibility scoring for 3 domains with 30 sources each. M1 — daily digest with paragraph-level citations. M2 — user feedback loop. M3 — 100 subscribers in pilot. M4 — public launch with payment.

## Risks

Credibility score may be gamed by motivated publishers. LLM synthesis may hallucinate citations to non-existent paragraphs. Domain expertise required to validate the score per domain. May be mistaken for a news aggregator.

## Data Model

## Integrations

Python + FastAPI for the orchestration. PostgreSQL with pgvector for the source embeddings. Claude API for the synthesis. Next.js for the digest interface. Source ingest via RSS, journal APIs, and curated lists per domain.
