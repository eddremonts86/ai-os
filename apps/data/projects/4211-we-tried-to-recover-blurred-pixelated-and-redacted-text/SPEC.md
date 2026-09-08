---
id: "4211"
slug: we-tried-to-recover-blurred-pixelated-and-redacted-text
title: "We tried to recover blurred, pixelated and redacted text (480 cases)"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508614"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# We tried to recover blurred, pixelated and redacted text (480 cases)

## Problem

"Don't blur, redact" is old advice, but the parametric answer was missing: how much blur is enough, at what text size, and what survives JPEG recompression through a chat app. The poster's study (datablur.app/blog/blur-recovery-study) ran a 480-case test: six fields (email, card number, IBAN, phone, API key `sk_live_...`, person's name), two fonts (Arial proportional, Menlo monospace), two sizes (14 px, 20 px), ten treatments (Gaussian blur with sigma 2/4/8/12 px, pixelation 4/8/12/16 px blocks, 20%-opacity "transparent" overlay, solid box), each treated image saved once more as JPEG quality 80 — 24 × 10 × 2 = 480 cases. The attacker assumed a known font, size, position, and character set; recovery is a beam search over characters. Results: gaussian blur with sigma 2–4 px recovered the original text exactly 92 to 100% of the time; 4-px pixelation recovered 71%; a 20%-opacity overlay recovered 100%. JPEG recompression barely helped. The threshold rule: if blur radius or pixel block is smaller than about 0.3 × font size in pixels, assume the text can be read back; at 0.4 to 0.6 × you still leak a third to a half of the characters; recovery only dropped to chance at 0.8 × and above. The product is a 100%-local blur tool for live demos, calls, and screen recordings — no cloud, no sign-up.

## Objective

Quantify, in public, how little blur it takes for an attacker to recover sensitive text from a screenshot, and ship a local blur tool that produces only solid-box redactions when the text really needs to stay hidden.

## Target Users

- Security teams producing screenshots and recordings for documentation
- Support agents sharing screen recordings with customers
- Engineers posting screenshots to GitHub issues or Slack
- Anyone who has shared a "blurred" screenshot and wondered if it was actually safe

## MVP Scope

- 100%-local blur tool that runs in the browser or as a desktop overlay
- Solid-box redaction by default (the only treatment that leaked nothing)
- Parametric guidance: blur radius vs font size
- Reference dataset and code under CC-BY for reproducibility
- Optional: redacted-only export for screen recordings

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- 100% local — no cloud, no sign-up, no upload
- The default redaction must be a solid box, not a blur
- Reference dataset and code published under CC-BY
- The blur tool must work in live demos, calls, and screen recordings