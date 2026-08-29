---
id: "3648"
slug: organize-chatgpt-and-claude-chats-never-lose-a-conversa
title: Organize ChatGPT and Claude chats. Never lose a conversation
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483647"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Next.js, TypeScript, PostgreSQL, OpenAI API, Playwright (chatgpt/claude scrapers), BullMQ, Tailwind CSS]
---
# Organize ChatGPT and Claude chats. Never lose a conversation

## Tech Stack

- **Next.js with TypeScript** for the web app, because the surface is a small personal knowledge tool with a server-rendered shell and a single user's data.
- **PostgreSQL** for the conversation store, the folder and tag model and the full-text search index, since the natural shapes are tabular and search is the primary interaction.
- **OpenAI API** for the optional structured-summary and tag-suggestion step, since a personal knowledge tool is more useful if it can suggest folders and tags rather than only accept them.
- **Playwright** as the fallback import runner for either provider's UI when an official export or API is not available, because the product's promise is import, not the import mechanism.
- **BullMQ** for the import queue, since a paste or a capture is a job that needs retries and backoff and should not block the UI.
- **Tailwind CSS** for the front-end, because the surface is a small, dense list-and-detail UI and Tailwind keeps the styling predictable.
- **No deploy target named** beyond the database and the queue — the app is a single-user-shaped service.

## Architecture

An import lands as a job. The job normalises the input — a paste, a captured URL, an official export file or, where the provider does not expose an official path, a Playwright-driven read of the user's own UI — into a common envelope: provider, source identifier, title, timestamp, message log, attachments. The envelope is written to PostgreSQL with the folder and tags the user has chosen, and the full text is indexed for search.

The browse surface is a list-and-detail layout. The list shows every stored conversation with provider, folder, tags and last source check. The detail shows the full message log read-only. Search runs against the full-text index and supports a provider filter. Export runs against any single conversation and produces a self-contained file the user can store elsewhere.

Source drift is a small background check. For each stored conversation the system periodically re-reads the underlying source — through the official path where it exists, through the Playwright path only when the user opts in — and flags any conversation whose source has been edited, deleted or retention-rolled. The flag is visible in the list and the user can decide to re-import or accept the gap.

The product is explicitly read-only with respect to the conversation. There is no "continue in SimpleFolder" path, no agent that re-prompts the model, and no in-product generation. Anything the user wants to do with the content of the conversation happens back in the source provider or in a separate tool.

## Milestones

1. **M1 — Import** — paste, capture and official-export paths for both providers, normalised into the common envelope.
2. **M2 — Store and search** — PostgreSQL persistence with a full-text index and a list-and-detail UI.
3. **M3 — Folders and tags** — the user's own organisation model with bulk operations.
4. **M4 — Export** — per-conversation export that produces a self-contained file.
5. **M5 — Source drift** — periodic re-check against the source provider with a visible flag on the list.
6. **M6 — Tag suggestion** — optional structured-summary and tag-suggestion step that the user can accept or ignore.

## Risks

- **Provider terms of service** — a personal knowledge tool that scrapes either provider's UI to import a conversation is operating in a grey zone that can change at any time.
- **Source drift false positives** — a re-check that flags a conversation because the provider's UI changed, not because the content changed, will erode trust in the flag.
- **Retention liability** — the product stores full conversation logs that can contain sensitive personal content, and the security and deletion posture must be explicit.
- **Read-only expectation** — a user who expects to continue a conversation in the product will be confused, and the UI must make the read-only nature obvious.
- **Provider lock-in on attachments** — attachments (images, files) are bound to provider-specific URLs that can rot; the import must capture the bytes, not the URLs.
- **Cross-provider normalisation** — the message shape, the timestamp format and the role labels differ between ChatGPT and Claude, and the importer must preserve the original rather than collapsing the difference.
