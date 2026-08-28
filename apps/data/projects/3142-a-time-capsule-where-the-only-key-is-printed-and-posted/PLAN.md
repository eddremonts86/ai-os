---
id: "3142"
slug: a-time-capsule-where-the-only-key-is-printed-and-posted
title: A time capsule where the only key is printed and posted to you
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448650"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# A time capsule where the only key is printed and posted to you

## Tech Stack

A small web service plus a print-and-post pipeline: the interesting engineering is envelope-level, not application-level, so the stack stays minimal and the key is generated, printed, and then dropped from the server's own storage.

## Architecture

A secret is encrypted client-side under a key that is generated once, rendered to a printable artefact, handed to a postal provider, and then not retained in a form the service can use. The server keeps ciphertext it cannot open; redemption is the first moment the key and the ciphertext meet again.

## Milestones

1. Encrypt-on-create with the key never persisted server-side
2. Printable key artefact and a postal fulfilment path
3. Redemption flow that reveals the secret from the printed key
4. Publish at madebyahuman.global with the no-recovery terms stated plainly

## Risks

- A lost key means an unrecoverable capsule, by design, and users will still ask for recovery
- Postal delivery is slow and geographically limited
- If the key ever touches server logs the whole premise fails quietly
