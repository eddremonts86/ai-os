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

## Tech Stack

Chosen for this problem — grounded in the on-disk `package.json` and `README.md` of the shipped repo.

- **NestJS (TypeScript) on Express**, with Joi for env validation and `serverless-http` to wrap the handler for Vercel. NestJS gives a clean module boundary between the webhook, the intent classifier, the memory store, and the recall pipeline; `serverless-http` lets the same handler run in Vercel functions.
- **MongoDB Atlas + Mongoose** for persistence, with **Atlas Vector Search** as the recall index. One database does both the relational lookup (by `{ user_id, message_id }`) and the embedding search, which keeps the recall filter (`user_id` pre-filter on the aggregation pipeline) co-located with the data.
- **Hugging Face Inference API** for the three model calls: `bart-large-mnli` for zero-shot `save` / `recall` intent classification, `distilbart-cnn-6-6` for summarisation, and `all-MiniLM-L6-v2` for embeddings. All three are small enough to run on the free tier, which matters because the post and the repo carry no monetisation.
- **WhatsApp Cloud API** as both the inbound transport (webhook POST) and the outbound transport (text + quoted replies). Webhook signature is verified with the Meta app secret.
- **Jest** for the test suite: intent decisions, context extraction, save storage shape (with an explicit assertion that media IDs are not persisted), native quoted recall, idempotent keys, and the per-user filter in the Atlas aggregation pipeline.
- **Vercel** for hosting, with a single serverless function (`api/index.ts`) wired through `vercel.json` rewrites and a 60s `maxDuration`. The static landing page under `/website` is served from the same project.

The `/website` directory is plain HTML/CSS with paper-warm tokens and a chat-bubble motif; there is no React or app framework on the marketing surface.

## Architecture

Three stages, each a NestJS module, with a one-way flow:

1. **Webhook intake (`src/whatsapp`).** Receives `GET /webhook` (verification handshake) and `POST /webhook` (inbound messages). Verifies the `X-Hub-Signature-256` against the Meta app secret. Ignores delivery-status events that have no `messages` array. Returns immediately; processing is async.
2. **Intent + memory write (`src/intent`, `src/memory`).** For each inbound message, the text (or a placeholder for media-only payloads) goes to the Hugging Face zero-shot classifier. `save` flows extract caption / text / forwarding context, summarise, embed, and upsert by `{ user_id, message_id }` with `$setOnInsert`. The unique compound index makes retries idempotent.
3. **Recall (`src/recall`).** For `recall` queries, the query is embedded and Atlas Vector Search runs against the user's memories with a mandatory `user_id` pre-filter — the aggregation enforces the per-user scoping twice. The reply is an intro line plus one quoted message per result.

Outbound: the WhatsApp Cloud API is called directly from the relevant module (no separate outbound worker). A `Saved ✓` acknowledgement goes out for `save`; for `recall`, each hit is sent as its own quoted reply, which lets WhatsApp's native threading tie the recall back to the original message in the user's chat.

```
   Meta webhook  ─►  /webhook  ─►  intent (HF classify)
                                     │
                          ┌──────────┴──────────┐
                          ▼                     ▼
                       save                  recall
                          │                     │
                          ▼                     ▼
                  summarise + embed       embed query
                          │                     │
                          ▼                     ▼
                  Mongo upsert            Atlas Vector Search
                  (idempotent)            (user_id pre-filter)
                          │                     │
                          ▼                     ▼
                  "Saved ✓"             intro + quoted replies
```

The diagram above is the one place a picture earns its keep: it shows the two outbound reply shapes, which a paragraph would have to repeat. It is not load-bearing on its own — the prose carries the same content.

## Milestones

Mirrors the shipped state, not a roadmap the post implied. Each milestone is something the README or the repo says the code already does.

- **M1 — Webhook live.** `GET/POST /webhook` accepts the Meta verification challenge, verifies the signature, and acknowledges delivery-status events without entering the memory flow.
- **M2 — Intent routing.** A single text message lands in the classifier and is dispatched as either `save` or `recall`. Coverage of media-only payloads is explicit: the saved context is the minimal placeholder when no user text is present.
- **M3 — Save path.** Captions, forwarded context, and raw text are extracted, summarised, embedded, and upserted idempotently by `{ user_id, message_id }`. The Jest suite includes a test that proves the media ID is not in the stored document.
- **M4 — Recall path.** A query is embedded, Atlas Vector Search is run with a `user_id` pre-filter, and Keepr sends an intro plus one quoted reply per result. The Atlas aggregation enforces the per-user filter twice.
- **M5 — Hardening.** Logging policy enforced in production: no webhook bodies, access tokens, captions, embeddings, or phone numbers. Vercel deployment pinned to Node ≥ 20 and a 60s function budget.
- **M6 — First land.** Static site in `/website` deployed alongside the function; keepr.website resolves to the live project.

## Risks

- **WTP unknown.** No pricing signal in the post; `wtp` is absent from frontmatter. If a paid tier is added later, the unit costs of WhatsApp Cloud API + Hugging Face + Atlas scale with usage and have to be reckoned with.
- **License ambiguity.** Post says "open source"; repo `LICENSE` is "All rights reserved — portfolio and demonstration only." Future forks, hosted clones, or paid distributions are blocked until that is resolved.
- **Recall quality.** The classifier is a general-purpose zero-shot model, not a tuned router. Ambiguous messages ("remember this for next week") sit between `save` and `recall` and can be misrouted; the README does not describe a tie-break.
- **Voice coverage gap.** Voice notes are not transcribed. A voice-only user ends up with a memory of placeholder strings. A transcription pass would change the cost model (Hugging Face whisper or similar) and the privacy posture.
- **Per-user scoping is the security model.** Any future feature that lets a user browse another user's memories — even with consent — has to re-derive the `user_id` pre-filter instead of trusting it. The README treats the unscoped query as impossible, not just discouraged.
- **Vercel cold starts.** Serverless functions pay a cold-start tax. A recall reply that includes an HF call, a vector search, and an outbound WhatsApp call has to fit inside the 60s ceiling. The first recall after idle will be visibly slower than the tenth.
- **Vendor concentration.** Three external services sit on the critical path (Meta, Hugging Face, Atlas). An outage in any one of them turns Keepr into a number that stops answering. There is no queue or retry described in the repo.