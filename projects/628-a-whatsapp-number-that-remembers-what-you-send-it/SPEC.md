---
id: "628"
slug: a-whatsapp-number-that-remembers-what-you-send-it
title: A WhatsApp number that remembers what you send it
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voz93y/a_whatsapp_number_that_remembers_what_you_send_it/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [b2c, whatsapp, memory, open-source, retrieval]
scores:
  money: 3.5
  learn: 5
  fun: 6
tech: [NestJS, TypeScript, MongoDB Atlas, Atlas Vector Search, Hugging Face Inference API, WhatsApp Cloud API, Vercel, Jest]
---
# A WhatsApp number that remembers what you send it

## Problem

The post states the problem directly: people send themselves links, notes, voice memos, and half-formed thoughts to "save for later," and then never find them again. The author /u/Artistic-Produce1901 (Laksh Nijhawan) built Keepr (keepr.website, source at github.com/laksh2005/Keepr) to solve that: a single WhatsApp Business number that turns each message into a searchable memory, with recall answered in plain English.

Three constraints in the post shape the solution:

- **Zero install.** The interface is a chat the user already has open, so there is no app store, no account creation, no on-boarding beyond sending the first message.
- **No organising.** The user does not pick a folder, a tag, a board, or a notebook. Memory is conversational; retrieval is conversational.
- **Media is out of scope.** The repo's README states the service stores only message metadata and user-provided context — never media. Voice notes are not transcribed; without accompanying text, the saved context is the minimal placeholder `Voice note, no additional context given`.

## Objective

Make WhatsApp a long-term personal memory by collapsing capture and retrieval into a chat conversation with a single dedicated number. Anything the user sends is stored; anything the user asks is returned. The system succeeds when the user can stop organising things at all and still find them later.

The shipped behaviour (per the README):

- Inbound message arrives at `GET/POST /webhook`; signature is verified against the Meta app secret.
- Text is classified as `save` or `recall` by a Hugging Face zero-shot classifier (`bart-large-mnli`).
- On `save`: caption / text / forwarding context is extracted, summarised (`distilbart-cnn-6-6`), embedded (`all-MiniLM-L6-v2`), and upserted by user and WhatsApp message ID. Reply: `Saved ✓`.
- On `recall`: the query is embedded, Atlas Vector Search is run with a mandatory `user_id` pre-filter, and Keepr sends an intro plus one quoted reply per result.
- Webhook retries are safe — the `memories` collection has a unique compound index on `{ user_id, message_id }` and writes use `$setOnInsert`.

## Target Users

The post names WhatsApp users who treat the app as a scratchpad. Two profiles are clearly implied:

1. **The "send to self" power user.** Already forwards links and notes into a personal chat to triage later. Stuck because there is no search and no structure inside that chat. They want the chat to *be* the system.
2. **The half-thought user.** Captures 2am ideas, voice memos, forwarded quotes, photos of receipts — the type of content that resists filing. They never tag, never review, and never return.

Tertiary, implied by the multi-user architecture in the README ("a multi-user WhatsApp memory service", with `user_id` as the scoping key on every lookup): a small team or partner pair that wants a shared number that scopes per person.

## MVP Scope

The shipped MVP, per the GitHub source and README:

- One inbound webhook (`/webhook`) that handles text, links, images, documents, videos, voice notes, and forwarded messages.
- Intent classifier that routes each message to `save` or `recall`.
- Memory storage in MongoDB Atlas with a `{ user_id, message_id }` unique compound index and `$setOnInsert` for idempotency.
- Atlas Vector Search index over message embeddings with a mandatory `user_id` pre-filter — there is no unscoped recall method.
- Summarisation + embedding via the Hugging Face Inference API.
- Two outbound reply shapes: `Saved ✓` after a save, and an intro plus one quoted reply per recall hit.
- Webhook signature verification against the Meta app secret.
- Jest test suite covering intent decisions, context extraction, save shape (including proof that a media ID is never persisted), native quoted recall, idempotent keys, and the per-user filter in the Atlas aggregation pipeline.

The `/website` directory is a static HTML landing page deployed alongside the API on Vercel.

## Design Direction

See `DESIGN.md` for this project's design tokens. The shipped site uses a paper-warm palette (`#fbfaf7` background, `#131714` ink, `#0f7a55` brand green, `#c2652b` ember), a serif display face for headings, and a chat-bubble motif (`--bubble-in`, `--bubble-out`) on `--chat-bg` — making the marketing page look like the product is already answering you.

## Constraints

- **Privacy by construction.** The README explicitly says media IDs are never persisted or fetched, voice notes are not transcribed, and webhook bodies, access tokens, captions, embeddings, and phone numbers are not logged in production. This is not an optimisation, it is a load-bearing design rule.
- **Per-user recall is mandatory.** Every read path starts from the sender's WhatsApp ID; there is no unscoped vector query. The Atlas aggregation pipeline enforces it twice.
- **No organising primitives.** No folders, no tags, no notebooks. The product replaces these on purpose, not because the author skipped them.
- **License.** The repository ships a `LICENSE` file that reads "All rights reserved. This repository and its contents are made publicly viewable for portfolio and demonstration purposes only." The Reddit post calls Keepr "open source"; the on-disk license does not grant reuse rights. The plan records what the post says and what the repo says, and lets the reader notice the gap.
- **Hosting.** Vercel serverless functions (`api/index.ts` rewrites all routes to the function, `maxDuration: 60`). `package.json` requires Node ≥ 20.
- **External API dependencies.** WhatsApp Cloud API for messaging, Hugging Face Inference API for classify / summarise / embed, MongoDB Atlas for persistence and vector search.
- **WTP not stated.** The post and the repo do not name a price, a tier, or a paid path. `wtp` is left absent in frontmatter rather than invented.
