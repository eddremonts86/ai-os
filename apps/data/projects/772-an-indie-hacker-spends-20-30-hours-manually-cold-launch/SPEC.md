---
id: "772"
slug: an-indie-hacker-spends-20-30-hours-manually-cold-launch
title: "An indie hacker spends 20-30 hours manually «cold launching» each new product in directories, Reddit, and blogs. There is no tool that fully automates this and proves its effectiveness."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/1trzcj1cz1-an-indie-hacker-spends-20-30-hours-manua"
category: ai
date: "2026-01-29"
tags: [AI, Media, Marketing, Startups, Other]
country: UK
tech: [TypeScript, Bun, Postgres, Drizzle ORM, Playwright (browser automation), Reddit OAuth, Resend]
---
# An indie hacker spends 20-30 hours manually «cold launching» each new product in directories, Reddit, and blogs. There is no tool that fully automates this and proves its effectiveness.

## Problem

An indie hacker spends 20-30 hours manually 'cold-launching' each new product in directories, Reddit, and blogs, and there is no tool that fully automates this and proves its effectiveness. The ProblemHunt capture is the title plus the country UK and the tags AI, Media, Marketing, Startups, Other; nothing further — so the actor is an indie hacker, the manual work is 20-30 hours per launch (the only quantitative claim, kept as the poster wrote it), the surfaces named are directories, Reddit, and blogs, and the missing piece is a tool that fully automates it and proves the result.

The implied problem has two halves. The first is execution: 20-30 hours of repetitive work per launch that the indie hacker has to perform by hand, including submission form filling for each directory, post drafting per subreddit, and personal outreach to blogs. The second is verification: existing automation tools can submit everywhere but cannot prove that the submissions produced traffic, signups, or revenue. The post's 'proves its effectiveness' is the explicit demand that the tool connects the launch activity to the post-launch outcome, not just executes the launch.

Beyond the title the source names no specific directory, no subreddit, no blog list, no product type, and no current signups or revenue baseline. The plan reasons from the actor (UK indie hacker), the time-cost (20-30 hours per launch), the surfaces (directories, Reddit, blogs), and the proof demand (the tool proves what it did), without inventing a specific product, a directory list, or a launch outcome figure.

## Objective

Ship a launch automation tool that takes an indie hacker's product brief, submits the product to a curated set of directories and Reddit communities, drafts and queues personalised outreach to a list of blogs, and tracks each launch activity to its post-launch outcome (clicks, signups, paying customers) so the indie hacker can see which activities actually produced results. The 20-30 manual hours collapse to a brief in and a launch out, and every launch leaves the hacker with a verified map of what worked.

## Target Users

- A UK indie hacker with a new product to launch and a recurring 20-30 hours per launch of manual directory submissions, Reddit posts, and blog outreach.
- A solo founder launching the second or third product and who already knows the manual path is the bottleneck.
- A indie hacker with a small list of trusted blogs who has reached the personalisation ceiling for outreach and needs an automation that still feels personal.
- A founder who has tried a generic submission tool and found it did not prove which of the submitted directories actually converted.
- A indie hacker whose pipeline of multiple launches per year depends on the launch time-per-product being less than a working week.

## MVP Scope

- A product brief ingest that accepts the product name, one-paragraph description, target audience, and a link the indie hacker wants shared.
- A curated launch surface list maintained by the platform (product directories, subreddit candidates, blog outreach candidates) where each surface has a metadata record of what kind of submission it accepts.
- A directory submission path that fills each directory's submission form via browser automation, using the brief as the source of facts, and saves a copy of each submission for the record.
- A Reddit path that posts to a short list of relevant subreddits, with per-subreddit rules respected and a manual review gate before posting.
- A blog outreach path that drafts a short personalised email per blog, using the blog's recent content as a hint source, and queues the drafts for the indie hacker's one-click send.
- A tracking layer that issues each launch activity a unique tracking URL, so clicks, signups, and paying customers can be attributed back to the specific directory, post, or blog.
- A post-launch view that aggregates, by activity, the number of clicks, signups, and conversions attributable to that activity over a configurable post-launch window.
- A launch history per product that the indie hacker can revisit, since the indie hacker's next launch benefits from knowing what worked on the previous one.
- A opt-out signal per Reddit community and per directory, since rules change and the platform has to defer rather than work around a community's published policy.
- A export of every launch activity's submission as a JSON archive, so the indie hacker owns the record.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country UK and five tags; nothing beyond that is invented here, including product type, directory list, subreddit list, or any current signups or revenue.
- Reddit's anti-spam rules and per-subreddit posting rules are not negotiable; the tool cannot post on the indie hacker's behalf in a community that has banned the activity, because the post's 'proves its effectiveness' depends on every launch activity being one the surface actually accepts.
- Directory submission forms vary widely and may require CAPTCHA; the tool must respect CAPTCHA challenges rather than attempt to bypass them, because a banned submission across many directories is worse than no submission.
- Blog outreach that is not personalised is unfit for the title's claim; the per-blog draft has to be visibly tailored to the blog, even if the personalisation is short.
- Tracking URLs have to be honest about what they track, and the platform has to disclose the tracking to the indie hacker; opaque tracking that drives signup behaviour is unfit for a tool that 'proves effectiveness'.
- The indie hacker has to be the human in the loop for every Reddit post and every blog outreach; the tool drafts and queues, the hacker approves and sends.
- A launch archive is the indie hacker's record; the platform's retention has to support exporting it without a paid tier.
