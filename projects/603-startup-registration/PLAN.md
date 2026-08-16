---
tags: ["saas", "legal", "compliance", "b2b"]
tech: ["Next.js", "TypeScript", "Supabase", "Stripe"]
id: "603"
slug: startup-registration
title: Startup registration
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vow1pl/startup_registration/"
category: saas
date: "2026-08-15"
---
# Startup registration (EU citizen, multiple ideas, subscription-based services)

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Decision-tree engine:** a JSON-defined tree with country + legal-form + tax + payment-rail branches.
- **Template storage:** Supabase + a signed-download URL per template (the templates are the product).
- **Payments:** Stripe.

## Architecture

Single web app + a per-founder decision tree (saved locally). The Pro tier adds a manual review by the founder (or a partner network) on top.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the decision tree for 3 countries (NL, IE, EE). End of week 1.
2. **M1 — Decision tree + template downloads.** End of week 4.
3. **M2 — Partner directory (incorporation agents, accountants, payment-rail partners).** End of week 6.
4. **M3 — Pro tier + 1:1 review intake.** End of week 8.

## Risks

- **Regulatory change** — EU regulations change; the templates must be reviewed quarterly.
- **"Not legal advice" boundary** — the product must stay on the guide side; a disclaimer on every page is mandatory.
