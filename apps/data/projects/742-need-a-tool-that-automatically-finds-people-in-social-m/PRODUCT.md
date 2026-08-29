---
id: "742"
slug: need-a-tool-that-automatically-finds-people-in-social-m
title: Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/6stv96yp21-need-a-tool-that-automatically-finds-peo"
category: social
date: "2026-04-28"
tags: [Social, Marketing, Business, Startups, AI, Productivity, Other]
country: USA
wtp:
  raw: $50/month
  currency: USD
  min: 50
  max: 50
  period: month
  mrrMid: 50
tech: [TypeScript, Node.js, BullMQ job queue, Postgres with Drizzle ORM, OpenAI or Anthropic API, Apify + Bright Data scraping, Coolify]
---
# Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A founder or community builder gets back the hour a day he currently spends scrolling feeds looking for builders sharing their work. The tool ingests public posts and profiles across LinkedIn, X, Facebook, and TikTok, scores each candidate against the user's deep criteria (cadence, topic focus, transparency, recency, bio signals), and returns a structured hit list — for $50/month, with no team workspace and no setup overhead.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Founder / indie investor | Wants to find builders publicly shipping, every day; manual feed-scrolling eats hours. |
| DevRel / community manager | Needs to scout ambassadors, podcast guests, beta users with a real "build in public" voice. |
| Recruiter (founder / maker archetype) | Wants a structured candidate list rather than keyword-bombing Apollo / LinkedIn Recruiter. |
| Journalist / trend researcher | Tracks who is shipping what across platforms; needs cadence + recency filters that keyword search misses. |

## Jobs To Be Done

1. **Functional job** — Find people who match a deep pattern (regular cadence + topic + transparency + recency) across LinkedIn, X, Facebook, TikTok in one query, and get a CSV to act on.
2. **Emotional job** — Stop feeling like scouting the social-sphere is a willpower contest; stop paying for keyword-only tools that return 1,000 leads and 0 useful matches.
3. **Social job** — Be able to say "I sourced these builders from a tool, not from my feed" — defensible when the list is questioned.

## Success Metrics

- **Activation:** ≥ 60% of new signups run their first deep-criteria search within 24 h and download a CSV result.
- **Match quality:** median user rates ≥ 30% of returned matches as "would actually contact" in the in-app feedback prompt after the first CSV download.
- **Time-saved:** logged-in active users spend ≤ 10 min/day inside the tool, vs. ≥ 60 min/day of manual scrolling (self-reported baseline survey).
- **Retention:** ≥ 50% of workspaces remain subscribed after 90 days; ≥ 30% after 180 days.
- **Throughput:** median deep-criteria search returns ≥ 50 candidates within 24 h of submission across LinkedIn + X; ≥ 20 across Facebook + TikTok.

## Pricing & Monetization

$50/month flat per workspace, matching the author's stated budget. Annual plan at $40/month locked. Free 7-day trial with 3 searches total (so the user can prove the criteria builder works before paying). No usage-based overage in v1 — overages would betray the flat-fee expectation. Optional "Pro" tier with cross-platform cadence deeper than 8 weeks and team workspaces deferred to v2.

## Competitive Landscape

- **Apollo / ZoomInfo / Lusha** — B2B lead-gen platforms; match on title / company / industry, not on social posting cadence or topic focus.
- **LinkedIn Recruiter / Sales Navigator** — keyword + boolean search over profiles; do not analyze public posting cadence or topic voice.
- **Phantombuster / Apify standalone** — scraping primitives; require the user to build the criteria + matching logic themselves.
- **SparkToro / Audiense** — audience research tools; focus on follower demographics, not individual candidate discovery.
- **Twitter / X Advanced Search** — free, but keyword-only, no cadence scoring, no cross-platform aggregation.
- **Manual scrolling + spreadsheets** — what the author does today; reliable, but does not scale past a few hours a day.

## Risks & Open Questions

- [ ] Confirm LinkedIn and X ToS permit the scraping pattern in v1; if either tightens mid-pilot, the affected platform is paused (with email notification) rather than risk legal exposure.
- [ ] Validate that LLM-assisted matching (scoring candidates against deep criteria) stays under $0.10/query at the OpenAI / Anthropic price points; if it slips, switch to a smaller local model and re-benchmark.
- [ ] Decide whether TikTok stays in v1 or is deferred to v2 — TikTok scraping is the most ToS-fragile of the four and may need its own partner / reseller relationship.
- [ ] Establish a per-platform daily quota that respects healthy rate limits while still returning ≥ 50 candidates per query within 24 h; quotas must be visible to the user so the $50/month expectation is not silently violated.
- [ ] Confirm that the in-app match-quality feedback (the "would actually contact" prompt) can be used to retrain the criteria templates without crossing into "personal-data training" territory for GDPR / CCPA.
