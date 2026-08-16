---
id: "661"
slug: just-made-an-app-that-help-in-your-small-or-medium-rang
title: just made an app that help in your small or medium range business
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Mobile (React Native or Flutter), Postgres, an LLM with retrieval over the user's transaction history (RAG on structured + receipt-text data), receipt OCR for cash transactions.

## Architecture

Mobile client → Postgres (per-tenant) → analytics views → LLM RAG over the user's transactions. Offline-tolerant entry with sync.

## Milestones

- [ ] Transaction entry (cash + digital) + offline queue
- [ ] Supplier + product catalogue
- [ ] Pending-payment tracking
- [ ] Analytics views (revenue, top products, top suppliers)
- [ ] AI mode: RAG over the user's transactions
- [ ] Receipt OCR for cash entries

## Risks

- SMB retention is hard; onboarding + first-week engagement drive churn.
- AI-mode quality depends on data structure; bad entries produce bad answers.
- Adjacent competition (Khatabook, Vyapar) is entrenched; differentiation has to be sharp.
