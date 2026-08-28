---
id: "532"
slug: i-will-not-promote-your-saas-works-but-does-it-actually
title: (I will not promote) Your SaaS works. But does it actually look good enough to make people trust it?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vo4n8q/i_will_not_promote_your_saas_works_but_does_it/"
category: startups
date: "2026-08-14"
---
# (I will not promote) Your SaaS works. But does it actually look good enough to make people trust it?

## Tech Stack

- **Frontend:** Astro on Vercel (landing + validation status page).
- **Backend:** Astro endpoint + Postgres for cohort signups.
- **Status page:** re-rendered from Postgres on each signup.

## Architecture

Single Astro app. Landing captures signups; status page reads the count from Postgres.

```
Browser ─▶ Astro (landing + status page)
              │
              └─▶ Postgres (cohort signups)
```

## Milestones

1. **M0 — Landing page live.** End of week 1.
2. **M1 — Cohort filled + calls done.** End of week 4.
3. **M2 — Public verdict published.** End of week 6.

## Risks

- **Cohort bias.** Filling from the source poster's network will skew the result. Mitigation: at least 4 of 10 must be cold-reach founders.
- **No-build outcome.** Validation may come back negative; that's a real result. Mitigation: a public negative-verdict post is itself a credibility play.
