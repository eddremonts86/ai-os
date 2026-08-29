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

## Problem

The author of the post loves Instinct, but has been increasingly worried about the data footprint being handed over to the vendor and what might be done with it. That worry is the reason the project exists: an open-source, self-hostable clone whose data stays under the operator's control.

The product is built around a personal vault that holds cards, logins, and personal information, and uses that vault to execute complex tasks on the user's behalf. The post lists three concrete example tasks the system can run: "Get me two tickets to the odyssey on saturday at my nearest theatre"; "Find me the best golf grip trainer and order it for me"; and "Read my email and find opportunities to save money by cancelling subscriptions I don't use." Those three examples are the load-bearing definition of "complex task" — they span a local search, an authenticated purchase, and a cross-account reading-and-deciding job, and they are all driven by credentials and personal context stored in the vault.

The author also names the stack they used to ship it: Eve as the agent framework for durable agent runs, Linq for iMessage, Kernel for browser use and credential injection, Postgres as the database, the Vercel AI Gateway so any model can be plugged in, and a connector layer (the post calls it "Vercent Connect") that includes Google Workspace among its targets. The post is explicit that the project is "still beta software" and that the author "wouldn't use it in production." The release is framed as an invitation for community contributions and feedback rather than a stable launch.

## Objective

Ship an open-source, self-hostable Instinct alternative whose personal data — vault contents, conversation history, task memory — stays on infrastructure the operator controls. The vault must hold cards, logins, and personal information, and the agent runtime must use that vault to execute the three categories of task the post names: ticket-style local lookups, authenticated purchases, and email-driven financial review.

The system has to be runnable end-to-end on the author's own machine and on someone else's, with the author-published stack as the supported configuration. Beta posture is acknowledged in the post and is reflected in the docs: the project is for evaluation and contribution, not for production trust yet.

## Target Users

- People who like Instinct's task-on-my-behalf model but want to keep their personal data on infrastructure they own.
- Power users with enough cards, logins, and subscriptions that the case for an autonomous agent is real, not theoretical.
- Developers who want a runnable, self-hostable agent stack built around an Eve / Linq / Kernel / Postgres / Vercel AI Gateway composition that they can extend or audit.
- Open-source contributors invited by the post to participate before the project reaches a production-stable posture.

## MVP Scope

- Personal vault: encrypted storage for cards, logins, and personal information, scoped per user, with explicit access from the agent runtime.
- Durable agent runtime built on Eve, capable of long-running tasks that span multiple steps (the three post examples each require several steps).
- iMessage channel via Linq so the user can kick off and follow tasks from Messages.
- Browser-use / credential-injection layer via Kernel, so the agent can authenticate as the user on web services without round-tripping through a third-party desktop.
- Postgres-backed persistence layer for vault entries, task state, and conversation history.
- Vercel AI Gateway integration so the model behind the agent is swappable.
- Google Workspace connector (and at least one more connector slot) so tasks like "read my email and find unused subscriptions" are reachable.
- A self-host path that brings the whole stack up on a single operator-controlled host, with the same configuration the author uses.
- Documentation that names the beta posture and tells contributors where to start.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49479314` follows the constraints in `3594-.../SPEC.md` and the chosen stack (Eve, Linq, Kernel, Postgres, Vercel AI Gateway, Google Workspace connector). The visual language matches a developer-facing self-host product: the vault, the agent runtime, and the connectors are first-class surfaces, and there is no third-party tracking added to the docs.

**Color** — neutral surface for the operator UI, one accent for active / in-flight tasks, one muted accent for vault items that require attention. No gradients.

**Type** — one text family for body and configuration, one mono family for agent logs, vault records, and API responses. Type scale is small.

**Density** — table-driven for the vault and the task list; generous spacing for the self-host quick-start and the beta-warning callouts.

**Motion** — minimal; only task-state transitions animate. Everything else is static.

## Constraints

- Beta software: do not use in production. The post states this explicitly and it carries into the MVP's documentation and onboarding.
- Data footprint must stay under the operator's control; any feature that requires sending personal data to a third-party must be opt-in and documented.
- The author's stack (Eve / Linq / Kernel / Postgres / Vercel AI Gateway / connector layer including Google Workspace) is the supported configuration; substituting components is the contributor's responsibility.
- Credential injection via Kernel must not require a separate hosted desktop; the security story is "credentials live in the vault, browser sessions are launched from the host running OpenInstinct."
- The three post example tasks (theatre tickets, golf grip trainer, subscription cleanup) must be reproducible on a clean self-host install before the MVP is considered complete.
