---
id: "308"
slug: problem-of-promoting-on-reddit-for-beginners
title: Problem of promoting on Reddit for beginners
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/uya9j4sm41-problem-of-promoting-on-reddit-for-begi"
category: marketing
date: "2025-11-12"
tags: [Marketing, Other]
country: UK
tech: [Next.js, TypeScript, Postgres, Anthropic Claude API, PRAW (Reddit API), Resend, Vercel]
---
# Problem of promoting on Reddit for beginners

## Tech Stack

- **Web app:** Next.js 14 (App Router), TypeScript, deployed on Vercel.
- **Database:** Postgres (Neon) for users, Reddit account linkages, plan progress, comment-coach drafts.
- **Reddit source:** PRAW (Python) micro-service that pulls account karma, subreddit history, and post rules; exposed to the Next.js app via an internal API.
- **LLM:** Anthropic Claude for the comment coach and the subreddit fit scoring, with a strict prompt that refuses deception.
- **Notifications:** Resend for plan reminders and weekly digests.

## Architecture

A Next.js app serves the user console (authed RSC) and the comment coach UI. The PRAW service handles all Reddit reads (account, history, subreddit rules) and writes a normalised snapshot to Postgres. The plan engine uses the snapshot to compute the readiness score and the daily plan; the comment coach calls Claude with a strict prompt and the user's draft plus the subreddit's rules.

```
Browser ─▶ Next.js console ─┐
                            ├─▶ Postgres (users, plans, drafts)
PRAW service ─▶ snapshot ───┘
                            │
                            └─▶ Comment coach ─▶ Anthropic Claude
                                                  (strict prompt, no deception)
```

## Milestones

1. **M0 — Spec freeze + Reddit OAuth.** User links a Reddit account; we read karma and last-30-days history. End of week 1.
2. **M1 — Readiness score + 30-day plan.** Score, plan, daily check-in UI. End of week 3.
3. **M2 — Subreddit picker + rules surfacing.** Given a product description, return a shortlist with each subreddit's rules summarised. End of week 5.
4. **M3 — Comment coach.** Paste a draft, get flagged spans + rewrite suggestion. End of week 7.
5. **M4 — 100-user private beta.** End of week 10.

## Risks

- **Reddit API terms** — the official API disallows using the data for spam tooling; mitigation is a strict "we do not coach spam" policy and a refusal to launch features that automate removal-evading behaviour.
- **Comment-coach prompt injection** — a user can paste content that tries to make the coach produce harmful rewrites; mitigation is a thin classifier in front of Claude that refuses to coach anything the platform itself would remove.
- **Readiness-score calibration** — too lenient and the plan is just a marketing helper; too strict and users churn before they see value. Mitigation is a calibration round with 10 experienced Redditors before the public launch.
