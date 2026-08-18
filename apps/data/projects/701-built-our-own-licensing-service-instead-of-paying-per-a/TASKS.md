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
  money: 7.0
  learn: 5.5
  fun: 5.0
tech: [TypeScript, Node.js, Swift, PostgreSQL, Docker, Stripe webhooks, PayPal webhooks]
---

# coolbeans — tasks

## Phase 0: Scaffold

- [ ] Stand up the repo: `coolbeans/` (server), `coolbeans-swift/` (SDK), `coolbeans-ts/` (SDK). MIT licence in each, CODEOWNERS for the founder.
- [ ] Choose the Ed25519 library on both sides (`@noble/ed25519` on TS, `CryptoKit` on Swift) and pin the public-key format so the fixture file is byte-identical across both SDKs.
- [ ] Define the licence-key payload schema (product ID, charge ID, expiry, features) and write a one-page format doc.
- [ ] Define the PostgreSQL schema: `products`, `keys`, `webhook_events`. One migration file, no ORM ceremony.
- [ ] Decide on the email provider (Postmark or Resend) and create the `licence-key-issued` template.
- [ ] Write the Docker Compose for self-host: one `app` service, one `postgres` service, a volume for Postgres data.

## Phase 1: Core

- [ ] Stripe webhook handler with signature verification and idempotency on `charge_id`; on success, generate a signed key, store it, email it.
- [ ] PayPal webhook handler with the same idempotency story and the same key-generation path.
- [ ] Admin console: list products, list keys per product (paginated), create-key form, revoke button, reissue button. Server-rendered HTML, session auth.
- [ ] `POST /v1/open` endpoint: input `{ key }`, output `{ decision: 'allow' | 'deny', reason }`. Reason is human-readable and stable across SDK versions.
- [ ] TypeScript SDK: `cb.open(key)` returns the typed result, caches the last decision locally with a 14-day expiry, and falls back to the cached decision when the network call fails.
- [ ] Swift SDK: same `cb.open(key)` signature, same cache, same fallback behaviour. Uses `CryptoKit` for verification.
- [ ] Shared fixture file: a JSON + binary fixture committed to both SDKs' test suites. A CI step in each SDK repo runs the fixture through the SDK's verifier and asserts agreement with the reference output.
- [ ] Free-tier gate: at issuance, check the count of active keys per product; if ≥ 500, refuse issuance and surface the upgrade prompt to the admin.
- [ ] Paid-tier gate: hosted accounts above 500 active licences see a "switch to $99/yr" link in the admin; on upgrade, the gate lifts and Stripe billing starts.
- [ ] Self-host end-to-end: clone, set four env vars, `docker compose up`, run the test webhook, see the key in the inbox, see `cb.open()` return `allow`.
- [ ] Integration examples: one Tauri desktop app, one CLI tool, both calling `cb.open()` on startup with the offline-cache fallback path.

## Phase 2: Deploy

- [ ] Hosted tier deployed to a single small VPS behind HTTPS, with Postgres backups enabled and a documented restore procedure.
- [ ] GitHub Container Registry publishes the same Docker image that runs in self-host, so a self-hoster can `docker pull` a known good version.
- [ ] Stripe and PayPal webhook URLs point at the hosted tier with shared-secret signature verification.
- [ ] Production smoke test: issue a real $1 Stripe test payment, see the key arrive, call `cb.open()` from a sandbox Tauri app and a sandbox CLI, see both return `allow`.
- [ ] Runbook for the founder: how to revoke a single key, how to revoke a product, how to rotate the Ed25519 signing key (rare but documented).

---

_Source:_ [Reddit r/SaaS](https://www.reddit.com/r/SaaS/comments/1vq0lvr/built_our_own_licensing_service_instead_of_paying/) · **Posted:** 2026-08-16T15:53:34+00:00