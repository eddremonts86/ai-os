---
id: "209"
slug: there-is-no-simple-and-secure-way-to-pass-bitcoin-to-he
title: "There is no simple and secure way to pass bitcoin to heirs in the event of sudden death. Without complex multisig, heirs lose access forever."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-03-29"
tags: [Fintech, Crypto, Inheritance]
country: Colombia
tech: [Rust, Bitcoin Core, Nostr, PostgreSQL, Next.js, Tor]
---
# There is no simple and secure way to pass bitcoin to heirs in the event of sudden death. Without complex multisig, heirs lose access forever.

## Tech Stack

Rust for the local recovery-package tooling (sharding, encryption). Bitcoin Core for the on-chain inactivity oracle. Nostr for the heartbeat signal (decentralised). PostgreSQL for the heir-verification ledger. Next.js for the user and heir dashboards. Tor for the sensitive jurisdictions.

## Architecture

User generates package locally → ciphertext uploaded → heartbeat loop runs every week across two channels → on sustained absence, multi-day warning → heir verification flow → shard release. Service holds ciphertext only and cannot decrypt.

## Milestones

M0 — local recovery-package tool with sharding and encryption. M1 — heartbeat signal channel and absence detection. M2 — heir verification flow. M3 — release workflow. M4 — pilot with 20 bitcoin holders in three countries.

## Risks

Risk of routing attacks on the heart-beat signal. Risk of a fraudulent heir claim. Legal risk if the service is interpreted as a custodian. Operational risk if the service is shut down — the recovery package must remain decryptable by the user independently.

## Data Model

## Integrations

Rust for the local recovery-package tooling (sharding, encryption). Bitcoin Core for the on-chain inactivity oracle. Nostr for the heartbeat signal (decentralised). PostgreSQL for the heir-verification ledger. Next.js for the user and heir dashboards. Tor for the sensitive jurisdictions.
