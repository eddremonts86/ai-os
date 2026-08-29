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

## Problem

The author built Sesame, an open-source password manager that keeps the vault local by default. Two architectural choices are stated up front and they are the load-bearing ones: you do not need an account to create or use a vault, and the hosted service never receives the vault itself. That second point — the hosted service never receives the vault — is what makes the accountless-creation design work. Most sync designs anchor on an identity so they can authorize devices against a server-held vault. Sesame removes that anchor: the vault lives on the device, and whatever synchronization exists has to be a vault-to-vault path the server cannot read.

The author is also honest about where the project is. It is still early software. The independent security review is not finished yet, so the author is mainly interested in feedback, testing and people looking through the code. Linux support is not yet released on v0.1.2, but it is in the works. Those two admissions matter for the plan: anything that touches crypto, key derivation, sync or local storage has to be designed so it can survive a security review when one happens, and the platform matrix has to reflect that Linux is a current gap rather than a shipped feature.

The capture names no specific sync mechanism, no specific platform list, no specific crypto library, and no audit timeline. The plan therefore scopes the shape from what the author said and treats the unsaid as design choices to be made, not facts to be asserted.

## Objective

Ship a local-first, open-source password manager whose vault lives on the device by default, where accountless creation is the design rather than a setting, and where the hosted service never receives the vault itself — while the project is honestly early, with an unfinished independent security review, so the architecture has to be reviewable and the gaps visible.

## Target Users

- Individual users who want a password manager whose vault does not live on someone else's server and who do not want to create an account just to start.
- Privacy-conscious users who specifically distrust hosted password vaults and want a project whose threat model states the server never sees the vault.
- Open-source contributors and security reviewers the author is asking to look through the code, who need the cryptographic choices and storage model to be inspectable.
- Multi-device users who need to synchronize a vault across machines without going through an account-bound cloud, which is the architectural puzzle Sesame has to solve.
- Linux users waiting on v0.1.2, who are explicitly named as a current gap rather than a supported platform today.

## MVP Scope

- A local vault stored on the device, encrypted at rest, with the master key derived from a passphrase using a memory-hard KDF.
- Accountless creation: a new vault is created without registering, signing in, or providing an email, and the hosted service has no identity record of the user.
- A desktop client for the platforms the project currently supports (Linux explicitly named as not yet released on v0.1.2, so the supported list is whatever the project actually ships).
- A sync mechanism that moves an encrypted vault between devices without the hosted service being able to read it, so synchronization is end-to-end encrypted by construction.
- An import path from common password manager export formats so switching from a hosted vault is a one-step operation.
- A clear threat model document that names what the system does and does not protect against, including the unfinished independent security review the author flags.
- A visible security review status, so users know the review is in progress and can read what has and has not been looked at.
- A build-from-source path with reproducible builds, so a reviewer can verify the binary they run matches the source they read.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The hosted service must not receive the vault itself, which means sync has to be end-to-end encrypted and the server cannot be a place where plaintext is reconstructable.
- Accountless creation removes the identity anchor most sync designs rely on, so device pairing has to work without a per-user account — a pairing code, a manual key transfer, or an out-of-band channel.
- The independent security review is not finished, so any change to the cryptographic path or storage format is a breaking change in waiting and has to be designed so it can be migrated.
- Linux support is not yet released on v0.1.2, so the supported-platforms list is whatever the project actually ships today; promising Linux as supported would overstate the current state.
- Memory-hard key derivation is non-negotiable for a password manager, so the KDF parameters have to be set for the hardware era the project will outlive, not the era it ships in.
- Auto-fill and browser integration have to be reviewed alongside the vault itself, because the browser is the threat surface a vault actually sits in front of.
- The project is open source and the author is explicitly asking for review, so the code has to be readable by someone auditing it for the first time, not just by the original author.
