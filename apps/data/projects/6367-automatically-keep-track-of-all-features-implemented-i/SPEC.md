# SPEC.md — Automatically keep track of all features implemented in a project

## Problem

I built this because I wanted to automate my least favourite part of documentation writing - expressing at a high level what was implemented. There are a couple of situations where you could need that:
- to show to the client what changed since the last update
- to show to an executive, where the fucus went lately
- to explain to a new team member, what the project is about<p>Because the report (you can see how it looks here: <a href="https:&#x2F;&#x2F;github.com&#x2F;netizer&#x2F;feature-ledger&#x2F;blob&#x2F;main&#x2F;docs&#x2F;client&#x2F;feature-ledger-Feature-Ledger_2.pdf" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;netizer&#x2F;feature-ledger&#x2F;blob&#x2F;main&#x2F;docs&#x2F;cli...</a>) is automated, I also use it as a discovery tool in projects I just started working on.<p>The way it works:
- `ledger init` - creates a `.ledger` directory; descriptions of all new features will be stored there
- `ledger bootstrap` - prints out a prompt to be used in a coding agent; it will analyse a new codebase and create the JSON files describing all features
- `ledger audit` - when you usa a coding agent it will automatically keep the feature list up-to-date, audit is to discover features implemented without a coding agent
- `ledger release cut --name &quot;Release name&quot; --date 2026-09-11` - run it after you&#x27;ve just shown to the client what had changed and you want to start working on a new set of features; in the new ledger you will see new features in green, updated features with blue, and deleted ones in red
- `ledger build` - run it whenever you want to see the report of new features; there are 3 files generated based on JSON files describing features: a PDF for the client, FEATURES.md (the same but in an MD format), FEATURES_EXTENDED.md (the same but including implementation details - this is for the dev team)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49654287)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T06:33:11Z

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
