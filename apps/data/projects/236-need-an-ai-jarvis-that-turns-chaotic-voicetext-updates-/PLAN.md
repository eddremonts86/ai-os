---
id: "236"
slug: need-an-ai-jarvis-that-turns-chaotic-voicetext-updates-
title: "Need an AI \u00abJarvis\u00bb that turns chaotic voice/text updates into automatically structured tasks, projects, and dashboards for managing all of life and work"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/kmtor7kz31-need-an-ai-jarvis-that-turns-chaotic-voi"
category: ai
date: "2026-01-21"
tags: [Productivity, Other]
country: USA
tech: [Python, FastAPI, OpenAI Whisper + GPT-4o, PostgreSQL with pgvector, Next.js 14, WebSockets, OAuth 2.0]
---
# Need an AI «Jarvis» that turns chaotic voice/text updates into automatically structured tasks, projects, and dashboards for managing all of life and work

## Tech Stack

Python + FastAPI for the extraction API (chosen because LLM orchestration tooling and prompt iteration is faster in Python than in Node). OpenAI Whisper for voice transcription, GPT-4o for structured extraction. PostgreSQL with pgvector for retrieval over the user's own history. Next.js 14 for the confirmation UI. WebSockets for real-time digest updates. OAuth 2.0 for iOS / WhatsApp / Gmail authentication.

## Architecture

Three services: an ingestion gateway (iOS share sheet, WhatsApp, email) that writes raw input to a queue; an extraction worker that runs Whisper + GPT-4o and writes structured JSON to PostgreSQL; a Next.js web app that shows the confirmation UI and a daily morning digest generator. pgvector retrieves the user's prior 90 days of structured items to improve extraction accuracy.

## Milestones

M1: Email-forwarding and text share-sheet ingestion. M2: Whisper transcription + GPT-4o extraction with structured JSON schema. M3: Confirmation UI in Next.js. M4: Daily morning digest. M5: iOS share-sheet extension + WhatsApp Business API integration.

## Risks

LLM hallucination on poorly captured voice will require a strong "discard" path. Cost per active user per month may exceed willingness to pay before the model learns the user's categories. WhatsApp Business API approval is slow and country-specific.
