# SPEC.md — A mnemonic-free wallet where the private key never leaves the phone's TEE

## Problem

The phone is designed as part of the chain — a cornerstone of it. All on-chain truth lives on the phone side.<p>The chain isn&#x27;t deployed yet. The bigger it gets, the more unwieldy it becomes — 3 million lines of Rust, 312 crates. It&#x27;s starting to feel like it could collapse under its own weight.<p>The wallet generates keys directly inside the phone&#x27;s chip TEE. The private key never leaves the TEE. That genuinely lets you say goodbye to annoying private keys and mnemonics for good.<p>I put up a preview of the wallet client on GitHub:<p>https:&#x2F;&#x2F;github.com&#x2F;niumeta-TZ&#x2F;niumeta&#x2F;releases&#x2F;tag&#x2F;NiuMeta-Mobile-Client-APK-Preview-Multilingual.apk<p>It&#x27;s open source now — 1.5 million lines of code. The consensus and core business logic aren&#x27;t open sourced yet.<p>https:&#x2F;&#x2F;github.com&#x2F;niumeta-TZ&#x2F;niumeta<p>0 stars. The original repo had 200+ stars. GitHub said it triggered an AI risk-control flag and 404&#x27;d it. I appealed for 10 days, no resolution, so I just deleted it and rebuilt a new one. I feel like GitHub is outdated now — you can&#x27;t update at the pace of &quot;old-school programming&quot; anymore. Every update has to be a massive batch, and even then it still gets flagged. Speechless.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49720965)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-16T01:07:33Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
