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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

SimpleFolder (the URL is simplefolder.hestenns.com) is a single product that imports conversations from ChatGPT and Claude into a place the user controls, files them into folders and tags, and lets the user search across both providers in one query. The point is ownership: a useful thread is not at the mercy of either provider's history page, retention policy or terms change, and the user can export it again when they need it.

The product is read-only with respect to the conversation itself. It does not pretend to be either ChatGPT or Claude and does not let the user continue a conversation in the product. It organises and keeps what the user has already had.

**One-liner:** SimpleFolder imports your ChatGPT and Claude conversations into folders and tags you control, with full-text search and a per-conversation export, so a useful thread is not at the mercy of either provider.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Power users of both ChatGPT and Claude | They keep useful threads in both and want one place to file and search them. |
| Knowledge workers | They treat a good conversation as a personal asset and want a single home for those assets. |
| Users who lost history to a provider change | They want a backup they own rather than a single point of failure. |
| Users who want cross-provider search | They want one search across both providers rather than two separate searches. |
| Users who want portable exports | They want to take a conversation with them without depending on either provider's export surface. |

## Jobs To Be Done

1. **Functional job** — Import a conversation from ChatGPT or Claude by paste or by capture and see it filed in the user's chosen folder.
2. **Functional job** — Find a conversation later by full-text search across both providers.
3. **Functional job** — Export a conversation back out when the user wants it elsewhere.
4. **Functional job** — See when a stored conversation no longer matches its source, so the user can re-import or accept the gap.
5. **Emotional job** — Stop worrying that a useful thread will disappear when a provider changes its history page.
6. **Social job** — Show that a personal knowledge tool can be cross-provider without becoming a new chatbot.

## Success Metrics

- **Import success rate** — share of imports that complete with the full message log intact, since a partial import is the failure the product is supposed to prevent.
- **Search coverage** — share of stored conversations that participate in full-text search, since a record that is stored but not searchable is half the product.
- **Source-drift detection** — share of stored conversations that have been re-checked against their source and flagged when the source has changed.
- **Export success rate** — share of exports that produce a usable file, since the ownership claim depends on the user being able to take a conversation out again.
- **Time to first import** — the path from landing to a first stored conversation, since the product's value only appears after the first import.
- **Provider coverage** — share of active users with at least one conversation imported from each named provider, since the cross-provider claim is what the title promises.

## Pricing & Monetization

The post names no price, no tier and no business model. The architecture fixes a specific cost shape regardless: storage scales with stored conversations and full-text search scales with their length, while import volume scales with user activity. Any future monetisation would therefore be either a per-month storage tier or a one-time lifetime unlock, never a per-conversation fee, because the user is the only customer and the conversations are theirs.

## Competitive Landscape

- **The platforms' own history and search** — works inside one provider, does not cross providers, and is at the provider's discretion on retention.
- **Browser bookmarking of a chat URL** — fragile to the provider's URL scheme and to the user's own browser history being cleared.
- **Notion, Obsidian and personal wikis** — flexible but require the user to paste and format each conversation themselves.
- **Backup tools that capture a user's history in one provider** — useful for one provider but do not organise across providers.
- **Cross-provider export tools** — the post names none specifically, and no competitor is named in the capture, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Decide the import mechanism for each provider, since the official API is partial and the remaining gap is necessarily fragile.
- [ ] Establish the per-conversation retention and deletion posture, so the user can delete a conversation they no longer want stored.
- [ ] Confirm the persistence is server-side, because browser-only persistence is exactly the failure the title positions against.
- [ ] Verify the source-drift check does not violate either provider's terms of service, especially if it requires periodic automated access.
- [ ] Document the export format explicitly, so the user knows what they will get when they take a conversation back out.
- [ ] Make the read-only nature obvious in the UI, since a user who expects to continue a conversation in the product will be confused.
