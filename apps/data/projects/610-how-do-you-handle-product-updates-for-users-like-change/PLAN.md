---
id: "610"
slug: how-do-you-handle-product-updates-for-users-like-change
title: How do you handle product updates for users? Like changelog and stuff?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp1yfn/how_do_you_handle_product_updates_for_users_like/"
category: saas
date: "2026-08-15"
tags: [saas, developer-tools, feedback, changelog]
tech: [Next.js, TypeScript, Vanilla JS, Supabase, Stripe]
---
# How do you handle product updates for users, like changelog?

## Tech Stack

- **Widget:** a vanilla JS bundle (< 20KB) that mounts a bell icon in any host app.
- **Founder dashboard:** Next.js + TypeScript + Tailwind CSS.
- **Storage:** Supabase (auth, per-product changelog, feedback submissions, "you are affected" rules).
- **"You are affected" matching:** a JSON-defined rule per known issue, matched against a per-user environment snapshot.
- **Payments:** Stripe.

## Architecture

Widget (in the host app) + founder dashboard. The widget fetches the changelog and the "you are affected" rules at page load; the founder's dashboard writes to the same Supabase backend.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a widget + dashboard demo. End of week 1.
2. **M1 — Widget + dashboard + changelog composer.** End of week 4.
3. **M2 — Feedback widget + inbox.** End of week 6.
4. **M3 — "You are affected" rule engine.** End of week 8.
5. **M4 — Stripe paywall.** End of week 10.

## Risks

- **Widget bundle size** — < 20KB; bloat is the failure mode.
- **Cross-app dashboard** — one account, many apps; the dashboard must support multi-tenant cleanly.
