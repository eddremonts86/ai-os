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

> Product brief for ExifGarden, the EXIF-keyword automation tool scoped in the source post.

## Value Proposition

A microstock contributor can drop a batch of images, get AI-generated keyword suggestions, and write them to EXIF once — every agency the image is uploaded to then reads the tags automatically.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Microstock contributors | Upload hundreds of images a week; keyword coverage is the bottleneck. |
| Photographers | Want consistent, AI-assisted tagging without manual data entry. |
| Digital asset managers at small studios | Similar tag-volume problem at a smaller scale. |

## Jobs To Be Done

1. **Functional job** — Generate AI keywords for a batch of stock images.
2. **Functional job** — Write the keywords to EXIF without losing other metadata.
3. **Functional job** — Pre-fill the keyword field on a stock-agency upload page.

## Success Metrics

- **Activation:** first batch of images tagged within 7 days of install.
- **Retention:** at least 50 images tagged per active contributor per month.
- **Conversion:** ≥ 5% free-to-paid conversion within 90 days.

## Pricing & Monetization

Free tier: 50 images/month. Pro at $9/month: 1,000 images/month + bulk upload + per-keyword confidence thresholds.

## Competitive Landscape

- **Adobe Stock / Shutterstock built-in keyworders** — agency-specific, no cross-agency.
- **StockSubmitter / Photo Mechanic** — bulk uploaders but no AI keyword generation.
- **Manual tagging** — what most contributors do today; 10-30 minutes per image.

## Risks & Open Questions

- [ ] The AI must not invent copyrighted brand names in the tags; keyword hallucination is a regulatory risk.
- [ ] The Chrome extension's compatibility with each agency's upload UI is the integration surface; if an agency redesigns, the extension breaks.
