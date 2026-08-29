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

## Problem

A bitcoin holder (the source problem was submitted from Colombia, after the author lost access to the ProblemHunt form fields when the SPA failed to render — the title and the verbatim quote captured in the original draft carry the problem statement) has been worrying for a year about what happens to their funds if they die unexpectedly. The trade-off is binary and painful: share the seed phrase and risk theft; don't share it and the funds are lost forever. The author has tried the obvious approaches — writing the seed phrase on paper and hiding it, sharing with a trusted family member, looking at multisignature wallets and custodial inheritance services — and rejected them all: paper is fragile and discoverable, sharing with a family member is a single point of compromise, and multisig and custodial services are too complex or require more trust in intermediaries than the author is willing to give. There is no off-the-shelf tool that solves "if I disappear tomorrow, my family gets the bitcoin, and no one else can."

## Objective

Ship a self-custodial bitcoin inheritance tool that lets a holder split a "recovery key" into multiple sealed shares (paper / steel / passphrase), distribute them to heirs or to safe deposit boxes, and tie the recovery together with a configurable dead-man's-switch (time-lock or inactivity timer) — without requiring the holder to trust a custodian or a multisig coordinator. The MVP is "split the key, send the shares, walk away, and the family recovers the funds after the configured inactivity window".

## Target Users

- **Primary:** self-custody bitcoin holders (single-seed cold-storage users, hardware-wallet owners) who hold meaningful value and want an inheritance plan that doesn't require them to trust a custodian or a multisig coordinator.
- **Secondary:** family members / lawyers / executors of the holder who need a clear, documented recovery procedure that does not require technical knowledge of Bitcoin.
- **Tertiary:** holders of other long-duration self-custody assets (Ethereum, other UTXO chains, encrypted file vaults) who want the same pattern.

## MVP Scope

- A desktop / browser app that takes a BIP-39 seed phrase (or a raw private key) and produces N sealed shares using Shamir's Secret Sharing (or a SLIP-39 equivalent) with a configured threshold (e.g. 3-of-5).
- Each share is exportable as a paper card (PDF) and a steel-plate-ready template.
- A "check-in" mechanism (periodic: holder confirms liveness on the app or via a signed message; configurable cadence 30 / 90 / 180 days).
- An "inactivity protocol" definition: if no check-in within the configured window, the recovery document activates; heirs with M-of-N shares can reconstruct the seed and move the funds to a pre-declared recovery address.
- A single-time "I am deceased" instruction file (PDF) the holder prints and gives to their lawyer / family that documents exactly how many shares are needed and where they are stored.
- No third-party custody in v1 — the tool produces shares and instructions only; the on-chain recovery is performed by the heirs themselves once they reconstruct the seed.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must remain fully self-custodial — no server-side escrow, no custodian, no KYC, no "we hold your shares until you die" model. The tool runs locally and produces artefacts only.
- The check-in mechanism must work without a required third party (an offline / local-only mode is acceptable as long as the recovery flow doesn't depend on the tool's servers still being up).
- Must work with standard hardware wallets (Ledger, Trezor, Coldcard) for the live sign of check-ins; the recovery phase should not require the original hardware wallet (it may be lost).
- Multi-language support from day one (English + Spanish, given the source market).
- Cannot be marketed as legal advice — the tool produces instructions; the lawyer / notary / executor interprets them.
- The tool must not transmit the seed phrase or the shares over the network in v1. Air-gapped operation is a hard requirement.
