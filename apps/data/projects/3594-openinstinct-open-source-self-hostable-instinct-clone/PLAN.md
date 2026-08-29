---
id: "3594"
slug: openinstinct-open-source-self-hostable-instinct-clone
title: "OpenInstinct – open-source, self-hostable Instinct clone"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479314"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Eve (agent framework), Linq (iMessage), Kernel (browser use / credential injection), Postgres, Vercel AI Gateway, Google Workspace connector]
---
# OpenInstinct – open-source, self-hostable Instinct clone

## Tech Stack

The author named this stack in the post and it is the supported configuration for v1.

- **Agent runtime:** Eve — durable agent runs, used for the long-lived task loops the post's examples require.
- **iMessage channel:** Linq — inbound and outbound iMessage, the channel the user kicks tasks off from.
- **Browser use / credential injection:** Kernel — the layer that lets the agent act on authenticated web services with vault-stored credentials.
- **Database:** Postgres — vault entries, task state, conversation history.
- **Model gateway:** Vercel AI Gateway — model-agnostic, so the underlying LLM is swappable.
- **Connectors:** Vercent Connect / equivalent connector layer, with Google Workspace as a first target (Gmail is what the subscription-cleanup example reads).

## Architecture

A user message arrives over iMessage via Linq and lands in Eve as a task. Eve runs the task as a durable agent loop: it pulls context from the Postgres-backed vault (cards, logins, personal information), decides which tool calls to make, and uses Kernel for the browser-authenticated steps. For the subscription-cleanup example, that means reading Gmail through the Google Workspace connector and reasoning across the result; for the golf-grip-trainer example, it means searching the web through Kernel, comparing options, and completing checkout with a vault-stored card.

The model behind Eve is reached through the Vercel AI Gateway, so swapping providers is a config change rather than a rewrite. Postgres is the only persistence layer; the vault is a Postgres schema with encryption at rest, task state is a row per task, and conversation history is replayable from Postgres plus the iMessage channel. Connectors are the only network egress path for third-party services, and each connector is its own auditable surface.

The post's stance is self-hostability end-to-end, so the architecture is a single deployable unit on a single operator-controlled host. Linq and Vercel AI Gateway are the two managed dependencies in an otherwise self-hosted stack.

## Milestones

1. **M0 — Vault + Eve skeleton.** Postgres schema for cards, logins, personal information; Eve wired up as the durable task runner; encryption at rest configured on the vault.
2. **M1 — iMessage channel via Linq.** Inbound and outbound iMessage flow into Eve, with task status surfaced back to the user in-thread.
3. **M2 — Kernel browser use.** Authenticated web actions work end-to-end against a real service using a vault-stored login.
4. **M3 — Three example tasks reproducible.** Theatre ticket purchase, golf grip trainer purchase, and Gmail-driven subscription cleanup all run to completion on a clean install.
5. **M4 — Self-host path + connector layer.** A documented single-host install and the Google Workspace connector (plus one connector slot beyond it) ship behind the beta label the post carries.

## Risks

- **Vault + autonomous agent blast radius** — a credential in the vault can be used by an autonomous loop; an Eve bug or a mis-scoped permission could turn a vault entry into a live transaction. Encryption and per-task scope are the load-bearing controls.
- **Linq as a managed dependency** — the self-host story depends on a third-party iMessage bridge; outages or policy changes there break the only user-facing channel.
- **Vercel AI Gateway as a managed dependency** — the post does not state a fallback to a local model gateway; for true self-host, that fallback is worth defining.
- **Beta posture** — the post says "wouldn't use it in production," which is the right framing for the MVP but means the user base will be evaluators and contributors, not paying operators.
- **Connector sprawl** — each new connector is a third-party surface with its own credentials, scopes, and failure modes; the MVP must define a connector contract before the community contributes more.
