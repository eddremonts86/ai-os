---
id: "781"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [Retail, AI, Business, Other]
country: Russia
tech: [Python, FastAPI, CLIP, OpenCLIP, Qdrant, PostgreSQL, Redis, Telegram Bot API, Next.js, Tailwind CSS, Docker]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.

## Tech Stack

- **Python with FastAPI** for the agent backend, because the CLIP embedding, the Qdrant client and the Telegram bot integration are Python-native and FastAPI's async story fits a low-latency mobile query.
- **CLIP / OpenCLIP** for the photo and text embeddings, chosen because the model family covers the multilingual text and the visual parts in the same vector space, which is the property that lets a photo query and a text query share a ranking.
- **Qdrant** as the vector store for the part catalogue, picked because it runs on a single node and keeps the per-query cost low enough for a self-host deployment.
- **PostgreSQL** for the part metadata, the supplier accounts, the feedback events and the catalogue change history; the relational store is the source of truth for everything the vector store retrieves.
- **Redis** as a small cache for repeat queries (the same part photo sent twice by different users from the same workshop), and as the broker for the Telegram bot's outgoing messages.
- **Telegram Bot API** as the primary user surface, because the audience the post implies is on the phone and Telegram is the operating channel of that audience.
- **Next.js + Tailwind CSS** for the supplier and curator web surface, served alongside the API.
- **Docker** for packaging, designed so the agent runs on a single node for the MVP and can be scaled once the catalogue grows.

## Architecture

A Telegram message arrives with either a photo or text. The bot service normalises the message into a single query payload and forwards it to the FastAPI backend. The backend runs the embedding — OpenCLIP for a photo, OpenCLIP text encoder for text — and queries Qdrant for the K nearest neighbours in the part-embedding space. The neighbours are joined against the PostgreSQL catalogue to attach part number, fitment, supplier and price band, then ranked by a small combination of vector distance, catalogue confidence and a per-user feedback signal.

The catalogue itself is built by suppliers and curators through the Next.js web app. A supplier uploads a part photo, attaches the (brand, model range, year range, part number) tuple, and the embedding is computed and stored in Qdrant alongside the metadata in Postgres. A curator's review pass is required for a new brand or a new model range, which is the policy that keeps a self-serve supplier from poisoning the catalogue with wrong fits.

The feedback loop is per-workshop, not per-user, because a single mechanic who rejects a candidate is more meaningful than a casual visitor. The feedback signal feeds into a per-(workshop, part) reweighting that adjusts the ranking without rewriting the embeddings, so the catalogue stays consistent and the personal signal stays local. The confidence label the user sees is the model's distance to the top candidate combined with the catalogue's coverage flag for the (brand, model, year) tuple, so a guess is labelled as a guess.

## Milestones

1. **M1 — Catalogue seed** — a Russian-language catalogue of the most common Chinese-brand parts for the post-2015 import set, with photos and metadata.
2. **M2 — Photo query** — CLIP / OpenCLIP image embedding into Qdrant, retrieval joined to Postgres metadata, ranked results returned via FastAPI.
3. **M3 — Text query** — same model family for the text encoder, sharing the vector space so a text query and a photo query return comparable results.
4. **M4 — Telegram bot** — bot surface that accepts a photo or a text message and returns the ranked list in chat, with the confidence label.
5. **M5 — Supplier onboarding** — Next.js web surface where suppliers upload new parts and curators review new brand / model range entries.
6. **M6 — Feedback loop** — per-workshop accept / reject signal wired into the ranking with the right granularity and the right anti-poisoning controls.

## Risks

- **Embeddings confuse similar-looking parts** — different parts of the same model can look alike, and CLIP distances are not perfect; the fitment metadata has to carry the disambiguation, not the embedding alone.
- **Russian catalogue is thin at launch** — a useful agent needs a useful catalogue, and the first launch is the moment when the catalogue is smallest; seeding has to be a real milestone, not an aspiration.
- **Confident wrong answer on unseen model** — an agent that confidently reports a part for a model it has never seen is the worst failure; the coverage flag has to be honest in the UI.
- **Feedback loop poisoning** — a noisy user or a competitor can degrade the ranking for others; per-workshop granularity and a curator review path are the controls, not optional.
- **Telegram photo upload on bad networks** — the worst 3G is the constraint, not the average; the bot has to handle a stalled upload gracefully.
- **Catalogue growth outpaces curation** — self-serve supplier onboarding can grow the catalogue faster than the curator review pass; the review queue has to keep up or the catalogue loses its honesty.
