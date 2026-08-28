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

## Phase 0: Scaffold

- [ ] Confirm `SPEC.md` Problem captures the poster's exact framing: free, open source, E2EE text journal, server never receives plaintext, built with SvelteKit + Rust + SQLite
- [ ] Carry the E2EE invariant ("server cannot read plaintext") into `SPEC.md` Constraints as non-negotiable
- [ ] Carry the open-source / no-tier / no-limit frame into `PRODUCT.md` Pricing & Monetization without inventing a price
- [ ] Add the GitHub repo URL (`github.com/MrSheerluck/smbl-journal`) to frontmatter or `PRODUCT.md` body for verifiability
- [ ] Add frontmatter `tags` for `journal`, `e2ee`, `open-source`, `sveltekit`, `rust`

## Phase 1: Core

- [ ] Re-read the Reddit thread and capture any replies that name the encryption primitive or audit it
- [ ] Reject any enrichment that introduces tiers, paid features, or media support — the source is text-only, free, no limits
- [ ] Treat the key-recovery story as an open question, not a solved problem — the source is silent
- [ ] If a downstream plan adds analytics, gate it on a documented metadata-leak audit

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
