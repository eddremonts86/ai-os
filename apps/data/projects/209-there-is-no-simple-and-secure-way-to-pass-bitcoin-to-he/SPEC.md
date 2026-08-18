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

## Problem

A Colombian user holding bitcoin on a self-custody wallet has no clean way to pass it to heirs in the event of sudden death. Multisig with geographically distributed signers is the standard answer, but it requires an heir who is technically capable, a notary who understands it, and a recovery script that may itself be a single point of failure. If the heir is a non-technical spouse or parent, the bitcoin is effectively lost forever.

What is missing is a 'deadman switch' service that holds no keys but releases a multi-step recovery package to a verified heir after a sustained absence of a heartbeat signal — ideally without the user having to teach their family anything technical before the event.

## Objective

A service that lets a self-custody bitcoin holder publish a recovery package (encrypted, sharded, time-locked) that is released to a verified heir only after a sustained absence signal, without the service holding any bitcoin at any time.

## Target Users

Bitcoin holders in Latin America and the US with self-custody who have at least one non-technical heir and want a recovery path that does not require ongoing family education about keys.

## MVP Scope

User generates a sharded, encrypted recovery package locally. Uploads ciphertext to the service. Configures a heart-beat (weekly check-in, on-chain inactivity oracle, or both). Names the heir and verification steps. Heir verification: ID upload, video chat, and a notarised death certificate. Service releases the shards only after all gates pass. No bitcoin custody by the service.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `209-.../SPEC.md` and the chosen stack (Rust, Bitcoin Core, Nostr). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Colombia.

For Colombia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Service must NOT hold any keys or any bitcoin at any time. Recovery package must be undecryptable by the service. Heartbeat failure must trigger a multi-day warning (not instant release) to allow for false positives. Heir verification must be legally defensible against fraudulent claims. Tor support for jurisdictions where this is sensitive.
