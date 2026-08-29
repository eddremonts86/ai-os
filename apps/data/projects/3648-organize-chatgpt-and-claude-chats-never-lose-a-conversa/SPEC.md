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

## Problem

The capture is only the project URL and the title. The title is "Organize ChatGPT and Claude chats. Never lose a conversation", which names three things: the two chat products (ChatGPT and Claude), the action (organize), and the implied loss the product prevents (never losing a conversation). The repository URL is simplefolder.hestenns.com and the capture contains no prose body beyond the title.

The implied problem is that conversations held inside ChatGPT or Claude are hard to organise and are sometimes lost. ChatGPT and Claude each keep their own history inside their own product, and neither product is primarily a folder-and-tag system. A user who keeps useful threads across both products, and across time, has no single place to file them, no single search across them, and no guarantee that any one thread will still be there if the provider changes its history UI, its retention policy or its terms. The product's title positions itself against that loss.

What is not stated is the import mechanism (paste, browser extension, official API where available, scraping where it is not), the persistence model, the search and tag surface, and whether the product also re-exports back to the source. Those are honest gaps. This plan scopes what is knowable from the title and from general engineering knowledge of personal knowledge tools, not from anything the author said.

## Objective

Ship a single product that lets a user organise and keep the conversations they have in ChatGPT and Claude in one place, so that a thread they want to keep is not at the mercy of either provider's history page, retention policy or terms change. The user can find a conversation again later and is not told by the title that the product replaces either source product.

## Target Users

- Power users of both ChatGPT and Claude who keep useful threads in both and want a single place to file and search them.
- Knowledge workers who treat a good conversation as a personal asset and want a single home for those assets.
- Users who have already lost a conversation to a provider-side history reset or retention change and want a backup they own.
- Users who want to tag and search across both providers rather than searching inside each separately.
- Users who want to export a thread they care about without depending on either provider's export surface.

## MVP Scope

- Import of a conversation from ChatGPT and from Claude, by paste, by browser-side capture or by an official API where one exists.
- A per-conversation record carrying the provider, the title, the timestamp, the full message log and any attachments.
- A folder and tag model that the user controls, with a single conversation in one folder and many tags.
- A full-text search across all stored conversations, with the provider as a filter.
- A persistent storage layer that survives the user clearing their browser history, since browser-side persistence is exactly the failure the title positions against.
- A simple export per conversation, since the product's claim is ownership, and ownership implies the user can take it back out.
- A status view that flags any conversation whose underlying source has changed (deleted, retention-rolled, edited) so the user can see the gap.
- A read-only browse surface that does not pretend to be either ChatGPT or Claude and does not let the user continue a conversation in the product.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The two named providers (ChatGPT and Claude) are the source of truth for the conversations; the product imports and organises them, it does not replace them.
- Where an official export or API exists, the product must use it; where it does not, the import mechanism is necessarily fragile and the user must be told so.
- The product must persist on the server, not only in the browser, because browser-only persistence is the failure the title positions against.
- Conversations can contain personal and sensitive content, so the product must make its retention and deletion posture explicit per conversation and per account.
- The capture has no statement of import mechanism, persistence model, tag model, pricing or feature set, so anything beyond what the title names is not claimed here.
