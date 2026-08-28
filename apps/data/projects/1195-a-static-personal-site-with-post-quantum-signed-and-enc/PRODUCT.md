---
id: "1195"
slug: a-static-personal-site-with-post-quantum-signed-and-enc
title: A static personal site with post-quantum signed and encrypted URLs
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49345687"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A static personal site with post-quantum signed and encrypted URLs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi everyone!! I made my own personal static website inspired by my friend's Carrd. I ended up implementing a browser-native post-quantum PGP-like system: signed and encrypted messages are carried directly in URL hash fragments, so the user does not need any accounts, specialized software, or key uploads. Once installed as a PWA, verification and decryption can run fully offline; the only thing that needs to reach the device is the URL itself. Clicking a link with a signed message automatically verifies the signature against the site’s pinned public key. For encrypted messages, clicking the link and entering the passphrase unlocks the payload. I have tested the functionality from an iPad Air 2 to a Ryzen 9 9950X.I chose UOV and Classic McEliece because both schemes have very large public keys but tiny transmitted payloads. The site hosts the public keys as static binary assets, so the large keys do not increase the size of each shared message link. UOV adds a 96-byte signature, while Classic McEliece adds a 96-byte KEM ciphertext; the remaining URL size is mostly the compressed message itself and symmetric-encryption overhead.Additionally, I implemented a signed theme feature inspired by Owala. As my website only uses 5 color hexes total, I can sign official colorways with UOV and encode the signed colorway directly into a URL that verifies and applies it in one click. Anyone can edit the theme locally, but they cannot distribute a modified colorway as one of my official themes because diaryof.me verifies the UOV signature against my pinned public key before applying it.Schemes used:Symmetric encryption: XChaCha20-Poly1305-SIV (libsodium)
Password KDF: Argon2id (libsodium)
KEM: Classic McEliece 348864f
Signatures: UOV-pkc-IsThis is my personal diary, and I dedicate it to my irl best friend. I'd love to hear any feedback. Enjoy!

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49345687) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
