---
id: "3655"
slug: sesame-a-local-first-open-source-password-manager
title: "Sesame - a local-first, open-source password manager"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483038"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Go, Wails, SQLite (SQLCipher), WebAssembly crypto, Age encryption, Argon2id]
---
# Sesame - a local-first, open-source password manager

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Sesame is a local-first, open-source password manager whose vault lives on the device by default. There is no account to create just to start a vault, and the hosted service never receives the vault itself — the sync path between devices is end-to-end encrypted, so the server is a courier for ciphertext it cannot read rather than a holder of plaintext.

The architecture is the product: removing the identity anchor most sync designs rely on is what makes the "the hosted service never receives the vault" claim possible. The author is also honest about where the project is — it is still early software, the independent security review is not finished yet, and Linux support is not yet released on v0.1.2 — so the plan treats those as design constraints rather than marketing claims to soften.

**One-liner:** Sesame keeps your password vault on your device by default, lets you start one without creating an account, and routes any sync through end-to-end encrypted channels so the hosted service never sees the vault.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Privacy-conscious individuals | The threat model is stated explicitly: the hosted service never receives the vault. |
| Users without an email they want tied to a vault | Accountless creation removes the identity anchor most password managers require. |
| Security reviewers the author is asking to look through the code | Open source, build-from-source path, and an unfinished independent security review that is named rather than hidden. |
| Multi-device users who refuse hosted sync | End-to-end encrypted sync is the architectural commitment, not a setting. |
| Linux users waiting on v0.1.2 | The platform gap is named honestly rather than being glossed as supported. |
| Importers from a hosted password manager | A one-step import path lowers the cost of leaving a vault that does hold the plaintext. |

## Jobs To Be Done

1. **Functional job** — Store and retrieve passwords from a vault that lives on the device, not on a vendor's server.
2. **Functional job** — Synchronize a vault across devices without a per-user account and without the sync server being able to read the vault.
3. **Functional job** — Import an existing vault from a common password manager export format so leaving a hosted vault is one step.
4. **Emotional job** — Trust the password manager because the threat model is stated in writing and the cryptography is reviewable, not because the marketing is reassuring.
5. **Social job** — Signal to technically literate peers that the password manager is open source, local-first, and built to be audited.

## Success Metrics

- **Accountless start completion** — share of new vaults created without an account step, since accountless creation is the architectural commitment and not a setting.
- **Sync round-trip without server-readable plaintext** — verified by attempting to decrypt a captured sync payload server-side, which is the test that backs the "the hosted service never receives the vault" claim.
- **Independent review coverage** — share of the cryptographic path, storage layer, and sync protocol that has been read by a reviewer, since the project is honest about the review being unfinished.
- **Import success rate** — share of attempted imports from common export formats that produce a usable vault, since lowering the cost of leaving a hosted vault is part of the value.
- **KDF calibration** — measured key-derivation time on a reference machine, published alongside the parameters so a reviewer can see the work factor being asked of an attacker.
- **Build-from-source reproducibility** — share of released versions where a reviewer-built binary matches the published binary, because the audit story collapses if the binary cannot be verified.

## Pricing & Monetization

The author shares no price, no tier and no hosted plan; the project is open source and the hosted service is positioned as something that never receives the vault. The architecture fixes only the cost shape: any future hosted offering has to be priced around what the server actually does, which is store encrypted blobs the server cannot read, so it is structurally a storage-and-bandwidth product rather than a per-seat vault product.

## Competitive Landscape

- **Hosted password managers with account-bound vaults** — the obvious alternative and the one Sesame is explicitly a counter-proposal to, because the hosted service receives the vault in those designs (even when "zero knowledge" marketing claims the opposite).
- **Other local-first password managers** — exist in the same architectural neighbourhood; the capture names none, so no further comparison is claimed here.
- **Browser-built-in password stores** — free and ubiquitous, but bound to the browser vendor's account and not portable across vendors or to a standalone app.

The capture names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Decide and publish the cryptographic path: KDF, vault encryption, sync protocol, and key derivation, so the unfinished review has a concrete target.
- [ ] Publish the threat model document the project commits to, including what the hosted service is and is not expected to see.
- [ ] Define the device-pairing flow without an account: pairing codes, manual key transfer, or an out-of-band channel, and the tradeoffs of each.
- [ ] Land Linux on v0.1.2 and reflect the supported-platform matrix honestly, including any platform that is not yet released.
- [ ] Set the KDF parameters for the hardware era the project will outlive, not the era it ships in, and document the reasoning.
- [ ] Ship the import path with a documented fidelity statement: which fields round-trip and which do not.
- [ ] Complete and publish the independent security review the author has flagged as unfinished, and treat any finding as a blocker for the cryptographic path.
