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

## Tech Stack

- **Core language:** TypeScript (Node.js) for the local CLI / desktop tool; same language as the reference SLIP-39 / Shamir implementations.
- **Crypto primitives:** `bip39` for seed phrases, `bip32` for HD derivation, `slip-0039` for Shamir's Secret Sharing over mnemonic shares, `bip85` for deterministic entropy from a master seed.
- **Wallet integration (live check-in):** Trezor / Ledger / Coldcard via their respective libraries (e.g. `@trezor/connect`, `ledgerco`, `coldcard-js`); uses the device's "sign message" feature, never exports the seed.
- **On-chain time-lock templates:** pre-signed transactions using `OP_CLTV` (BIP-65) for the recovery path; signed only by the holder, broadcastable by anyone with the seed.
- **PDF generation:** `pdfkit` (local, no network) for share cards and the recovery-instruction PDF.
- **UI:** Tauri (Rust + webview) desktop app — runs locally, no telemetry, ships as a single signed binary for macOS / Windows / Linux.
- **No server, no telemetry.** The tool is fully local. If a hosted "Inheritance Concierge" tier is added later it must be strictly opt-in and not required for any MVP feature.

## Architecture

The tool has two distinct phases — the setup phase (held by the holder) and the recovery phase (held by the heirs) — and they must never meet online. The setup phase runs locally, takes the seed, produces M-of-N shares plus a recovery instruction, and discards the seed from memory. The recovery phase runs locally on the heir's machine, takes the printed shares, reconstructs the seed, and produces a signed transaction moving the funds to a pre-declared recovery address.

```
HOLDER (setup)
  ──▶ Desktop app (Tauri + TS)
        │
        ├─▶ BIP-39 seed in
        ├─▶ SLIP-39 split (M-of-N)
        ├─▶ Per-share PDF (paper / steel template)
        ├─▶ Recovery instruction PDF (for the family / lawyer)
        └─▶ OP_CLTV pre-signed recovery transaction template
              (broadcastable after inactivity window)

HEIRS (recovery)
  ──▶ Recovery tool (CLI / webapp served from a USB stick)
        │
        ├─▶ M shares in (typed or QR-scanned)
        ├─▶ SLIP-39 combine → seed
        └─▶ Sign recovery transaction → broadcast
```

## Milestones

1. **M0 — Spec freeze + threat model.** SPEC.md + DESIGN.md approved; document the threat model (share-stealing heir, lost holder, coerced holder). End of week 1.
2. **M1 — Local SLIP-39 split.** Tauri desktop app takes a seed phrase, prompts for M-of-N, and exports per-share PDFs with verifiable checksums. End of week 3.
3. **M2 — Recovery-instruction PDF.** Auto-generated, plain-language, with placeholders for storage location and lawyer contact. End of week 5.
4. **M3 — Recovery tool.** Standalone CLI / static HTML that takes M shares and reconstructs the seed; verify by re-importing into a fresh wallet. End of week 7.
5. **M4 — Check-in + time-lock template.** Hardware-wallet sign-message check-in cadence; OP_CLTV pre-signed recovery transaction template; document the chain-fee UX. End of week 10.
6. **M5 — Inheritance Concierge v1.** A hosted tier with a 1-hour video-call specialist; payable but optional. End of week 13.

## Risks

- **Air-gap discipline.** Any feature that tempts the user to "upload the seed to back it up" breaks the value proposition. Telemetry must be off by default; even crash reports must be scrubbed.
- **Threat model: insider threat.** A single share-stealing family member who waits out the inactivity window still gets the funds. The threshold (M-of-N) is the only mitigation, and the holder must distribute shares across people, not places.
- **On-chain fee UX.** Pre-signed time-lock transactions become invalid when the fee assumption is wrong. The MVP should pair the OP_CLTV template with a CoinJoin / batch-spend flow or document a "re-sign if fees move" path.
- **Legal weight of the recovery PDF.** Colombian (and other) inheritance law may require notarial acts the PDF cannot replace. The tool must not promise what it cannot deliver; a "have a lawyer review this" page is mandatory.
- **Hardware-wallet compatibility.** Each vendor has a different message-signing API. The MVP should target one vendor well (Coldcard, since it has the simplest air-gapped export) and add the others later, not try to support all three at once.
- **Single-maintainer crypto code.** SLIP-39 / Shamir implementations are easy to write incorrectly. Use the audited `trezor-firmware` reference implementation or `iancoleman/slip39` (audited), not a from-scratch rewrite.
