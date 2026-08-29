---
id: "3631"
slug: a-retirement-planner-in-one-html-file-works-offline-not
title: "A retirement planner in one HTML file, works offline, nothing uploaded"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481776"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Single HTML file, Vanilla JavaScript, CSS (no framework), LocalStorage (optional, same file)]
---
# A retirement planner in one HTML file, works offline, nothing uploaded

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3631-a-retirement-planner-in-one-html-file-works-offline-not/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the single HTML file with inline CSS and JS, the holdings table, and the gross-proceeds calculation
- [ ] Add the per-holding account-type tagging (brokerage, pre-tax, Roth) that the tax pass will respect
- [ ] Implement proportional basis recovery on partial sale, with a test for the rule
- [ ] Apply the user-set capital-gains rate per account type, treating the source's 33.1% as an example
- [ ] Build the multi-year sell schedule engine, with the 2026–2031 example shape from the source page as the reference
- [ ] Add the per-holding two-stage growth model and the price-target mode that derives a rate
- [ ] Persist the scenario in localStorage with a single key, plus a JSON export and import path
- [ ] Implement the crash test that re-runs the unwind against a user-picked stress scenario
- [ ] Implement Monte Carlo with an inline seeded PRNG, with a configurable trial count
- [ ] Add CI that loads the file and asserts zero network requests after the initial load
- [ ] Verify the file loads correctly via `file://` with no broken paths and no missing assets
- [ ] Write the operator-facing copy that explains the file-ownership and offline-promise terms

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
