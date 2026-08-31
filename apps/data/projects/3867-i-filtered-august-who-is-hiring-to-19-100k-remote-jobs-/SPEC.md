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

## Problem

This Show HN capture is a bare link to commitasync.com; the product claim is the submission title: "I filtered August Who is Hiring to 19 $100k+ remote jobs, salary listed". The project is a job listing built by filtering the August Hacker News Who is Hiring thread down to 19 remote positions paying at least $100k, with salaries shown. The pain it addresses: the monthly thread is large and many postings hide salary, so a pre-filtered, salary-transparent list saves candidates real time. Beyond the August edition and the 19-job count, the capture states nothing about how the list is maintained or what else the site offers.

## Objective

Turn the single filtered list into a repeatable job index: a site that filters each month's Who is Hiring thread into remote, salary-listed roles above a $100k threshold, starting with the August edition's 19 jobs.

## Target Users

- Remote job seekers who only consider roles paying $100k or more.
- Developers tired of skimming Who is Hiring threads without salary data.
- Job-board browsers who value salary transparency.

## MVP Scope

- The August edition: 19 remote $100k+ jobs with salaries listed.
- A filter pipeline: remote, salary present, threshold of $100k or more.
- A listing page: title, company, salary and source link per job.
- A repeatable monthly process for future editions.

## Constraints

- The capture is a bare link; the 19-job count and the $100k threshold are the title's claims, not independently verified numbers.
- Salary and remote claims come from the original thread postings.
- Scope is curation and filtering, not recruiting: no application handling.

## Design Direction

See `DESIGN.md` for this project's design tokens.
