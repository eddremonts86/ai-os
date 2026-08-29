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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3665-agentify-chat-e2e-encrypted-remote-chat-for-codex-claud/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Vite SPA browser chat surface with IndexedDB-backed history and the WebCrypto key generation and message encryption
- [ ] Implement the small relay ferrying encrypted blobs between the browser and the CLI process, designed so the relay cannot read the plaintext
- [ ] Add per-CLI adapters for Codex, Claude and Grok behind a common send/receive interface, pinned to documented CLI versions
- [ ] Document the key-management model: where keys live, what happens on browser-storage clear, and the explicit export path
- [ ] Implement the publish-with-redaction path so redaction runs in the browser before the share link is generated, with a preview of what is being shared
- [ ] Document the share-link lifecycle: how long a published session is reachable, what is redacted by default, and what the user has to remember
- [ ] Add the honest scope disclosure: MVP is the three named CLIs; the universal-remote dream goal is a roadmap item, not MVP
- [ ] Respect the structural limit of end-to-end encryption: do not promise server-side features (search, analytics) that require plaintext
- [ ] Ship a documented build-from-source path so a reviewer can verify the cryptographic client matches the source
- [ ] Keep the early-software disclosure visible to the user, consistent with the author's own framing

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
