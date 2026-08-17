---
id: "497"
slug: i-built-a-cool-secret-code-website
title: "I built a cool Secret Code website!"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnzfdq/i_built_a_cool_secret_code_website/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, Web Crypto API, PostgreSQL, Resend, Vercel]
---
# I built a cool Secret Code website!

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vnzfdq/i_built_a_cool_secret_code_website/

Original post:

> Hey guys, I built a cool website where you type in your english text, and the engine converts it to and encrypted laguage, then you can copy that and send you friends!, you can also give you rtext a passkey so only you and you friend can decrypt it if they know the passkey! check it out pls!: https://encrypterr.base44.app/ This website was made by a popular trusted website maker, you can trust the link. submitted by /u/Happy_Government9049 [link] [comments]

---

What this plan addresses: A simple "Secret Code" web app: encrypt English text with a passkey, share the ciphertext with a friend who knows the passkey.

## Objective

A simple "Secret Code" web app: encrypt English text with a passkey and share the ciphertext with a friend who knows the passkey. When I want to send a private message to a friend, I want a tool that encrypts my text with a shared passkey, so I do not have to teach them PGP or sign up for Signal.

## Target Users

- Casual users who want a no-account encrypt-and-share tool
- Friends who want to send a private message without learning PGP
- Anyone who finds existing encryption tools intimidating

## MVP Scope

- Encrypt English text with a passkey
- Generate shareable ciphertext link
- Decrypt with passkey on the receiver side
- No account, no logging of plaintext

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnzfdq/i_built_a_cool_secret_code` follows the constraints in `497-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Web Crypto API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes a "cool Secret Code website" with passkey encryption
- Plan keeps the no-account + passkey framing
- Source did not name the encryption algorithm
