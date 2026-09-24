# SPEC.md — ClientCoded – QA Platform for AI Agents

## Problem

Hi HN. We built a QA platform for AI agents.<p>My cofounder spent 6 years at Veeva Systems building QA frameworks for regulated software. I spent 5 years in sales helping AI-native startups with their growth. We&#x27;ve both seen the issues companies face when deploying agents without a structured way of testing and monitoring them. The engineering teams we interviewed prior to building said they are doing manual spot-checks or just using LLM as a judge to check discrepancies.<p>We generate synthetic test environments for 35 platforms (Salesforce, Jira, Stripe, Zendesk, Datadog, and 29 more). Each environment has ~200 adversarial queries with computed ground truth across 7 categories: clean lookups, ambiguous questions, multi-step operations, scope boundary tests, contradictory inputs, invalid assumptions, and context-dependent questions.<p>The ground truth is initially computed by running SQL against the synthetic dataset so it&#x27;s not just guessed by an LLM.<p>We also do adversarial testing for pre-production conversational agents. The system generates different personas that push agents off-script and scores pass&#x2F;fail across 10 dimensions so you can see what happens in realistic customer scenarios. Our production monitoring  is just one webhook with every conversation evaluated in real time as well.<p>We are two founders bootstrapping and we would love feedback on our approach!<p><a href="https:&#x2F;&#x2F;clientcoded.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;clientcoded.com&#x2F;</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49688290)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T20:22:29Z

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
