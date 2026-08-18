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

## Tech Stack

Chosen for this problem:
- **Rust** for the client helper — small static binary that wraps git; strong crypto ecosystem (`age`, `ring`, `aws-lc-rs`).
- **Git's smart HTTP protocol** as the transport — reuse existing git plumbing, encrypt at the object layer above it.
- **`age`** (or libsodium sealed boxes) for object-level encryption — authenticated encryption with a clean public-key model.
- **A reference server in Go** (or Rust) deployable as a single binary or Docker image; storage backend is dumb ciphertext on disk or S3-compatible object storage.
- **Web UI (HTMX or vanilla)** for admin tasks — adding a public key, rotating, audit log of when the server last saw the remote.

## Architecture

```
+------------------+         encrypt on egress         +------------------+
|  Developer laptop |---------------------------------->|  Ghostfork remote |
|  (Rust client)   |  smart-http over TLS, body AES-256|  (Go / single bin)|
|  keypair: priv + |  with AEAD, auth via age pubkey  |  stores ciphertext|
|  pub  (local)    |<----------------------------------|  indexed by SHA   |
+------------------+         decrypt on ingress         +------------------+
        |                                                              |
        v                                                              v
   standard git CLI                                              dumb object store
   (porcelain untouched)                                        (local FS or S3)
```

The client intercepts `git push`/`git fetch`, replaces each git object's payload with an encrypted blob, signs the request with the user's private key, and serves the same content back on fetch. The remote stores opaque blobs. Even a hostile operator who reads the disk sees nothing but ciphertext indexed by git SHA.

## Milestones

- **M1 (week 1–2):** `git push` to a ghostfork remote with AES-encrypted objects; same SHA-1 IDs preserved end-to-end.
- **M2 (week 3–4):** keypair bootstrap UX — first-run generates keys, prompts the user to back up the private key, fails closed if no backup exists.
- **M3 (week 5–6):** `git clone` from a ghostfork remote without any client-side pre-shared secret (uses the remote's public key from the URL).
- **M4 (week 7–8):** reference server (single binary, Docker image) deployable on Coolify with a postgres-backed audit log.
- **M5 (week 9–10):** threat-model write-up and a public audit of the encryption protocol.
- **M6 (week 11–12):** decide on hosted mode and pricing based on early user feedback.

## Risks

- **Key loss is total loss of the repo.** No escrow means a stolen laptop + dead backup = unrecoverable code. This needs an explicit, scary UX, not a "trust us" footnote.
- **Encrypted blobs lose git's dedup across remotes.** If two users push similar trees to different remotes, neither knows. May matter at scale.
- **Performance on large repos.** Encrypting every object has a CPU cost; pushing a 5 GB repo should still finish in seconds, not minutes — needs benchmarking early.
- **Audit surface.** The client must be open source AND easy to audit. A clever backdoor would defeat the entire premise. Treat the client like a crypto library: small, reviewed, reproducible builds.
- **No named market in the source.** The author built this for themselves. The next decision — whether to charge — has no signal from the post.
