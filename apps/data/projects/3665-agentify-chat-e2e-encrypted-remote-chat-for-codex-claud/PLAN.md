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

## Tech Stack

- **TypeScript with a Vite SPA** for the browser client, because the post says "everything lives in your browser including the chat", and a SPA is the right shape for a browser-resident application with end-to-end encryption.
- **WebCrypto API** for the cryptographic operations, using AES-GCM for message encryption and X25519 (or equivalent) for key agreement, so the cryptography is provided by the platform rather than a third-party library.
- **IndexedDB** for the local chat history and key material, so the browser-resident state persists across sessions without a server.
- **Codex CLI, Claude CLI, and Grok CLI** as the three supported back-ends for MVP, with an integration layer that abstracts over the per-CLI differences.
- **A small relay or peer-transport layer** that moves encrypted blobs between browser and CLI process, designed so the relay cannot read the plaintext.
- **A redaction layer** that runs in the browser before a share link is generated, with an explicit allowlist/denylist mechanism and a preview of what is being shared.
- **A documented build-from-source path** so a user can verify the binary matches the source, since the audit story of a cryptographic client depends on the build being reproducible.

## Architecture

The architecture is the post in two sentences: everything lives in the browser including the chat, and the only thing sent over the wire is the encrypted chat messages end to end. The browser holds the chat history in IndexedDB and the cryptographic keys in IndexedDB-backed key material; the CLI process is invoked by a small relay that ferries encrypted blobs between the browser and the CLI. The relay sees only ciphertext and the routing metadata required to deliver it; it cannot read the chat.

Key management is client-held by construction. Keys are generated in the browser using WebCrypto, the private key never leaves the browser, and the public key is shared with the relay (or with the peer) for key agreement. The consequences of clearing browser storage have to be stated honestly: chat history and key material are unrecoverable unless explicitly exported, and the plan ships an export path so a user who wants to back up can back up. A user who does not want to think about keys gets the default; a user who does gets the documented advanced surface.

The CLI integration layer abstracts over Codex, Claude and Grok. Each CLI has its own auth model, command shape and response format; the abstraction is a thin per-CLI adapter that exposes a common "send message, get response" interface to the chat surface. The MVP supports the three named CLIs; expansion to additional CLIs is a roadmap item rather than a hidden MVP feature. CLI version drift is real, so the integration is pinned to documented CLI versions and the supported-version list is published.

The publish-with-redaction path is the cryptographic design tension. The same browser client that encrypts for a recipient must redact before sharing, because a published URL is reachable by anyone who has it. The redaction layer runs in the browser before the share link is generated, with a preview of what is being shared so the user sees what they are about to publish. The share link itself is a public URL with a stable identifier; the lifecycle (how long it is reachable, what is redacted by default) is documented and configurable per share.

The end-to-end encryption commitment is a structural limit, not a feature. Any server-side feature that requires plaintext (search across chats, analytics on message content) is impossible by construction, and the plan does not promise them. The early-software disclosure is visible to the user, consistent with the author's own framing: the project is shared for feedback, not shipped as a finished product.

## Milestones

1. **M1 — Browser chat surface** — a Vite SPA with the chat UI, IndexedDB-backed history, and the WebCrypto key generation and message encryption.
2. **M2 — CLI relay and integration** — a small relay ferrying encrypted blobs between browser and CLI process, with the per-CLI adapter for Codex, Claude and Grok.
3. **M3 — Documented key-management model** — a clear statement of where keys live, what happens when the user clears browser storage, and the export path.
4. **M4 — Publish-with-redaction path** — redaction that runs in the browser before the share link is generated, with a preview of what is being shared.
5. **M5 — Share-link lifecycle** — how long a published session is reachable, what is redacted by default, and what the user has to remember.
6. **M6 — Honest scope disclosure** — the MVP scope (the three named CLIs) and the roadmap (the universal-remote dream goal) are visible to the user.
7. **M7 — Reproducible build** — a documented build-from-source path so the cryptographic client can be audited by a reviewer.

## Risks

- **Key loss** — clearing browser storage means losing chat history and key material unless explicitly exported; the consequence has to be stated honestly.
- **Redaction after publish** — applying redaction after a URL is reachable is too late; the architecture has to enforce redaction before the link is generated.
- **CLI version drift** — CLIs change; the integration has to pin to documented versions and the supported-version list has to be published.
- **Universal-remote creep** — the dream goal is a roadmap item, not MVP; overpromising it would invite scrutiny the project cannot meet.
- **End-to-end encryption misunderstanding** — users may expect server-side features (search, analytics) that are structurally impossible; the disclosure has to make the limit clear.
- **Build trust** — a cryptographic client whose binary does not match the source has no audit story; reproducible builds are part of the deliverable.
- **Early-software overpromising** — the author is explicit that the project is heavy under development; the disclosure has to stay visible.
