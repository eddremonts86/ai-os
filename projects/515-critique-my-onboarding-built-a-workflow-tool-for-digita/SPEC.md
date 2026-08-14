---
id: "515"
slug: critique-my-onboarding-built-a-workflow-tool-for-digita
title: Critique my onboarding? Built a workflow tool for digital marketing managers
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4lzy/critique_my_onboarding_built_a_workflow_tool_for/"
category: saas
date: "2026-08-14"
---
# Critique my onboarding? Built a workflow tool for digital marketing managers

## Problem

Hey everyone, I’m looking for a few US-based digital marketing managers to look at my current setup. I built a system designed to help managers map out their marketing strategies in about 10 minutes instead of spending days on manual planning. I just want to see if the user flow makes sense for a real marketing workload or if it's too confusing. If you have 5 minutes to look at it today, please let me know here or via DM. Appreciate any quick thoughts. submitted by /u/Suspicious_Syrup8694 [link] [comments]

---

## Objective

Replace days of manual marketing planning with a 10-minute workflow that produces a complete strategy map for a US-based digital marketing manager, and prove the onboarding flow is comprehensible enough that a domain practitioner can finish it without hand-holding.

## Target Users

- Primary: US-based digital marketing managers handling paid + organic + email channels for one or more brands.
- Secondary: marketing consultants who run planning workshops for clients and want a reusable framework.

## MVP Scope

- A single linear onboarding (under 10 minutes) that captures: brand, channels in play, audience, current KPIs, target KPIs, time horizon.
- Auto-generated strategy map output: channel mix, budget allocation, weekly cadence, KPIs to track.
- Export to PDF and Notion; no editing UI in v1.
- Feedback collection (a single thumbs-up/down + free-text field at the end of the onboarding).
- No login required for the first run — the founder wants to lower friction during validation.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- 10-minute target is non-negotiable; every step must justify its time cost.
- US-focused: dollar budgeting, US-relevant benchmarks, English copy.
- The operator is currently validating the flow, not building a SaaS; v1 is a static experience, not a multi-tenant platform.
