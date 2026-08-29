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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Agentify Chat is a browser-based remote control for the Codex, Claude and Grok CLIs, with the chat living in the browser and only encrypted chat messages traversing the wire. A publish-with-redaction path lets the user share a session with a team; the client applies redaction before the share link is generated, because a published URL is reachable by anyone who has it.

The author is honest about where the project is — heavy under development and rough around the edges, shared for feedback rather than shipped as a finished product. The dream goal of a universal remote for all CLIs is named in the post but is not the MVP; the plan scopes the MVP to the three CLIs the post names and treats the universal-remote ambition as a roadmap.

**One-liner:** Agentify Chat drives the Codex, Claude and Grok CLIs from a browser chat where only encrypted messages hit the wire, with a publish-with-redaction path for sharing sessions with a team.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Codex/Claude/Grok CLI users | A browser chat drives the CLI rather than the terminal. |
| Teams sharing AI-assisted sessions | The share path redaacts before publishing, so the team sees what is safe to share. |
| Privacy-conscious users | The wire carries only encrypted messages; the server never sees plaintext. |
| Reviewers giving feedback | An honest "early software" disclosure rather than a polished product claim. |
| Future universal-remote users | A roadmap item, not a hidden MVP feature. |

## Jobs To Be Done

1. **Functional job** — Drive the Codex, Claude or Grok CLI from a browser chat rather than the terminal.
2. **Functional job** — Share a session with a team via a redaction-aware link, with redaction applied before publishing.
3. **Functional job** — Keep the wire carrying only encrypted messages, so a server-side breach does not leak the chat.
4. **Emotional job** — Trust the browser client because the key-management model is stated and the early-software status is honest.
5. **Social job** — Use one chat surface across multiple CLIs (the dream goal), without that promise being made before it can be kept.

## Success Metrics

- **End-to-end encryption coverage** — share of chat messages that traverse the wire only as ciphertext, since the wire-only-encrypted-claim is the headline architectural commitment.
- **Redaction-before-publish enforcement** — share of share links generated where redaction ran before the URL was emitted, since a published URL is reachable by anyone.
- **CLI integration reliability** — share of CLI interactions that complete against the current CLI versions, since CLI APIs drift.
- **Documented scope adherence** — share of features added beyond the three named CLIs that are framed as roadmap, not silently promoted to MVP.
- **Honest disclosure visibility** — share of sessions where the user sees the early-software disclosure before they start, since overpromising readiness is the headline failure mode.
- **Key-management clarity** — share of users who can answer "where are my keys" after reading the docs, since key loss is the failure mode of any client-held-key system.

## Pricing & Monetization

The capture names no price, no tier and no monetization shape; the project is shared for feedback. The architecture fixes only the cost shape: cost scales with the volume of CLI traffic the project brokers and the volume of share-link reads, not with the number of users, so any future paid shape would have to be priced around CLI traffic or share-link reads rather than per seat.

## Competitive Landscape

- **Hosted AI chat products** — the obvious alternative and the one Agentify Chat is explicitly a counter-proposal to for users who do not want their chat on a vendor's server.
- **Terminal multiplexers and remote-shell tools** — solve a related problem (drive a remote terminal from elsewhere) but are not scoped to AI CLIs and do not offer redaction-aware sharing.
- **Other browser-based CLI front-ends** — exist in the same neighbourhood; the differentiator is the redaction-aware share path and the explicit end-to-end encryption, not the browser surface itself.

The capture names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Document the key-management model and the consequences of clearing browser storage, since key loss is the structural failure mode.
- [ ] Enforce redaction before the share link is generated, not after, since a published URL is reachable by anyone.
- [ ] Scope MVP to the three named CLIs (Codex, Claude, Grok) and resist promoting the universal-remote dream to MVP status.
- [ ] Keep the early-software disclosure visible to the user, consistent with the author's own framing.
- [ ] Build the CLI integration against the current CLI versions and document the supported versions, since CLIs drift.
- [ ] Respect the structural limit of end-to-end encryption: server-side features that require plaintext (search, analytics) are impossible, and the plan must not promise them.
- [ ] Decide the share-link lifecycle: how long a published session is reachable, what is redacted by default, what the user has to remember.
