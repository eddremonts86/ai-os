---
id: "642"
slug: "352-signups-22-used-the-feature-id-spent-months-buildin"
title: "352 signups, 22 used the feature I'd spent months building. So I cut the feature, not the product"
status: draft
source:
  name: manual
category: other
---
## Objective

A backlink exchange for SEO where members pick each other's sites, agree on terms in a thread, and the platform verifies the link stays live after placement. The poster originally built the same idea as a fully automated pipeline (write article → place backlinks → publish via webhook to the member's CMS) and killed it after learning that 22/352 signups ever connected a CMS — every real request was a way to do the work themselves, not have it done.

## Target Users

SEO-driven site owners who will trade a backlink on their own page for one on someone else's. The original automation-pitch audience did not connect a CMS, but they asked for a way to pick pages, write the post themselves, and talk to the other site directly — implying a real audience for a manual matching + verification flow.

## MVP Scope

- Browse other members' sites with filters (topic, DR, audience geography).
- "I want a link from this site" → opens a thread with the site owner.
- Terms agreement inside the thread (anchor text, target URL, placement page).
- Backlink verification: the platform periodically checks the agreed link is still live on the agreed page.
- Trust score per member (successful past exchanges, verification streak).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The founder already concluded that asking for CMS write access from a stranger is a non-starter; the platform must not require it.
- Verification must actually run, not be self-reported — that is the product's only moat over a manual spreadsheet.
- Trust signals are first-class: the founder's prior automation shipped despite a working article pipeline because nobody wanted it.
