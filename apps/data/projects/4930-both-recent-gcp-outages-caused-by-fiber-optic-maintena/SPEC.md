# SPEC.md — Both recent GCP outages caused by fiber optic maintenance

## Problem

Both of GCP&#x27;s recent outages were caused by &quot;fiber optic maintenance&quot;. On August 20th when us-west1 went down they said [1]:<p>&gt; The disruption originated during scheduled fiber optic maintenance, which unexpectedly compromised network capacity between data centers within the us-west1 region.<p>Then on September 1st when us-central1-b (and collateral affects in other zones) went down they said [2]:<p>&gt; The immediate technical trigger for this event was the inadvertent physical disconnection of network fiber-optic cables during a routine hardware maintenance procedure.<p>Not sure if they&#x27;re related but apparently procedures we&#x27;re significantly changed after the first incident to prevent the second incident.<p>[1] https:&#x2F;&#x2F;status.cloud.google.com&#x2F;incidents&#x2F;utF3FMFdQfwBzJcGG6vf
[2] https:&#x2F;&#x2F;status.cloud.google.com&#x2F;incidents&#x2F;J5ia5t9p3g9Q5Wi7r8Ev

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49557563)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T21:46:27Z

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
