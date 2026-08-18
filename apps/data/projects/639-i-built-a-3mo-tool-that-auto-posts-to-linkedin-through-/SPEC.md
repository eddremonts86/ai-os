---
id: "639"
slug: i-built-a-3mo-tool-that-auto-posts-to-linkedin-through-
title: I built a $3/mo tool that auto-posts to LinkedIn through their official API
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp7kaq/i_built_a_3mo_tool_that_autoposts_to_linkedin/"
category: saas
date: "2026-08-15"
wtp: "$3/mo basic, $6/mo higher tier"
---
# I built a $3/mo tool that auto-posts to LinkedIn through their official API

## Problem
 Been running a small automation studio (AASeada) and kept getting asked for a safe way to stay consistent on LinkedIn without risking a ban. So I built ReacherAgent.com, it schedules and publishes your LinkedIn posts through LinkedIn's own official API. No browser bots, no fake login sessions, nothing that violates their ToS. $3/mo for the basic plan, $6/mo for more posts/scheduling. Would love feedback from anyone posting regularly on LinkedIn â€” what would make this a no-brainer for you? submitted by /u/Aboodseada1999 [link] [comments]

---

## Objective

Ship a LinkedIn auto-poster that uses the official LinkedIn API (no browser bots, no fake login sessions, nothing that violates ToS) so users can stay consistent on LinkedIn without risking an account ban. The founder is seeking feedback from regular LinkedIn posters on what would make the tool a no-brainer.

## Target Users

LinkedIn posters — individuals or small teams who publish regularly and need scheduled publishing without the risk of a banned account. The poster mentions running an automation studio (AASeada) and being asked repeatedly for a safe alternative to browser-automation tooling.

## MVP Scope

- OAuth-based LinkedIn sign-in via the official API.
- Post composer with schedule (date/time).
- Publishing through LinkedIn's official endpoint, not via browser automation.
- Two paid tiers: $3/mo basic, $6/mo with more posts/scheduling capacity.
- Dashboard showing scheduled, posted, and failed posts.
- ToS guardrails surfaced to the user (rate-limit warnings before publishing).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must not violate LinkedIn ToS: no browser bots, no fake sessions, no credential scraping.
- Pricing floor is $3/mo, so hosting cost per active user must stay well under that.
- Founder explicitly asks for what would make the tool a "no-brainer" — implies a UX gap to be filled before scale.
