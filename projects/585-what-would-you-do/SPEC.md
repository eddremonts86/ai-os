---
id: "585"
slug: what-would-you-do
title: Anti-exploitation job board and ATS auto-fill browser extension
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vojiuh/what_would_you_do/"
  captured: "2026-08-14"
category: jobs
date: "2026-08-14"
tags: [jobs, ats, browser-extension, b2c, job-board, mission-driven]
scores:
  money: 3
  learn: 5
  fun: 4
---
# Anti-exploitation job board and ATS auto-fill browser extension

## Problem

The poster is a software designer and developer (since 2013, mostly in UX / product ownership) who is angry at how traditional job boards and ATS sites make money: the sponsored-listing model incentivises them to keep fake job postings live and to hide the fact that thousands of people have already applied to a single role. The poster began building their own alternative in February 2024 — a job board plus a browser extension for auto-filling applications directly into ATSs — and after 2.5 years considers it their "magnum opus". The functional advantages over LinkedIn / Indeed / Glassdoor that the source names are: spam-job-poster labelling, perma-hiding companies, and a longer list of features the source groups as "bunch more". The poster has no marketing budget, no sales pipeline, and has asked the r/SaaS community how to get traction with zero dollars.

## Objective

Build a job-search product for the job hunter, not the recruiter. The functional wins over LinkedIn / Indeed / Glassdoor are: spam-job-poster labelling, perma-hide companies, and ATS auto-fill through a browser extension. The author's stated goal is to compete with the established job boards — "I just want to destroy Linkedin/Indeed/Glassdoor" — and they are explicitly willing to make zero dollars doing it.

## Target Users

Job hunters who have been burned by sponsored-listing patterns: fake job postings, hidden application counts, and the throughput games that the source describes. The source does not name a country, an industry, or a seniority level, but the framing ("pathetically broke and need $") and the explicit anti-recruiter sentiment point to a candidate rather than a recruiter audience.

## MVP Scope

The two pieces the source explicitly names: a job board, and a browser extension that auto-fills applications directly into the ATS. The two named differentiators over incumbents: spam-job-poster labelling, and perma-hide companies. The source treats the build as already shipped in the headline ("I used it myself, because I'm pathetically broke and need $. It dominates."), so the MVP is the live product the author has plus a path to first users.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The author has zero marketing budget and explicitly says "I suck at marketing/sales". The mission-driven framing — "I just want to destroy Linkedin/Indeed/Glassdoor" — is incompatible with the conventional sponsored-listing model the author is criticising, which means the path to revenue is not obvious. The 2.5-year build is "the author's magnum opus" per the source, which raises the bar for any new feature ask. The author rules out the standard VC path: "No Angel/VC in their right mind would touch it."
