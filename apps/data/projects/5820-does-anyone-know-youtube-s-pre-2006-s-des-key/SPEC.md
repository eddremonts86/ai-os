# SPEC.md — Does anyone know YouTube's pre-2006's des key?

## Problem

Hey so as me (representing a group of people researching old youtube) We have a lot of archives of old youtube which are hard to order and put together, videos like quick stoppie or dante comes home can not be put in a list of 621,355 videos coming from the youtube api. back then the key was just a mysql primary id encrypted with des. We have a list of 621,355 of post-2006 ids (still used today but we do not have the key, just called channelsections on user&#x2F;simmonsfam817). at some point in late february 2006, the key was changed and we can no longer do anything about it so we are asking where our sources come from (here). Hopefully this is the right place to ask in. -Kyer

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49616632)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-08T20:34:06Z

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
