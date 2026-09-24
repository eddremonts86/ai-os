# SPEC.md — MergeMe – 1 Slack card per PR/MR. Supports GitHub/GitLab(+ self hosted)

## Problem

Hi HN!<p>I built MergeMe because I worked in quite a few teams where it would take too long to pick up &amp; review PRs&#x2F;MRs, people would Slack each other stuff like &quot;hey can you review this&quot; or &quot;i responded to your comments, can you review again&quot; and none of it flows well.<p>What MergeMe does instead:<p>- It posts 1 updating Slack card per PR&#x2F;MR<p>- Posts GitHub &#x2F; GitLab comments into the Slack thread<p>- @maruan in GitHub maps properly to @Maruan in Slack so mentions work correctly<p>- Set up which repos&#x2F;projects go to which Slack channels, filter by labels etc<p>- Shows the CI status of the PR&#x2F;MR right in Slack<p>- Preferences to ignore bots, posts on draft or not &amp; more<p>- [New] Set up reminders to be posted on a daily schedule for stale PR&#x2F;MRs<p>If your team struggles with the noisy native integrations OR if you&#x27;ve noticed that it takes too long to get your work reviewed then MergeMe could be a great addition to your workflow.<p>You can use the SaaS version or self host it on your own infra for teams who want SSO, data residency and just peace of mind that their data is on their servers.<p>Check it out on <a href="https:&#x2F;&#x2F;mergeme.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;mergeme.dev&#x2F;</a> ! I&#x27;m open to all feedback :)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49712898)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T14:17:13Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
