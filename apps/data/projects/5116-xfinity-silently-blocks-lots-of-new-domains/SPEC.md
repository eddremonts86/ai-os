# SPEC.md — Xfinity silently blocks lots of new domains

## Problem

We built a site for a launch and it was unreachable for anyone on an Xfinity router. We only found out because we have an Xfinity router at home. There&#x27;s no notice to the site owner.<p>Xfinity&#x27;s Advanced Security draws on third-party domain reputation lists and blocks at the gateway. We found out a blacklist called SURBL had flagged us. Not sure exactly what tripped it. Since then I&#x27;ve hit the same block on 10+ unrelated sites and told the site owner. Now sharing with everyone here.<p>How to check whether it&#x27;s happening to you:<p>https:&#x2F;&#x2F;spa.xfinity.com&#x2F;check_url_status
If blocked, look for the upstream list: https:&#x2F;&#x2F;mxtoolbox.com&#x2F;blacklists.aspx
Report at https:&#x2F;&#x2F;spa.xfinity.com&#x2F;report and call them nonstop (reviews take ~3 business days) and get off the upstream list too.<p>Trying to help get this out there so it happens to less people who are launching products.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49568385)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-04T18:31:48Z

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
