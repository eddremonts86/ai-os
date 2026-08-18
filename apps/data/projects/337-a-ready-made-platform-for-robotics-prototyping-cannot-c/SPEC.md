---
id: "337"
slug: a-ready-made-platform-for-robotics-prototyping-cannot-c
title: A ready-made platform for robotics prototyping cannot create an active user community
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/4jgemm3td1-a-ready-made-platform-for-robotics-proto"
category: marketing
date: "2025-10-29"
tags: [Marketing, Other]
country: Israel
tech: [Next.js, Discord API + custom bot, Postgres, Loom embed SDK, Substack (or self-hosted RSS)]
---
# A ready-made platform for robotics prototyping cannot create an active user community

## Problem

An Israeli robotics-platform vendor has the hardware kits and the developer SDK but their GitHub Discussions and Discord have become read-only graveyards. Buying a board does not lead to shipping a project; shipping a project does not lead to publishing the result; and the result rarely loops back into the platform's documentation. The poster - and their peers in robotics-adjacent Israeli startups - want a community layer that produces user-shipped projects, not just user-asked questions.

## Objective

Ship a community-management playbook and lightweight tooling for a robotics-platform vendor in Israel that converts shipped projects into documented posts, and posts into the next builder's first project, within 60 days.

## Target Users

- Hardware-platform vendors in Israel with a developer base of 1k-10k who want shipped projects, not just questions.
- Independent roboticists in Israeli universities (Technion, Tel Aviv, Ben-Gurion) who need a place to publish.
- Developer-relations leads hired at Series-B Israeli robotics startups who want a 90-day community plan, not a Slack invite.

## MVP Scope

- Project submission portal: short form (title, 3-sentence summary, Loom or YouTube link, bill of materials, GitHub).
- Featured project queue: weekly selection by an internal editor; featured gets a home-page slot and a $500 kit-credit to the builder.
- Discord bot: 'ship-it' command in #showcase posts the submission link and tags the authors.
- Documentation pipeline: approved projects auto-generate a docs PR in the platform docs repo with a 4-6 sentence write-up.
- 'Stuck Friday' thread: weekly AMA with the platform's lead engineer; top three questions answered in the docs.
- Measurement: shipped projects / month, featured project reach, docs-page traffic from project pages.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/4jgemm3td1-a-ready-made-platform-for-roboti` follows the constraints in `337-.../SPEC.md` and the chosen stack (Next.js, Discord API + custom bot, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Israel.

For Israel, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- $500 kit-credit per featured project is the per-project cap; total monthly credits budgeted at $5k.
- Submission form is bilingual-friendly (English default, Hebrew optional); no Arabic UI in v1.
- No paid placement of submissions in the featured queue - internal editor only.
