---
id: "3867"
slug: i-filtered-august-who-is-hiring-to-19-100k-remote-jobs-
title: "I filtered August Who is Hiring to 19 $100k+ remote jobs, salary listed"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499922"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Job listing index, Salary extraction, Remote filter rules, HN Who is Hiring pipeline, Static listing site, Search and filter UI]
---
# I filtered August Who is Hiring to 19 $100k+ remote jobs, salary listed

## Tech Stack

Chosen for a monthly filter-and-publish pipeline; the capture names no tooling.

- **Thread extraction:** pull Who is Hiring postings from the HN API or a scraper.
- **Filter rules:** remote keywords, salary present, $100k+ floor.
- **Static listing site:** the filtered jobs as simple pages.
- **Monthly pipeline:** a rerun path for each new thread.
- **Source links:** every listing points at the original thread comment.

## Architecture

- **Ingest:** fetch the month's Who is Hiring thread.
- **Classify:** remote flag, salary extraction, threshold check.
- **Curate:** a human pass over machine candidates produces the published list.
- **Publish:** a static page per monthly edition.

## Milestones

1. **M0 — Reproduce August.** Ingest the August thread and reproduce the 19-job list.
2. **M1 — Pipeline.** Remote, salary and threshold rules are documented and automated.
3. **M2 — Site.** Listing pages with per-job details and source links.
4. **M3 — Repeat.** The next monthly thread is processed; time-to-publish is measured.

## Risks

- **Salary parsing is fragile:** ranges, equity and locale notation break naive extraction.
- **Thin months:** the narrow target may yield few roles in some editions.
- **Curation scale:** one-person review does not scale; full automation risks quality.
