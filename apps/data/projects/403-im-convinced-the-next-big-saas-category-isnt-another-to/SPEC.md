---
id: "403"
slug: im-convinced-the-next-big-saas-category-isnt-another-to
title: I’m convinced the next big SaaS category isn’t another tool
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnmk32/im_convinced_the_next_big_saas_category_isnt/"
category: saas
date: "2026-08-13"
---
# I’m convinced the next big SaaS category isn’t another tool

## Problem

The poster's thesis is that the next big SaaS category is not another tool — it is something that tells a founder which tools and actions actually matter. Founders already have CRM, analytics, Notion, calendar, AI, project management, email, and 50 other tabs. The problem is that nobody is sitting above all of it saying: 'Given where your company is right now, these are the 3 things that matter.' The poster is building around that thesis and asking peers whether they are solving a real problem or inventing one. The post is a question, not a feature request.

## Objective

Give a SaaS founder who is drowning in tools a prioritisation surface that says, given where their company is right now, the 3 things that actually matter. The job is not to add to the tool pile — it is to sit above the pile and surface the next move.

## Target Users

Primary: a SaaS founder or CEO (pre-PMF to post-Series A) who has 5-10 tools in their stack and is spending more time triaging than deciding. Secondary: a chief of staff or chief operating officer at the same kind of company who is paid to make the founder's decision surface smaller.

## MVP Scope

In scope for v1:

- A 'given where you are, do these 3 things' surface, fed by the founder's current stage (pre-PMF, post-PMF, scaling, declining) and the top 3 tools they already use.
- A confidence label on every recommendation: explicit, heuristic, or experimental, because the post is a thesis, not a claim.
- A 'this is not the next tool' footer: the prioritisation surface is the alternative to adding another tool, not the next tool on the pile.
- A one-page export the founder can drop into a Notion doc or a Monday morning standup.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnmk32/im_convinced_the_next_big_saas_ca` follows the constraints in `403-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a thesis, not a feature request — the deliverable is a prioritisation surface, not a product.
- No country, no ARR, no team size was stated; the MVP must work for any SaaS founder who has 5+ tools in their stack.
- The output must not invent a confidence model — every recommendation has to label its own confidence.
