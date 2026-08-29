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

## Tech Stack

- **Go** for the core vault engine and CLI, because the project is local-first and Go's single static binary simplifies the "build from source and verify" path the audit story depends on.
- **Wails** for the desktop client, so the UI is a web view over a Go backend and the cryptographic path stays in Go rather than being split across a different language.
- **SQLite with SQLCipher** for the local vault store, so the at-rest encryption is at the storage layer and a stolen device file is not plaintext.
- **Argon2id** as the KDF for the master passphrase, because it is the memory-hard derivation a password manager has to ask of an attacker and the parameters can be calibrated openly.
- **Age encryption** for the end-to-end encrypted sync payloads, because it is a small, modern, reviewable construction that fits the "server is a courier for ciphertext" architecture.
- **WebAssembly crypto** for any browser-side component, so a future browser extension can run the same primitives the desktop client uses rather than a different implementation.

## Architecture

A new vault starts without an account. The application generates a master key, derives the vault key from a passphrase with Argon2id using parameters published in the threat model document, encrypts an empty vault with that key, and writes it to a local SQLite (SQLCipher) database. No identity record is created on the server; the user can use the vault from that one device forever, and the server has nothing to identify them by.

Multi-device use is the architectural puzzle. Because there is no account, device pairing has to happen without a per-user identity on the server. The pairing flow the plan commits to is a short pairing code generated on device A, entered on device B, and used to derive a shared device key from a key-exchange step the server observes but cannot decrypt. Once paired, sync moves encrypted vault blobs (Age-encrypted, payload-key unknown to the server) through whatever transport the operator chooses — the project's hosted sync, a self-hosted relay, or a USB transfer for the privacy-maximal case.

The cryptographic path lives in one place: a Go package that owns KDF, vault encryption, and sync payload construction. Both the desktop client (via Wails) and any future CLI use the same package, so a security review reads one implementation rather than auditing per-platform copies. Browser-side code, when it exists, uses a WebAssembly build of the same primitives so a cryptographic finding has one place to fix.

Storage is local-first by construction. A vault is a SQLCipher database on the device; the server holds nothing but encrypted blobs it cannot read. Import is a separate read-only path that ingests common export formats into a new vault, so leaving a hosted manager is one step rather than a migration project. The threat model document is the architectural contract: it names what the system protects against (a server-side breach, a stolen device file, a passive network observer), what it does not (a compromised endpoint, a weak passphrase), and the limits of the unfinished security review.

## Milestones

1. **M1 — Vault core** — Argon2id KDF, vault encryption, and a SQLCipher-backed local store, with a single-device CLI that can create, unlock, and read entries.
2. **M2 — Threat model document** — a published document naming the adversary model, the cryptographic primitives, and what the review will and will not cover.
3. **M3 — Pairing and sync** — a pairing-code flow that derives a shared device key without a per-user account, and an Age-encrypted sync payload over a chosen transport.
4. **M4 — Desktop client** — Wails shell over the Go vault core, with create, unlock, view, edit, and import flows, and a Linux build that lands on v0.1.2.
5. **M5 — Import path** — a documented import from common password-manager export formats, with a published fidelity statement for each.
6. **M6 — Review surface** — reproducible builds, a build-from-source verification recipe, and a security review status page that names what has and has not been reviewed.
7. **M7 — Linux release** — explicit v0.1.2 release notes for Linux, including any platform-specific limitations a reviewer should know about.

## Risks

- **Unfinished security review** — the author names this; the architecture has to be reviewable, and any review finding must be treated as a blocker for the cryptographic path, not a backlog item.
- **Accountless pairing usability** — pairing codes without an account have to be ergonomic, otherwise users route around the architecture and re-create the identity anchor by sharing credentials.
- **Server-side plaintext reconstruction** — any sync path that lets the server hold an encrypted blob plus a way to derive the key is a defeat of the design, so the protocol has to be reviewed for that specifically.
- **KDF under-calibration** — parameters tuned for today's hardware are weak on tomorrow's, so the KDF parameters have to be set with a forward margin and a published upgrade story.
- **Import fidelity gaps** — import paths silently drop fields the source manager had, and a user finds out only when they need a missing field, so the import path has to publish what it does and does not round-trip.
- **Linux shipping honesty** — promising Linux as a supported platform before it actually is supported is the kind of claim the author is explicitly trying to avoid.
- **Build reproducibility** — if a reviewer-built binary does not match the published binary, the audit story collapses; reproducible builds are part of the deliverable, not a polish item.
