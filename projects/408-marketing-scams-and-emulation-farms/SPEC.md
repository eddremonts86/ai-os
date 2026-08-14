---
id: "408"
slug: marketing-scams-and-emulation-farms
title: Marketing scams and emulation farms
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnjp5t/marketing_scams_and_emulation_farms/"
category: saas
date: "2026-08-13"
---
# Marketing scams and emulation farms

## Problem

The poster is asking every founder how to guarantee that a marketing agency they hire is actually doing the work and not scamming them by paying emulation farms — virtual machines that download the app to inflate install counts. The temptation is real: the agency charges $X/month and pays emulation farms $Y where Y = 0.2*X. The post is a question, not a complaint. No country, no agency name, no platform was stated.

## Objective

Give a SaaS founder who is hiring a marketing agency a verification framework that distinguishes real user acquisition from emulation-farm installs, with the named signals to check and the named checks that catch the named scam. The job is not to fire the agency — it is to give the founder a way to know before they pay another month.

## Target Users

Primary: a SaaS founder who has hired or is hiring a marketing agency and is worried they are paying for emulation-farm installs. Secondary: a chief of staff or VP marketing at the same kind of company who is being asked to audit the agency's work.

## MVP Scope

In scope for v1:

- A verifiable-metrics framework: the named signals that distinguish real users from emulation-farm installs (retention curve, session duration, in-app events, device fingerprint, network fingerprint, geographic distribution).
- A 'the agency is paying emulation farms' audit: a checklist the founder can run against the agency's reported numbers.
- A 'before you sign the next month's invoice' decision aid: the named thresholds for the named metrics.
- A one-page export the founder can drop into a Notion doc or a contract note.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnjp5t/marketing_scams_and_emulation_far` follows the constraints in `408-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a question, not a feature request — the deliverable is a verification framework, not a product.
- No country, no platform, no agency type was stated; the MVP must work for any SaaS founder hiring a marketing agency on a paid-install model.
- The output must not invent a verification vendor — name the categories (analytics, device fingerprint, attribution) and let the founder fill in the vendor.
