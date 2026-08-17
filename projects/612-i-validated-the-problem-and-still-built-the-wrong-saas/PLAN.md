---
tags: ["saas", "validation", "indie", "methodology"]
tech: ["Next.js", "TypeScript", "Supabase", "libsodium", "Stripe"]
id: "612"
slug: i-validated-the-problem-and-still-built-the-wrong-saas
title: I validated the problem... and still built the wrong SaaS
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp1lpo/i_validated_the_problem_and_still_built_the_wrong/"
category: saas
date: "2026-08-15"
---
# I validated the problem and still built the wrong SaaS

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Storage:** Supabase (auth, per-founder verdicts, the signed verdict log).
- **Verdict engine:** a TypeScript rules engine that takes the 5 answers and produces a build / pivot / kill verdict.
- **Signed log export:** a per-engagement signature (libsodium) so the verdict log is tamper-evident.
- **Payments:** Stripe.

## Architecture

Single web app. The verdict engine runs in the browser; the signed log is stored in Supabase.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the 5 questions + the verdict engine demo. End of week 1.
2. **M1 — Verdict engine + signed log export.** End of week 3.
3. **M2 — Structured weekly review (Pro tier).** End of week 5.
4. **M3 — Stripe paywall.** End of week 7.

## Risks

- **Question specificity** — the 5 questions must be specific enough to surface the validation-to-wedge gap; vague questions produce vague verdicts.
- **Verdict engine transparency** — the founder must see which question drove the verdict.
