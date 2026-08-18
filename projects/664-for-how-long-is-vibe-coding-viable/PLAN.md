---
id: "664"
slug: for-how-long-is-vibe-coding-viable
title: For how long is vibe coding viable?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvr2y/for_how_long_is_vibe_coding_viable/"
category: saas
date: "2026-08-16"
tags: [AI Coding, Sustainability, Audit]
---
# For how long is vibe coding viable?

## Tech Stack

- **Frontend:** SvelteKit with form actions. The questionnaire is one long form; the verdict page renders based on the form's answers.
- **Storage:** SQLite for answers, Postgres only if accounts are added. Anonymous cookie-keyed answers for the MVP.
- **Scoring:** A small declarative rubric file in TypeScript that maps each answer to a number. The rubric is published in the audit's footer so the founder can audit the audit.
- **Email (optional):** Resend or Postmark for the 30-day "did this age well" reminder, opt-in only.
- **Hosting:** Vercel or Cloudflare Pages. Serverless functions handle the form submission and the optional email reminder.
- **Analytics:** Plausible, self-hosted. Track completion rate, verdict distribution, and next-action rate, no user-identifying events.

## Architecture

```
+------------------+       +-----------------+       +-------------------+
| SvelteKit        |       | Form action     |       | SQLite answers    |
| questionnaire    || computes score  || store             |
| (12-15 questions)|       | + verdict       |       | (cookie-keyed)    |
+------------------+       +-----------------+       +-------------------+
                                   |                          |
                                   v                          v
                          +----------------+         +-----------------+
                          | Verdict page   |         | Markdown export |
                          | (state + next  |         | (client-side)   |
                          | actions)       |         |                 |
                          +----------------+         +-----------------+
```

The MVP architecture is one SvelteKit app, a small declarative rubric, and an SQLite store. There is no LLM in the loop. The verdict logic is reproducible and inspectable.

## Milestones

1. **M0 — Questionnaire** — 12-15 questions, navigation, save-state so the founder can resume.
2. **M1 — Scoring rubric** — Declarative TypeScript file mapping each answer to a number, and each number range to one of three states.
3. **M2 — Verdict page** — Renders the state, the rationale, and three concrete next actions.
4. **M3 — Export** — Markdown export of the audit's answers, verdict, and next actions.
5. **M4 — Optional email** — 30-day "did this age well" reminder, opt-in, easy to turn off.

## Risks

- **Rubric calibration.** Mitigation: track the verdict distribution and the 30-day "aged well" rate. If 95% land in "still viable" or only 50% age well, the rubric is miscalibrated and needs to be tuned.
- **Verdict feels like a verdict.** Mitigation: every exhausted/graduating verdict is paired with the most likely cause and a recovery action. The audit names the cause, not just the state.
- **LLM-coach temptation.** Mitigation: v1 has no LLM. The rubric is a small TypeScript file the founder can read. If a v2 adds an LLM-coach, it sits behind a "draft only" gate.
- **Sensitive founder moment.** The MVP is a tool, not therapy. Mitigation: at the bottom of every exhausted verdict, link to two or three founder mental-health resources. Not preachy, just present.
- **Vendor capture.** Mitigation: no AI-coding tool vendor sponsors the rubric, no affiliate links, no paid placements. The audit is independent of the tools it judges.
