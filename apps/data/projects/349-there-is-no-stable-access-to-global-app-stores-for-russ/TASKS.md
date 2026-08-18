---
id: "349"
slug: there-is-no-stable-access-to-global-app-stores-for-russ
title: There is no stable access to global app stores for Russian developers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/jg3la3g2k1-there-is-no-stable-access-to-global-app"
category: legal
date: "2025-10-29"
tags: [Legal]
country: Russia
tech: [Next.js, Playwright / puppeteer (monitoring), Postgres, Telegram Bot API, Cloudflare Workers]
---
# There is no stable access to global app stores for Russian developers

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/legal/jg3la3g2k1-there-is-no-stable-access-to-global-app` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/349-there-is-no-stable-access-to-global-app-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Playwright / puppeteer (monitoring), Postgres, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Release artifact: signed AAB + APK, per-store metadata overrides
- [ ] Per-store publish adapter: Google Play, RuStore, Huawei AppGallery, Xiaomi GetApps
- [ ] Cloudflare / Russian CDN APK download page for fallback distribution
- [ ] Status board per store: review state, version, last published date
- [ ] Store-monitoring watchdog (weekly public-listing probe)
- [ ] CLI + Web UI for one-command multi-store release
- [ ] Pilot with 10 Russian indie mobile devs and 3 studios over 60 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Playwright / puppeteer (monitoring), Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 349-there-is-no-stable-access-to-global MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Playwright / puppeteer (monitoring), Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
