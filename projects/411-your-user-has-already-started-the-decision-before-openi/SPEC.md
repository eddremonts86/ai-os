---
id: "411"
slug: your-user-has-already-started-the-decision-before-openi
title: Your User Has Already Started the Decision Before Opening Your Product
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnj84g/your_user_has_already_started_the_decision_before/"
category: saas
date: "2026-08-13"
---
# Your User Has Already Started the Decision Before Opening Your Product

## Problem

The poster argues that Airbnb does not help you find a place to stay — it helps you complete a decision you already started making before you opened the app. A traveler rarely starts with 'I want to use Airbnb.' They start with a premise: 'I need a good place to stay.' Then the questions begin: is the location good, does the place look like the photos, can I trust the host, is it worth the price, what if something goes wrong. Before the user enters the product, they already have a mental structure: Premise -> Questions -> Evidence -> Conclusion. The poster is suggesting this is where behavioral science becomes important. The post is a thesis, not a feature request. No country, no product, no metrics were stated.

## Objective

Give a SaaS founder who is designing onboarding a Premise-Questions-Evidence-Conclusion framework that names the mental structure the user already has before they open the product. The job is not to add a step to onboarding — it is to redesign onboarding around the structure the user already brought.

## Target Users

Primary: a SaaS founder or product designer who is redesigning onboarding and wants the named mental structure the user already has, not a generic 'reduce friction' post. Secondary: a growth or retention lead at the same kind of company who is being asked to improve activation and wants the framework to brief the team.

## MVP Scope

In scope for v1:

- A Premise-Questions-Evidence-Conclusion framework, with the named questions per category (location, trust, price, failure mode) for the B2C SaaS founder.
- An onboarding audit: where the founder's current onboarding misses the user's mental structure, and where it accidentally matches it.
- A 'before you ship the next onboarding change' checklist: the named precondition.
- A one-page export the founder can drop into a Notion doc or a team thread.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnj84g/your_user_has_already_started_the` follows the constraints in `411-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a thesis, not a feature request — the deliverable is a framework, not a product.
- No country, no product, no metrics were stated; the MVP must work for any B2C SaaS founder who is designing onboarding for a moment the user already has a mental structure for.
- The output must not invent a behavioral science model — name the categories from the post and let the founder fill in the specifics.
