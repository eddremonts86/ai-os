---
id: "710"
slug: thank-you-to-this-community-i-posted-here-about-needing
title: Thank you to this community. I posted here about needing one stranger to buy my app before my mom let me buy a domain.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpylen/thank_you_to_this_community_i_posted_here_about/"
category: saas
date: "2026-08-16"
---
# Thank you to this community. I posted here about needing one stranger to buy my app before my mom let me buy a domain.

## Tech Stack

Not stated in the source. The post is a launch / community-thanks update, not an engineering brief. Stack choice would be invented.

## Architecture

A small client-side keystroke recorder plus a server-side verification layer that:

- Records every keystroke with timing.
- Runs 25+ motor / rhythm / composition checks.
- Produces a replay link shareable with the teacher.
- Premium tier adds a PDF exhibit and a personal email to the teacher.

Storage of keystroke records is a sensitive surface — design choices around retention and deletion are flagged in `PRODUCT.md` Risks & Open Questions, not invented here.

## Milestones

1. M0 — Confirm the post's product frame: keystroke recording, 25+ checks, replay link, premium PDF/email proof.
2. M1 — Capture marketing-channel advice from the Reddit thread (YouTube vs. other) as the poster's own open question.
3. M2 — Treat "two strangers have bought it" as the only confirmed traction signal; do not promote to a growth metric.
4. M3 — Keep receiptsproof.com as the only confirmed external surface.

## Risks

- Privacy risk: a keystroke record contains everything the student typed during the verified window. Retention, encryption, and deletion paths are not stated in the source.
- Verification-claim risk: the 25+ checks are asserted by the poster but not published; do not defend them as a benchmark.
- Age risk: the founder is 14; legal / payment / data-handling requirements are not addressed in the source.
- Marketing-channel risk: the poster calls marketing "a pain" — do not invent a channel that fits an imagined funnel.
