---
id: "400"
slug: we-sent-1000-loom-videos
title: We sent 1000 loom videos
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnn9g5/we_sent_1000_loom_videos/"
category: saas
date: "2026-08-13"
---
# We sent 1000 loom videos

## Problem

The poster runs an outbound motion and was unsure whether personalised Loom videos would actually work. They sent 1000 over 3 months using a $99-$120/week VA who handled research, prospect list, and queue. Numbers: 7% reply rate (70 replies), 36 calls booked. Their cold email reply rate was 4-5% before. The first 3 seconds of every video showed the prospect's website or Twitter; videos were 60-90 seconds. The follow-up was the big miss: they only followed up on 30% of non-replies, and a meaningful number of extra calls would have come from a real follow-up sequence. The poster is unsure whether the approach holds at higher volume or when more people copy it.

## Objective

Give a B2B SaaS founder or sales lead who is considering a personalised-video outbound motion a realistic model of what the first 1000 videos look like — the named numbers, the named failure modes, and the named follow-up gap. The job is not to send the videos — it is to let the founder decide whether the motion is worth the VA cost and the research tax before they commit.

## Target Users

Primary: a B2B SaaS founder or first sales hire who is considering a personalised-video outbound motion and wants a real range, not a marketing claim. Secondary: a sales lead at the same kind of company who has been asked to add a video channel and is sizing the cost and the realistic reply rate.

## MVP Scope

In scope for v1:

- A first-1000-videos calculator: VA cost, prospect count, reply rate, calls booked, with the named ranges from the post (7% reply, 4-5% email baseline, 60-90 second videos, 3-second opening hook).
- A follow-up sequence template: the missing 70% of non-replies the poster named, with a concrete cadence.
- A volume-at-scale risk section: what the post explicitly said it didn't know about 3000 videos in the same window.
- A one-page export the founder can drop into a Notion doc or a Slack thread.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnn9g5/we_sent_1000_loom_videos/` follows the constraints in `400-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a practitioner write-up with named numbers — the MVP must surface every number and label any extrapolation as extrapolation.
- The post is about one founder's outbound motion. The MVP must respect that scope and refuse to extrapolate to enterprise ABM or PLG.
- No country, no industry, no ticket size was stated; the MVP must work for any B2B SaaS with a sales team of 1-5.
