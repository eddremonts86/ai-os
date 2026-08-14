---
id: "525"
slug: need-a-co-founder
title: Need a Co-founder
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo2h9r/need_a_cofounder/"
category: saas
date: "2026-08-14"
---
# Need a Co-founder

## Tech Stack

- **Frontend:** Astro on Vercel.
- **Intake logic:** vanilla JS in the browser.
- **Profile + script generation:** templates in the repo, parameterised by the intake answers.
- **Analytics:** Plausible.

## Architecture

A single static page. The intake runs in the browser; the output is rendered from templates. No backend.

```
Browser ─▶ Astro (static HTML + intake.js + templates)
              │
              └─▶ Plausible
```

## Milestones

1. **M0 — Intake + profile generator.** End of week 2.
2. **M1 — Channel shortlist + first-conversation script.** End of week 4.
3. **M2 — Copy-paste post templates per channel.** End of week 5.

## Risks

- **Channel drift.** IndieHackers, Reddit, LinkedIn all change; the shortlist will go stale. Mitigation: a "last reviewed" date per channel + quarterly audit.
- **Profile specificity.** A too-specific profile filters out everyone; a too-loose one attracts time-wasters. Mitigation: include "must-haves" vs. "nice-to-haves" explicitly.
