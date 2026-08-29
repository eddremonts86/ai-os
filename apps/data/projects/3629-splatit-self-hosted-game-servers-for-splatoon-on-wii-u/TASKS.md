---
id: "3629"
slug: splatit-self-hosted-game-servers-for-splatoon-on-wii-u
title: SplatIt. Self-hosted game servers for Splatoon on Wii U
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482125"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, Tokio, Hyper, SQLx, PostgreSQL, Docker]
---
# SplatIt. Self-hosted game servers for Splatoon on Wii U

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3629-splatit-self-hosted-game-servers-for-splatoon-on-wii-u/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up a Tokio project with a TCP listener and a structured-logging configuration that scrubs credential-looking fields
- [ ] Add a Hyper-based HTTP operator endpoint on the same runtime, exposing current match state
- [ ] Stub the protocol handshake with a logged accept/reject path that does not print payloads
- [ ] Define the SQLx schema for matches and players with one migration per store
- [ ] Implement match-state persistence on every state transition with a resume path on restart
- [ ] Build the match state machine with explicit transitions and a test for each
- [ ] Wire UDP handling for the parts of the protocol that need it, sharing the Tokio runtime
- [ ] Add session-to-match routing so a connected client lands in the right match record
- [ ] Verify that the SQLite path and the PostgreSQL path both pass the same schema-level tests in CI
- [ ] Write the honest scope statement listing what the server does and does not implement
- [ ] Package as a single Docker image with the configuration file mounted from the host
- [ ] Document the VPS deployment and the home-operator deployment from the same base

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
