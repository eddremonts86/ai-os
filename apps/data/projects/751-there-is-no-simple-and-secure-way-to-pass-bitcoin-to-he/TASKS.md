---
id: "751"
slug: there-is-no-simple-and-secure-way-to-pass-bitcoin-to-he
title: There is no simple and secure way to pass bitcoin to heirs in the event of sudden death. Without complex multisignature setups or trust in third parties.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/gs2svjum41-there-is-no-simple-and-secure-way-to-pas"
  captured: "2026-03-29"
category: finance
date: "2026-03-29"
tags: [Finance, Security, Dev, Other]
country: Colombia
tech: [TypeScript, Node.js, BIP-39 / BIP-32 / BIP-85, "Shamir's Secret Sharing", end-to-end encrypted vault, time-locked transaction templates]
---
# There is no simple and secure way to pass bitcoin to heirs in the event of sudden death. Without complex multisignature setups or trust in third parties.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Document the threat model in DESIGN.md (share-stealing heir, lost holder, coerced holder)
- [ ] Pick the audited SLIP-39 reference implementation (trezor-firmware vs. iancoleman)
- [ ] Decide the desktop shell: Tauri (Rust + webview) vs. Electron
- [ ] Define the share-card PDF format (size, font, copy-pasteable seed words + checksum QR)
- [ ] Decide the initial hardware-wallet target for the live check-in (recommend Coldcard for air-gap simplicity)

## Phase 1: Core

- [ ] Tauri desktop app: paste BIP-39 seed, choose M-of-N (default 3-of-5), produce N sealed share PDFs
- [ ] Per-share PDF: seed words + checksum QR + holder-supplied location hint + tamper-evident seal instructions
- [ ] Recovery-instruction PDF: plain-language, "you need 3 of these 5 cards; the seed words go here", with placeholders for lawyer / storage locations
- [ ] Recovery CLI / static webapp (served from a USB stick) that takes M shares and reconstructs the seed; verify by re-importing into Electrum / Sparrow
- [ ] Check-in: hardware-wallet sign-message flow against a configurable cadence (30 / 90 / 180 days), with a local reminder file
- [ ] OP_CLTV recovery transaction template generation; document chain-fee assumptions and how to re-sign if fees move
- [ ] Air-gap discipline: zero network calls in the local app, telemetry off, crash reports scrubbed, README states "do not paste your seed into anything online"
- [ ] Bilingual UI (English + Spanish) from day one
- [ ] End-to-end test: split a known seed into 3-of-5, destroy 2 shares, recover the seed from the remaining 3, verify against the original

## Phase 2: Deploy

- [ ] "Have a lawyer review this" page in the PDF generator; link to a Colombia-based crypto-estate attorney for the LatAm market
- [ ] Inheritance Concierge v1: paid 1-hour video call with a human specialist to review the holder's plan
- [ ] Pilot with 10 self-custody holders across at least two countries
- [ ] Audit of the SLIP-39 / Shamir implementation by a third-party cryptographer before public release
