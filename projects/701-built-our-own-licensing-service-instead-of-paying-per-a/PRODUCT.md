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
# coolbeans — Flat-fee licensing for downloadable software

## Value Proposition

Coolbeans turns a Stripe or PayPal payment into a signed licence key and gives the buyer's app one function call that returns an allow-or-deny decision. It is built for solo developers and tiny studios shipping desktop, CLI, Electron, Tauri, Mac, or iOS software who resent paying Keygen, Cryptlex, LicenseSpring, or LemonSqueezy a per-active-user or per-revenue fee for a problem they consider already solved. The hosted tier is free for one product and up to 500 active licences, then a flat $99 a year regardless of how many keys the developer issues. The codebase is MIT so anyone can self-host it on a single VPS or container and own the entire customer-data story themselves. A Swift SDK and a TypeScript SDK share the same signed decision file so a Mac app and a web companion built against the same key never disagree, and an offline app behaves identically until the cache window expires.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo devs shipping Mac/iOS/Electron/Tauri apps | Per-seat licence fees scale with their success; a flat $99/yr removes the disincentive to grow |
| Tiny studios (1-5 people) | Replacing Keygen/Cryptlex/LicenseSpring with an MIT self-host keeps customer data on their own infra |
| Open-source maintainers with paid builds | Hosted tier stays free under 500 active licences, so commercialising an OSS tool costs nothing until it crosses that line |
| CLI tool authors selling licences | Single `cb.open(key)` API keeps the integration cost under an hour, and the offline cache handles the "laptop on a plane" case |

## Jobs To Be Done

1. **Functional job** — turn a payment webhook into a working licence key and make the app verify it without network on every launch.
2. **Emotional job** — ship without the recurring dread of a per-seat line item that grows the more the developer succeeds.
3. **Social job** — be the kind of indie who charges a fair flat fee instead of "taxing growth", as the source post frames it.

## Success Metrics

- **Activation:** ≥ 80% of accounts that hit "create product" issue their first licence key within 7 days; integration time-to-first-`cb.open()` ≤ 1 hour for both SDKs.
- **Retention:** > 70% of paid-tier accounts renew at $99/yr in year 2; hosted-tier accounts stay under 500 active licences without churn pressure.
- **Revenue:** $99/yr per paying account; gross margin > 90% on the hosted tier because the workload (webhook → key issuance → email) is small and the SDK is client-side; self-host generates zero hosted revenue but should not detract from the hosted tier.

## Pricing & Monetization

Free for the first product and up to 500 active licences, then $99 a year flat. The flat fee is the explicit value proposition: not per seat, not per revenue, not per transaction. Self-host under MIT is free forever, including for commercial use. The hosted tier is the only revenue surface, and it is priced so a developer can outgrow the free tier only by being successful enough to happily pay $99.

## Competitive Landscape

- **Keygen** — incumbent in the licence-server space; per-active-user pricing is the exact pain the source post is reacting against.
- **Cryptlex** — similar shape to Keygen; same per-seat model and the same complaint pattern from indie developers.
- **LicenseSpring** — feature-rich licensing SaaS; percentage-of-revenue or per-seat plans; heavier than most one-person studios need.
- **LemonSqueezy** — includes licensing with the merchant-of-record checkout; built for SaaS-style subscriptions rather than downloadable software, so its licensing story is bolted on rather than native.
- **Self-hosted Roll-Your-Own (DIY JWT + Postgres)** — the implicit baseline; works for one product but the cross-SDK signed-decision-file work is non-trivial to repeat.

## Risks & Open Questions

- **Free-tier abuse.** A studio with multiple products at $0 each is not currently blocked. Need a clear "1 product per account" rule or a hard cutoff at 500 active licences regardless of product count.
- **Offline cache window.** The cached decision must expire; otherwise a revoked key keeps working offline for too long. The current "coarse timestamp window" wording in the SPEC is intentionally vague — needs a concrete number (likely 7-14 days) before v1 ships.
- **Hosted tier economics.** $99/yr has to cover Stripe fees + email delivery + storage. At small scale it does; at very large scale the workload does not change, so the risk is concentrated in the long tail of accounts that issue thousands of keys and pay the same $99.
- **Cross-SDK fixture drift.** The Swift and TypeScript SDKs share a fixture file by convention. Without a CI step that exercises both against the same generated input, a regression in one SDK could ship undetected.
- **Migration story.** A developer already on Keygen or Cryptlex will not switch unless key re-issuance and customer comms are scripted. Worth a migration script in v1, even if it is a thin wrapper over the Stripe webhook.

---

_Source:_ [Reddit r/SaaS](https://www.reddit.com/r/SaaS/comments/1vq0lvr/built_our_own_licensing_service_instead_of_paying/) · **Posted:** 2026-08-16T15:53:34+00:00
