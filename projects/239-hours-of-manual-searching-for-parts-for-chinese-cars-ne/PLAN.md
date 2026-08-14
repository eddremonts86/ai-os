---
id: "239"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [AI, Other]
country: Russia
tech: [Python, FastAPI, OpenAI CLIP + GPT-4o, Elasticsearch, Next.js 14, Telegram Bot API, PostgreSQL]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part

## Tech Stack

Python + FastAPI for the agent backend (chosen for the rich Python ML ecosystem). OpenAI CLIP for visual embeddings, GPT-4o for text normalisation. Elasticsearch for the part-number / supplier index. PostgreSQL for users, query history, supplier metadata. Next.js 14 for a small web admin. Telegram Bot API as the primary user surface.

## Architecture

Three pieces: a Telegram bot front end that captures photo or text, a FastAPI agent that normalises input and queries Elasticsearch, and an ETL pipeline that ingests public OEM catalogues and supplier feeds into Elasticsearch daily.

## Milestones

M1: Telegram bot with text query and Elasticsearch lookup. M2: CLIP visual embedding for photo queries. M3: GPT-4o text normalisation with canonical-part-name output. M4: Supplier feed scraping and price normalisation. M5: Eval harness on a labelled part-photo dataset.

## Risks

CLIP off-the-shelf accuracy on auto parts will be weak; a labelled fine-tune is required and is the long pole. Russian supplier feed availability is uneven. Visual search on damaged or dirty parts will produce low confidence and the UI must surface that honestly.
