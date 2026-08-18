---
id: "2984"
slug: encrypted-git-remote-server
title: Encrypted Git Remote Server
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337799"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Encrypted Git Remote Server

## Problem

The author has been programming professionally for years and grew uneasy about handing their code to companies like GitHub. The trust assumption — that GitHub won't read or exfiltrate your code, and that the host won't get breached by attackers — sits in tension with the way most teams actually collaborate: NDAs, external contractors, and large game studios all sharing the same hosted remote. They built **Ghostfork**, a client-side git helper that sits between the developer and the remote, encrypting everything before it leaves the machine and decrypting on the way back. The server operator is assumed hostile or at minimum incompetent: even a compromised or subpoenaed server should yield nothing readable.

## Objective

Ship a usable encrypted git remote that a developer can `git push` and `git pull` against without trusting the server at all. The client must remain fully open source so the encryption can be audited; the server should be replaceable (self-hostable, BYO-cloud) and interchangeable with the existing git CLI. End-state is "the server sees ciphertext; nothing else."

## Target Users

1. **Independent developers and small teams** with proprietary codebases who don't want to rely on a third party's security posture for their source of truth.
2. **Studios and consultancies** that already require NDAs of contractors and want the host to enforce the same boundary the legal paperwork does.
3. **Anyone who has read a postmortem about a hosted git compromise** and wants an alternative that's still actually `git`.

## MVP Scope

- A ghostfork client wrapping `git fetch`/`git push`/`git clone`, fully open source.
- An encrypted remote protocol: every blob, tree, commit, and ref sent through the server is encrypted client-side before transmission.
- A reference server implementation (deployable by the user) that stores ciphertext and nothing else.
- Public-key onboarding: the client generates a keypair on first run; the remote holds the public key and the user holds the private one.
- Local conflict resolution that matches stock git semantics — no special branching model.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The client must be fully open source so anyone can audit the encryption; the server is allowed to be closed only if its role is "dumb ciphertext storage" that is trivially replaceable.
- Must integrate with the standard git CLI — no custom porcelain required for normal workflows.
- Threat model: server operator is untrusted; assume compromise or compelled disclosure is possible.
- No claims about WTP in the source. This is a buildable product, not a validated business; a reasonable next step is whether to monetize (hosted ghostfork instance? team plans?) or keep it fully open.
