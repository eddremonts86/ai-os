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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise git repo
- [ ] Copy `edd-app-template` to `apps/628-a-whatsapp-number-that-remembers-what-you-send-it/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

The shipped code lives in `src/whatsapp`, `src/intent`, `src/memory`, `src/recall`, `src/huggingface`, and `src/config`. The static site lives in `website/`. The serverless entry point is `api/index.ts`. These tasks mirror what the repo already does.

- [ ] Stand up a NestJS app (`@nestjs/common`, `@nestjs/core`, `@nestjs/platform-express`, `@nestjs/config`) with Joi env validation and a `serverless-http` wrapper for the Vercel function entry.
- [ ] Create the `whatsapp` module: `GET /webhook` for the Meta verification handshake, `POST /webhook` for inbound messages, and signature verification against the Meta app secret. Acknowledge delivery-status events (no `messages` array) without entering the memory flow.
- [ ] Create the `intent` module: call the Hugging Face zero-shot classifier (`bart-large-mnli`) on the inbound text and route to `save` or `recall`. Use the minimal placeholder `Voice note, no additional context given` when there is no user text.
- [ ] Create the `memory` module: Mongoose schema with a unique compound index on `{ user_id, message_id }`, an Atlas Vector Search index over the embedding, and writes that use `$setOnInsert` so webhook retries are idempotent.
- [ ] Create the `huggingface` module: three thin wrappers — `classify` (`bart-large-mnli`), `summarize` (`distilbart-cnn-6-6`), and `embed` (`all-MiniLM-L6-v2`).
- [ ] Wire the `save` path: extract caption / text / forwarding context, summarise, embed, upsert, and send `Saved ✓`.
- [ ] Wire the `recall` path: embed the query, run Atlas Vector Search with a mandatory `user_id` pre-filter, send an intro plus one quoted reply per result. The Atlas aggregation pipeline must enforce the `user_id` filter twice.
- [ ] Add the Jest suite: intent decisions, context extraction, save storage shape (with an explicit assertion that the media ID is never persisted), native quoted recall messages, idempotent keys, and the two per-user constraints in the Atlas pipeline.
- [ ] Enforce the logging policy: no webhook bodies, access tokens, captions, embeddings, or phone numbers in production logs.
- [ ] Add a `LICENSE` clarification: the current `All rights reserved — portfolio and demonstration only` file contradicts the Reddit framing of "open source." Resolve before any fork or hosted clone is announced.
- [ ] Build the static landing page in `website/` (HTML/CSS, paper-warm palette, chat-bubble motif) and wire `vercel.json` rewrites so all routes funnel into `api/index.ts` with `maxDuration: 60`.

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Vercel
- [ ] Verify in production

---

_Lúa generated this analysis automatically on 2026-08-15_