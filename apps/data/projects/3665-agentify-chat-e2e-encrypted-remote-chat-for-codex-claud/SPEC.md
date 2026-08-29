---
id: "3665"
slug: agentify-chat-e2e-encrypted-remote-chat-for-codex-claud
title: "Agentify Chat – E2E-Encrypted Remote Chat for Codex, Claude, Grok CLIs"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482455"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Vite SPA, WebCrypto API (AES-GCM, X25519), IndexedDB, Codex CLI, Claude CLI, Grok CLI]
---
# Agentify Chat – E2E-Encrypted Remote Chat for Codex, Claude, Grok CLIs

## Problem

The author has shared Agentify Chat, which he is honest about: it is still under heavy development and rough around the edges, but he would rather share than keep perfecting. The post is specific about three things.

First, the architecture: chat.agentify.sh is a remote control for the Codex, Grok and Claude CLIs, with the dream goal of becoming a universal remote that lets the user use all of them from a single chat. Everything lives in the browser, including the chat itself, and the only thing sent over the wire is the encrypted chat messages end to end. Second, the publish path: another feature is the ability to publish a chat session with redaction (the post includes an example share link) so the user can share it with a team. Third, the author's ask: curious to gather feedback and whether this is something to continue pursuing, plus an in-person note about a Walk & Talk event in Bellevue.

Two design tensions are worth surfacing because they are load-bearing. Client-held keys plus a publish-with-redaction path means the client is responsible for both encrypting for the recipient and redacting before sharing, which is a cryptographic design tension the plan has to take seriously. And the universal-remote dream goal is a long way from the MVP of "remote control for three named CLIs"; the plan scopes MVP to the three CLIs the post names and treats the universal-remote ambition as a roadmap item rather than a hidden MVP item.

The capture does not name the key-management model, the CLI integration mechanism, the redaction surface, or the share-link lifecycle. Those are scoped as design choices rather than facts.

## Objective

Ship a browser-based remote control for the Codex, Claude and Grok CLIs where the chat lives in the browser and only encrypted chat messages traverse the wire, with a publish-with-redaction path for sharing sessions with a team — built honestly as an early, rough project whose ambition is larger than its current surface.

## Target Users

- Developers using the Codex, Claude or Grok CLIs who want to drive them from a browser rather than a terminal.
- Teams that want to share an AI-assisted session with a colleague without sending plaintext to a third-party service.
- The author himself (and other CLI-first developers) who value end-to-end encryption because the chat content is what they are working on.
- Reviewers and curious users the author is asking for feedback from, who want to see what an early, honest version of the idea looks like.
- Future users (when the universal-remote ambition lands) who want a single chat surface for multiple CLIs.

## MVP Scope

- A browser-based chat surface that talks to the Codex, Claude and Grok CLIs from a single UI.
- Client-side key management where the keys are held in the browser and only encrypted chat messages traverse the wire.
- A publish-with-redaction path that lets the user share a session with a team, with redaction applied before the share link is generated.
- A clear scope statement: the MVP is a remote control for the three named CLIs, not yet the universal remote the author describes as the dream goal.
- A documented CLI integration mechanism so the project can be wired to new CLIs as they appear, without promising them as supported.
- A documented key-management model, including what happens to keys when the user clears browser storage, and what the user is responsible for.
- A documented share-link lifecycle: how long a published session is reachable, what is redacted by default, what the user has to remember.
- An honest "early software" disclosure consistent with the author's own framing, since the project is shared for feedback rather than shipped as a finished product.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author is explicit that the project is heavy under development and rough around the edges; the plan must not overpromise readiness, and the disclosure has to be visible to the user.
- Client-held keys mean key loss is real; if the user clears browser storage, the chat history is unrecoverable unless explicitly exported, and the plan has to state this rather than hide it.
- The publish-with-redaction path is a cryptographic design tension: the same client that encrypts for a recipient must also redact before sharing, and the plan has to take both responsibilities seriously.
- The universal-remote ambition is a dream goal in the post, not an MVP feature; the plan scopes MVP to the three named CLIs and treats expansion as a roadmap.
- End-to-end encryption means the server cannot see plaintext; any feature that requires server-side inspection (search, analytics) is structurally impossible, and the plan has to respect that.
- CLI integration is operationally fragile: CLIs change, auth models change, and the integration has to be tested against the current CLI versions.
- The share link is a public URL by construction; the redaction has to be applied before the link is generated, not after, because a published URL is reachable by anyone who has it.
