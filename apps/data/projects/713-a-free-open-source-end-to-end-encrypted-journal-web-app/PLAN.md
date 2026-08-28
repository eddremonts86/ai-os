---
id: "713"
slug: a-free-open-source-end-to-end-encrypted-journal-web-app
title: A Free Open Source End to End Encrypted Journal Web App
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxuk6/a_free_open_source_end_to_end_encrypted_journal/"
category: saas
date: "2026-08-16"
---
# A Free Open Source End to End Encrypted Journal Web App

## Tech Stack

- SvelteKit (frontend + server).
- Rust (one or more backend services; specific role not detailed in source).
- SQLite (storage for ciphertext entries).
- Open source on GitHub: github.com/MrSheerluck/smbl-journal.

Stack chosen because the poster stated it; deviating would not match the source.

## Architecture

A simple client-encrypted journal:

- Client (SvelteKit browser code) encrypts each entry before sending.
- Server (SvelteKit + Rust) stores ciphertext in SQLite. It cannot read plaintext.
- Open-source repo carries the implementation.

The architecture is intentionally minimal because the source describes a single-purpose text journal with no media, no tiers, no analytics.

## Milestones

1. M0 — Confirm the stated stack (SvelteKit + Rust + SQLite) and the E2EE invariant ("server never receives plaintext") as hard constraints.
2. M1 — Carry the GitHub repo URL into every frontmatter reference so the source can be checked.
3. M2 — Treat "free with no limits" as the product frame; reject any enrichment that adds tiers.

## Risks

- Key-recovery risk: the source does not address what happens if a user loses their device. A missing key-recovery story is a real footgun.
- Audit risk: client-side encryption primitives must be reviewable; if the cipher choice or key derivation is non-standard, the privacy claim is weaker than it looks.
- Scope-creep risk: adding images, audio, or sync would expand the threat surface; the source explicitly says text only.
- Fork-fragmentation risk: open source + free + no operator control means forks will diverge; the source does not address governance.
