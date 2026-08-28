---
id: "521"
slug: any-way-to-speed-up-aws-build-times-without-increasing-
title: Any way to speed up AWS build times without increasing infrastructure costs?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3ket/any_way_to_speed_up_aws_build_times_without/"
category: saas
date: "2026-08-14"
---
# Any way to speed up AWS build times without increasing infrastructure costs?

## Problem

Hey guys, now we’re migrating a project to AWS, and our builds are taking around 20–25 minutes. On top of that, things keep randomly breaking/failing, so we often have to stop, fix something, and run the build again. This makes the whole process even more painful. From what we’ve seen, we could probably get the build time down to around 10–15 minutes by using a different approach, but that would also increase our AWS infrastructure costs by roughly 10–15%. Is there any way to optimize this further without increasing infrastructure costs? Maybe there are some AWS/build optimizations we’re missing that could both speed things up and make the builds more reliable? Would appreciate any advice. submitted by /u/Dull_Gift_8242 [link] [comments]

---

## Objective

Cut AWS CI/CD build times without raising the infrastructure bill, by identifying which build steps are worth caching, which can run in parallel safely, and which can be split into smaller jobs, then producing a per-repo action plan with measured before/after numbers.

## Target Users

- Primary: a small platform team (1-3 engineers) supporting 5-20 repos on AWS CodeBuild / GitHub Actions running on AWS.
- Secondary: a single backend engineer at a startup whose bill has crept up because they tried to fix build times by throwing more compute at it.

## MVP Scope

- A repo analyzer (reads CodeBuild / GitHub Actions config) that flags the top 3 build-time bottlenecks per repo.
- A runbook generator: cache-this, parallelize-this, split-this-job actions with example config snippets.
- Before/after measurement: the user runs one full build before and after each change and the tool logs the diff.
- No actual config editing in v1 — the tool produces snippets, the engineer pastes them.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must respect AWS service quotas; suggestions that violate them are surfaced as warnings, not silently applied.
- No live infra access in v1 — the user provides the YAML, the tool analyzes it.
- Free for solo engineers; paid for teams.
