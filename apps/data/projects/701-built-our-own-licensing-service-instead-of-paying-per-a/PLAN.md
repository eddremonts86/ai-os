---
id: "701"
slug: built-our-own-licensing-service-instead-of-paying-per-a
title: "Built our own licensing service instead of paying per active user, then made it MIT"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq0lvr/built_our_own_licensing_service_instead_of_paying/"
  captured: "2026-08-16"
category: saas
date: "2026-08-16"
tags: [saas, b2b, licensing, dev-tools, mit, downloadable-software]
scores:
  money: 7
  learn: 5.5
  fun: 5
tech: [TypeScript, Node.js, Swift, PostgreSQL, Docker, Stripe webhooks, PayPal webhooks]
---
# coolbeans — implementation plan

## Tech Stack

- **Backend service** — Node.js + TypeScript on a single small VPS or container, no managed database, no Kubernetes. The hosted tier runs on the same image as the self-host build.
- **Persistence** — PostgreSQL for licence records, product metadata, and webhook idempotency keys. Schema fits in a single migration; one row per issued key.
- **Webhook ingestion** — Stripe webhook handler (signature-verified) and PayPal webhook handler (signature-verified), both idempotent via the charge ID.
- **Key format** — signed payload + Ed25519 signature, base64url-encoded. Self-contained: a verifier only needs the public key, the payload, and the signature to decide allow-or-deny.
- **Email** — single transactional email provider (Postmark or Resend) for the licence-key delivery; nothing custom.
- **Admin console** — server-rendered HTML (or a tiny SPA) on the same Node service, behind session auth. Not a separate frontend codebase.
- **Swift SDK** — Swift package at github.com/GoldenBerry-SO/coolbeans-swift, depends on a SwiftCrypto-based Ed25519 verifier and a local cache layer.
- **TypeScript SDK** — npm package at github.com/GoldenBerry-SO/coolbeans, depends on `@noble/ed25519` for verification.
- **Shared fixture** — a single test fixture file (JSON + binary) committed to both SDKs' test suites; a CI step runs both SDKs' verifiers against the fixture and asserts agreement.
- **Self-host distribution** — Docker image + `docker-compose.yml` on GitHub Container Registry; the README walks through the four env vars (DB URL, public key, Stripe secret, PayPal secret) and the `docker compose up`.

## Architecture

```
Stripe / PayPal
     │
     ▼ (webhook, signature-verified)
┌──────────────────────────────┐
│  Node + TS licensing service │
│  ┌────────────┐ ┌──────────┐ │
│  │ webhooks   │ │ admin    │ │
│  │ /stripe    │ │ console  │ │
│  │ /paypal    │ │ (HTML)   │ │
│  └─────┬──────┘ └────┬─────┘ │
│        │             │       │
│        ▼             ▼       │
│  ┌─────────────────────────┐ │
│  │  PostgreSQL             │ │
│  │  products, keys,        │ │
│  │  webhook events         │ │
│  └─────────────────────────┘ │
│        │                     │
│        ▼                     │
│  ┌─────────────────────────┐ │
│  │  POST /v1/open (verify) │ │
│  │  → returns              │ │
│  │  {decision, reason}     │ │
│  └─────────────────────────┘ │
└──────────────────────────────┘
                ▲
                │ one HTTP call, one signed answer
                │
   ┌────────────┴────────────┐
   │                         │
┌──┴────────────┐    ┌───────┴────────┐
│ Swift SDK     │    │ TypeScript SDK │
│ (Mac/iOS)     │    │ (Electron/CLI) │
│ signed fixture│    │ signed fixture │
└───────────────┘    └────────────────┘
```

The same Ed25519 public key is embedded in both SDKs. The server's `POST /v1/open` response is the cached-decision refresh signal; the SDKs decide locally from the signed fixture when the server is unreachable.

## Milestones

1. **M1 — Hosted MVP** — Stripe webhook → key issuance → email; admin console with one product, manual key creation, key list, revoke; `cb.open()` endpoint returning `{decision, reason}`; one Swift SDK test app and one TypeScript SDK test app; deployed to a single VPS.
2. **M2 — PayPal parity + offline cache** — PayPal webhook with the same idempotency story; SDK local cache (signed decision + expiry timestamp); both SDKs share the same fixture file in CI.
3. **M3 — Pricing gate** — free tier enforced at 500 active licences per product; $99/yr paid tier with Stripe billing; clear upgrade prompt in the admin console when a studio crosses the limit.
4. **M4 — Self-host polish** — `docker compose up` works end-to-end on a $5 VPS; README documented; example integration in a Tauri app and a CLI tool.
5. **M5 — Migration script** — one-time utility that imports existing Keygen/Cryptlex/LicenseSpring key records and emails the affected customers with their new coolbeans key.

## Risks

- **Hosted tier cost** — Stripe + email + storage + a small VPS lands at single-digit dollars per month per account at small scale; at $99/yr the margin is fine until the long tail of large accounts (thousands of keys, same $99) skews the cost curve. The pricing model is the product, so raising the price breaks the pitch; the alternative is a generous tier-2 cap ("first 5 products and 50,000 active licences for $99, then talk to us").
- **Offline cache window choice** — 7 days feels too short (legit customers who go on holiday lose access) and 30 days feels too long (revoked keys still work offline for a month). v1 should ship 14 days and measure actual revocation pressure before tuning.
- **Webhook idempotency** — Stripe sends webhooks more than once. Without an idempotency key per charge ID, the same key could be issued twice and emailed twice. Standard fix: unique constraint on `keys.charge_id`.
- **Cross-SDK fixture drift** — the "both SDKs agree on who stays unlocked" claim is a marketing promise that has to be backed by a CI test, otherwise a regression in one SDK ships silently and breaks the integration story.
- **Self-host customer-data liability** — the README must say loudly that the operator is responsible for backups, security, and GDPR; otherwise the project's MIT licence does not protect the founder from "the licence server leaked my customer list" support tickets.
