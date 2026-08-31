---
id: "3868"
slug: cardgo-reusable-end-to-end-encrypted-context-cards-for-
title: "CardGo – Reusable, end-to-end encrypted context cards for AI chats"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499893"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [End-to-end encryption, Context card templates, Chat client adapters, Local-first storage, Encrypted export and import, Browser extension surface]
---
# CardGo – Reusable, end-to-end encrypted context cards for AI chats

## Tech Stack

Chosen for the title's three promises — reusable, end-to-end encrypted, chat-integrated.

- **Client-side encryption library:** user-held keys, encrypt before storage.
- **Local-first card storage:** the library works offline, with optional sync later.
- **Chat client adapters:** per-client insertion targets.
- **Browser extension or paste-menu surface:** the one-action insert.
- **Encrypted export and import:** cards travel as encrypted files.

## Architecture

- **Card model:** title, body and tags per card.
- **Crypto layer:** encryption before storage or transit; decryption only at insert time.
- **Adapter layer:** per-chat-client insertion targets behind one interface.
- **UI:** card library, composer and one-action insert.

## Milestones

1. **M0 — Cards work.** Card CRUD on local storage plus insert into one chat client demo.
2. **M1 — Encryption.** End-to-end encryption with user-held keys, export and import.
3. **M2 — Multi-client.** Insertion adapters for the named chat clients.
4. **M3 — Public launch.** The encryption design is published for review alongside the launch.

## Risks

- **Chat client churn:** DOM and layout changes break adapters.
- **Recovery tension:** key recovery mechanisms weaken true end-to-end encryption.
- **Credibility:** the encryption claim must survive external scrutiny.
