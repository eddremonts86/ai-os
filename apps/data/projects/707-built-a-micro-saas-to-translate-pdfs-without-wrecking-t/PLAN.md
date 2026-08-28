---
id: "707"
slug: built-a-micro-saas-to-translate-pdfs-without-wrecking-t
title: Built a micro-SaaS to translate PDFs without wrecking the layout. How do you handle long processing times?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpzn6g/built_a_microsaas_to_translate_pdfs_without/"
category: saas
date: "2026-08-16"
---
# Built a micro-SaaS to translate PDFs without wrecking the layout. How do you handle long processing times?

## Tech Stack

- Next.js (frontend + API).
- PostgreSQL (persistence).
- Railway (hosting).
- An async-processing layer — webhook callback, background job, or hybrid — to be chosen with the community signal in mind.

Stack matches the poster's stated stack exactly; the async layer is the open question, not invented.

## Architecture

A Next.js app that accepts a PDF upload, kicks off translation (preserving layout), and returns the result without blocking on synchronous API timeouts:

- Upload: client posts the PDF; the server enqueues work instead of running it inline.
- Worker: a background job (or external translation API called via webhook) does the heavy lifting.
- Callback: on completion, the result is stored in PostgreSQL and the user is notified.

The architecture is intentionally minimal because the source is a single-operator micro-SaaS, not a multi-service platform.

## Milestones

1. M0 — Capture the post's async-mechanism question and the chosen answer (with justification) before shipping anything.
2. M1 — Wire the layout-preserving translation path through the async layer; confirm no quality regression.
3. M2 — Add a status / retrieval flow so the user can re-engage with the result once processing completes.
4. M3 — Publish the demo at neuropdftranslate.com (already linked in the source).

## Risks

- Timeout risk: heavy PDFs trip synchronous API timeouts — this is the bug the poster explicitly called out.
- Quality regression risk: routing translation through an async layer can drop layout fidelity if the worker path differs from the synchronous path.
- Single-tenant risk: Railway / PostgreSQL on a single Next.js app has well-known scaling ceilings if a single large upload starves the queue.
