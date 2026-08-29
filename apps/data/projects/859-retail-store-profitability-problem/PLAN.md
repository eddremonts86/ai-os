---
id: "859"
slug: retail-store-profitability-problem
title: Retail store profitability problem
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/r94p9mdzl1-retail-store-profitability-problem"
category: retail
date: "2025-10-31"
tags: [Retail, Other]
country: Philippines
tech: [Flutter (mobile), Dart, Firebase Firestore, Firebase Cloud Functions (Node.js), Cloudflare Workers, Square Reader SDK (sandbox), Xendit (sandbox), Google Cloud Storage, Coolify, Docker]
---
# Retail store profitability problem

## Tech Stack

- **Flutter (mobile)** for the owner-facing app, because the user journey is a phone-first daily reconciliation with offline tolerance and Flutter's single-codebase reach across Android and the Filipino BYOD market is well matched.
- **Dart** end to end so the reconciliation, signal generation and export logic share types across the app and the Cloud Functions backend.
- **Firebase Firestore** as the operational store for owners, products, daily reconciliations, signals and audit logs, with offline persistence enabled so a reconciliation can be staged without a connection.
- **Firebase Cloud Functions (Node.js)** for the signal-generation jobs that run on a schedule per owner, plus the weekly summary message sender.
- **Cloudflare Workers** as a small, fast edge layer in front of the Firestore reads for the read-heavy signal panel.
- **Square Reader SDK (sandbox)** and **Xendit (sandbox)** as the day-one payment-processor integrations, both behind an explicit opt-in and an audit log per transaction.
- **Google Cloud Storage** as the storage layer for any owner-uploaded product images and exported CSV archives, on a per-owner prefix with lifecycle rules aligned to the documented retention policy.
- **Coolify** for hosting the Cloud Functions and the Cloudflare Workers edge layer, on a single container for the MVP.
- **Docker** for local development parity and for the Cloud Functions container image.

## Architecture

The owner-facing app is a Flutter mobile application that handles the daily reconciliation flow, the per-product margin view, the per-day profitability view, the signal panel and the CSV export. The reconciliation flow accepts total sales, total cash and a short list of items sold, with a barcode-scanner option and a product-catalogue picker. Firestore persistence is offline-first so a reconciliation can be staged without a connection and synced when one is available; the app surfaces a per-field sync status so the owner knows what is and is not yet persisted.

Signal generation runs as a scheduled Firebase Cloud Function per owner, calculating slow-moving stock to discount, fast-moving stock to reorder and category-level margin drift over the last seven days. The thresholds for each signal are operator-configurable rather than hard-coded, and the generated signals carry the underlying data version so the weekly summary message can be re-sent if the operator changes a threshold.

The payment-processor integrations (Square Reader SDK and Xendit) are opt-in per owner, with a per-transaction audit log and an explicit consent screen naming the data captured. Integrated transactions feed into the same reconciliation flow so the owner's daily input drops to a few taps for any day with processor transactions.

The CSV export is built server-side in a Cloud Function and stored under the owner's Google Cloud Storage prefix; the export carries the non-POS-replacement disclaimer in its header. The operator-facing product-taxonomy editor is a simple admin route behind a single-admin role, backed by the same Firestore collection as the owner's catalogue.

The non-POS-replacement disclaimer is rendered on every screen of the app and on every CSV export header. Audit logs record every reconciliation, every signal generation, every export and every consent change, with the data version referenced. Cloudflare Workers cache the read-heavy signal panel responses at the edge so the owner's daily signal check is fast on Filipino mobile connections.

## Milestones

1. **M1 — Reconciliation and catalogue** — Flutter app with the daily reconciliation flow, the product catalogue picker and Firestore offline persistence.
2. **M2 — Margin views** — per-product margin view and per-day profitability view with weekly and monthly aggregates.
3. **M3 — Signal panel** — scheduled Cloud Function per owner generating the three signals with operator-configurable thresholds.
4. **M4 — Weekly summary** — in-app and optional SMS weekly summary message with the three signals in plain language.
5. **M5 — CSV export** — server-side CSV build, Google Cloud Storage storage under per-owner prefixes, non-POS-replacement disclaimer in the header.
6. **M6 — Payment-processor integrations** — Square Reader SDK and Xendit sandbox integrations behind opt-in consent and per-transaction audit log.

## Risks

- **Reconciliation friction** — a daily flow that requires the owner to type in every transaction by hand is not the MVP; the catalogue picker and the payment-processor integrations exist for a reason and must ship in the same release window.
- **Signal noise** — thresholds that fire too often erode trust, thresholds that never fire hide the signal; the operator-configurable threshold surface is a feature, not a nicety.
- **Offline-sync confusion** — a reconciliation that the owner thinks was saved but was not is a data-loss failure; per-field sync status surfacing is required.
- **PII exposure** — sales, cost and supplier data is sensitive in the Filipino small-business context; a clear retention policy and per-owner GCS prefixes must exist before the first pilot user.
- **Disclaimer invisibility** — an app screen that does not visibly carry the non-POS-replacement disclaimer is an app that an owner might treat as a POS; the disclaimer is a feature, not a footer.
- **Pricing mismatch** — a paid tier priced for a US SMB market will be unbuyable for a Filipino sari-sari owner; the pricing shape has to be designed against Filipino small-retail economics from day one.
- **Language policy gap** — an English-only MVP that quietly excludes Filipino-preferring owners is a coverage gap the moment the first Filipino-preferring owner arrives; the language policy has to be a stated milestone, not a silent deferral.
