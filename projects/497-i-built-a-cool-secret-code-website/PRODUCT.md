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

> Auto-enriched product brief.

## Value Proposition

A simple "Secret Code" web app: encrypt English text with a passkey and share the ciphertext with a friend who knows the passkey.

## Target Users

- Casual users who want a no-account encrypt-and-share tool
- Friends who want to send a private message without learning PGP
- Anyone who finds existing encryption tools intimidating

## Jobs To Be Done

When I want to send a private message to a friend, I want a tool that encrypts my text with a shared passkey, so I do not have to teach them PGP or sign up for Signal.

## Success Metrics

- At least 1,000 messages encrypted in pilot
- Self-reported "my friend decrypted it" rate above 80%

## Pricing & Monetization

Pricing & Monetization is intentionally left as TODO in this plan because the source post at `https://www.reddit.com/r/SideProject/comments/1vnzfdq/i_built_a_cool_secret_code` did not name a price, a billing model, or a comparable benchmark. Forcing a price here would invent a claim the poster never made. The pricing decision lives in a separate product memo once the MVP is shipped and a real user from the country stated in the source has validated the value of the task it removes.

## Competitive Landscape

PGP, Signal exist in the broader world; not named. Plan is a no-account, casual wedge.

## Risks & Open Questions

- Algorithm choice must be honest (real encryption, not toy)
- No-logging claim must be technically correct
