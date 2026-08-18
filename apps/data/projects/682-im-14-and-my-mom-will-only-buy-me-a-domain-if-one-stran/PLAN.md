---
id: "682"
slug: im-14-and-my-mom-will-only-buy-me-a-domain-if-one-stran
title: "I'm 14 and my mom will only buy me a domain if one stranger actually pays for my app."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpskax/im_14_and_my_mom_will_only_buy_me_a_domain_if_one/"
category: saas
date: "2026-08-16"
tags: [saas, education, consumer, anti-cheat]
tech: [Next.js, TypeScript, ProseMirror, Supabase, Cloudflare R2, Stripe]
---
# I'm 14 and my mom will only buy me a domain if one stranger actually pays for my app.

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Editor:** a custom contenteditable wrapper around ProseMirror (keystroke events captured at the DOM level).
- **Replay storage:** Cloudflare R2 (cheap, immutable, signed-URL access).
- **Tamper-evidence:** hash-chain of replay events, signed with a per-essay key, anchored to a public timestamp service (e.g. RFC 3161).
- **Payments:** Stripe.
- **Backend:** Supabase (auth + the replay manifest + the verification-method metadata).

## Architecture

Web app + Supabase + R2 + a hash-chain verifier. The editor captures keystrokes; the server stores the manifest; the replay URL is a signed link to the R2 artifact + the manifest.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-essay demo. End of week 1.
2. **M1 — Editor + keystroke capture.** End of week 3.
3. **M2 — Hash-chain + signed replay URL.** End of week 5.
4. **M3 — 5 verification methods + replay UI.** End of week 7.
5. **M4 — Stripe paywall.** End of week 9.

## Risks

- **Tamper-evidence must hold up in an honour-code dispute** — the hash-chain + public-timestamp anchoring is the moat.
- **25 verification methods is a stretch** — the MVP scopes 5-7; the rest are roadmap, not promises.
- **Founder availability** — the product must not depend on the founder's personal involvement.
