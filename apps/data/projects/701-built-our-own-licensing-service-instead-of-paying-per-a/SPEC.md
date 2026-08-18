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
# Built our own licensing service instead of paying per active user, then made it MIT

## Problem
 We sell a couple of our own small apps. Every time we shipped one we hit the same wall: how do you turn a Stripe payment into a licence key, and how does the app check that key when the customer's laptop is on a plane? The existing options are Keygen, Cryptlex, LicenseSpring, or LemonSqueezy's licensing. They work. They also charge per active user or take a percentage, and your customer data lives on their servers. For a small product that's a recurring line item for a problem that's already solved. So we built it and open-sourced it under MIT: https://coolbeans.tools What it does: a Stripe or PayPal webhook comes in, a key gets issued and emailed, and your app makes one call and gets one answer. const state = await cb.open(licenseKey) if (state.decision === 'deny') lockApp(state.reason) You can selfhost it or use the hosted version with $0 while you're small (1 product, 500 active licences) and $99 a year flat after that for everything. Not per seat, not a percentage. Ten keys or ten thousand is the same price. I'd rather have a boring predictable number than be incentivised to tax someone's growth. Worth saying plainly: this is for downloadable software, so desktop, CLI, Electron, Tauri, Mac and iOS. If you're pure web SaaS you probably don't need it, you already have auth and subscriptions. There's also Swift SDK and a TypeScript one, and both run against the same fixture file so they agree on who stays unlocked. Code is at https://github.com/GoldenBerry-SO/coolbeans. Happy to answer anything submitted by /u/PiXeL161616 [link] [comments]

---

## Objective

Ship a downloadable-software licensing service that any solo developer or tiny studio can integrate in under an hour, that bills itself as a flat $99/year after a free 1-product / 500-active-licence tier instead of per-seat or per-revenue, that survives offline use without phoning home on every keystroke, and that the founder can stand behind because the alternative ("taxing someone's growth") is the explicit anti-pattern. The MVP must include a Swift SDK and a TypeScript SDK that share one cryptographic decision file so a Mac app and an Electron app using the same key agree on who stays unlocked.

## Target Users

- **Primary:** solo developers and tiny studios (1-5 people) shipping downloadable software — desktop apps, CLI tools, Electron or Tauri apps, Mac and iOS — who currently pay Keygen, Cryptlex, LicenseSpring, or LemonSqueezy a per-active-user fee or a percentage and resent the recurring line item for a problem they consider already solved.
- **Secondary:** open-source maintainers who want to issue paid licence keys for a commercial build of their project and need a hosted option that costs nothing until they cross 500 active licences.
- **Tertiary:** hobbyists and bootstrappers who just want Stripe or PayPal → key → app check and do not care which vendor issues the key as long as it is cheap, predictable, and self-hostable.

## MVP Scope

- Inputs: a Stripe or PayPal webhook on `payment.succeeded` triggers key issuance; an admin console creates keys manually for offline or wholesale sales.
- Issuance: a signed licence key is emailed to the buyer and stored alongside the Stripe/PayPal charge ID and the product ID.
- Verification: an app calls one endpoint (`cb.open(licenseKey)`) and gets back `{ decision: 'allow' | 'deny', reason }`. Denials carry a human-readable reason so the app can render the correct unlock screen.
- Offline-friendly: the SDK caches the last decision locally; an app that opens offline behaves identically until the cache expires. Both Swift and TypeScript SDKs read the same fixture file so a Mac app and a web companion built against the same key never disagree.
- Pricing: $0 / month for 1 product and ≤ 500 active licences; $99 / year flat after that, no per-seat, no per-revenue.
- Distribution: MIT-licensed self-host (Docker image + docker-compose) and a hosted option at coolbeans.tools.
- Surfaces in v1: hosted console (create product, view keys, view active count, revoke, reissue), Swift SDK, TypeScript SDK, Stripe webhook adapter, PayPal webhook adapter.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single admin page that lists products and their active-licence count, with one button per row to issue / revoke / reissue. The developer-facing API is one function call and one typed return value — no SDK-side state machine, no ceremony. The hosted and self-hosted consoles share the same look so a team migrating between them does not retrain.

## Constraints

- The pricing model is the product. Anything that looks like "per active user", "per seat", "per transaction", or a revenue share is out of scope by definition.
- The verification call must return in under 200 ms on a warm cache; otherwise the SDK's local cache is doing the work and the hosted endpoint is only a refresh signal.
- An issued key must remain valid even if the hosted endpoint is briefly unreachable, so the SDK must hold enough signed state to decide locally. The shared Swift + TypeScript fixture file is the implementation of that requirement.
- The licence-key format must be self-contained (signed payload + signature) so an offline verification needs no network and no clock sync beyond a coarse timestamp window.
- Self-hosting must work on a single small VPS or a free-tier container; no Kubernetes, no external cache, no managed database. A `docker compose up` should be the entire install.
- All customer data must live on the operator's own infrastructure (self-host) or on the operator's chosen hosted instance — never on a third-party licence server that the operator does not control.
