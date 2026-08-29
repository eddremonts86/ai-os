---
id: "3655"
slug: sesame-a-local-first-open-source-password-manager
title: "Sesame - a local-first, open-source password manager"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483038"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Go, Wails, SQLite (SQLCipher), WebAssembly crypto, Age encryption, Argon2id]
---
# Sesame - a local-first, open-source password manager

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3655-sesame-a-local-first-open-source-password-manager/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement Argon2id KDF with parameters published in the threat model and a calibration test on a reference machine
- [ ] Build the SQLCipher-backed local vault store with at-rest encryption and a single-device CLI for create, unlock, and read
- [ ] Author and publish the threat model document, naming the adversary model, the primitives, and the unfinished-review scope
- [ ] Implement the pairing-code device-pairing flow that derives a shared device key without a per-user account
- [ ] Build the Age-encrypted sync payload and the transport layer over the hosted sync, a self-hosted relay, and USB transfer
- [ ] Ship the Wails desktop client with create, unlock, view, edit, and import flows, and verify the Linux build lands on v0.1.2
- [ ] Add the documented import path from common password-manager export formats with a published fidelity statement per format
- [ ] Set up reproducible builds and a build-from-source verification recipe, and publish a security review status page
- [ ] Treat every security review finding as a blocker for the cryptographic path and document the resolution
- [ ] Update the supported-platform matrix honestly, including any platform not yet released, and reflect it in the release notes

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
