---
id: "4174"
slug: scoring-4811-job-tasks-against-machine-capability-19702
title: "Scoring 4,811 job tasks against machine capability, 1970–2041"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510775"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Scoring 4,811 job tasks against machine capability, 1970–2041

## Problem

The Large Labor Model (largelabormodel.com) is a long-form site that scores 4,811 job tasks against machine capability from 1970 to a 2041 forecast. The landing page ("The Mirror") takes a job — Nurse is shown as the example — and breaks the work into sub-tasks (Provide health education, Develop treatment plans, Monitor medication use, etc.) with a percent score per task. The site formalises "Replaceability" as the product of technical capability, economic viability, and availability, and explicitly separates that from whether replacement actually happens. The post is the project itself: a public mirror that maps a job into its sub-tasks and a capability score per sub-task.


---

## Objective

Ship a public site where a visitor can pick a job, see its sub-tasks broken out, and read a per-task capability score across the 1970–2041 timeline.


## Target Users

Workers curious about how their own job scores against machine capability, policy researchers, journalists, and educators who want a public-facing breakdown of a job into replaceable sub-tasks.


## MVP Scope

- A job catalogue covering 4,811 tasks across the captured roles.
- A timeline view that scores each task from 1970 to a 2041 forecast.
- A "Mirror" experience where a visitor picks a job and sees the per-task breakdown.
- A methodology page explaining how "Replaceability" is computed (capability × viability × availability).
- A share link so a visitor can post a single job's mirror.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing beyond what the public site exposes; the model is presented as a public good.
- Capability scores are model outputs, not measurements; the methodology page has to be honest about that.
- 4,811 tasks is a lot of content; the site has to stay readable as the catalogue grows.
