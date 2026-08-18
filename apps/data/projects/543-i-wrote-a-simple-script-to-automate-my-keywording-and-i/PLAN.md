---
tags: ["saas", "creator", "chrome-extension", "ai"]
tech: ["Next.js", "TypeScript", "Chrome Extension MV3", "Anthropic Claude", "Supabase", "Stripe"]
id: "543"
slug: i-wrote-a-simple-script-to-automate-my-keywording-and-i
title: "I wrote a simple script to automate my keywording, and it accidentally turned into a full app."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9quq/i_wrote_a_simple_script_to_automate_my_keywording/"
category: saas
date: "2026-08-14"
---
# I wrote a simple script to automate my keywording and it became a Chrome extension

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS for the drop-zone and the keyword review.
- **Chrome extension:** manifest v3, TypeScript; reads EXIF from the page, fills the keyword field.
- **AI layer:** a single Anthropic Claude call per image, with a hard cap on per-image inference cost.
- **Storage:** Supabase (auth, the keyword history, the per-user confidence thresholds).
- **Payments:** Stripe.

## Architecture

Web app for the drop-and-tag flow; Chrome extension for the agency-side pre-fill. The web app writes the keywords to EXIF; the extension reads EXIF and pre-fills the agency's keyword field.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-image tag-and-write demo. End of week 1.
2. **M1 — Batch tag + EXIF write.** Drag-and-drop, AI keywords, EXIF preservation. End of week 3.
3. **M2 — Chrome extension.** Manifest v3, EXIF reader, agency-side pre-fill. End of week 5.
4. **M3 — Stripe paywall + confidence thresholds.** End of week 7.

## Risks

- **Agency UI churn** — every stock agency redesigns its upload UI; the extension must be tested against the top 4 agencies per release.
- **AI keyword hallucination** — the prompt must forbid invented brand names; a per-keyword confidence threshold is the safety net.
