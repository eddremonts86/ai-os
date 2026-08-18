---
id: "544"
slug: paid-ads-got-us-14-inactive-users-posting-organically-g
title: Paid ads got us 14 inactive users. Posting organically got us 800. Here’s what changed
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9mo7/paid_ads_got_us_14_inactive_users_posting/"
category: saas
date: "2026-08-14"
tags: [saas, growth, reddit, indie]
tech: [Next.js, TypeScript, Reddit API, Anthropic Claude, Supabase, Stripe]
---
# Paid ads got us 14 inactive users, posting organically got us 100

## Problem

A founder and their best friend built a project over a school year, burned out, quit, came back a year later, and tried again. With 0 users and no plan, they built a minimum viable product and bought ads on Reddit and YouTube. Spent hundreds, got 14 users to verify their email, none active. They cancelled the ad campaigns and started posting organically on Reddit (and YouTube / Instagram here and there). They looked at where other people posted to see what was allowed, kept editing, kept posting. It was free, and in a week they got 100 users. One post happened to blow up, but only because of all the ones that didn't — that helped build the confidence to keep going and to hone a message. A few people made purchases, and the founder explicitly says "while that seemed lucky it was a result of everything that happened before." They have a lot to figure out but are committed to keep going. The implicit product: a founder-led playbook for "from 0 to first 100 users via organic Reddit posting" — a tool that operationalises the lesson ("one post only blows up because of all the ones that didn't").

## Objective

Define the scope of an organic-reddit-launch playbook for indie SaaS founders: a structured workflow that captures what this founder learned (write 20+ posts, find where each subreddit allows promotion, edit to fit the room, treat the cumulative posting as the moat, ignore the per-post virality), packaged as a tool that helps a founder decide what to write, where, and when.

## Target Users

- **Primary:** indie SaaS founders in the first 6 months who have a working product but no users and no marketing budget.
- **Secondary:** solo developers who shipped a side project and want to find their first 100 users without paying for ads.
- **Tertiary:** small marketing teams at bootstrapped SaaS companies that want a structured Reddit-launch workflow.

## MVP Scope

- A subreddit-finder: for a given product, list the relevant subreddits with their self-promotion rules (parsed from the subreddit sidebar + recent mod posts).
- A post-drafter: per subreddit, draft a post that fits the room (tone, length, format).
- A posting cadence tracker: target 3-5 posts per week across 4-6 subreddits; track per-post engagement.
- A weekly review: which posts got traction, which subreddits gave the most engaged users, what to write next.
- Excluded in v1: AI auto-posting (against most subreddit rules), cross-platform (X, HN, IndieHackers), engagement metrics, paid placements.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single launch-workflow surface — the subreddit list on the left, the post drafter on the right, the cadence tracker at the bottom. No marketing-site chrome; the product is the cadence.

## Constraints

- The tool must never auto-post on behalf of the founder; auto-posting violates the rules of every relevant subreddit.
- The subreddit rules must be sourced from each subreddit's sidebar and pinned mod posts; the tool must surface the rule the founder is fitting the post to.
- The MVP must work for a solo founder with zero analytics tooling.
