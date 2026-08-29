---
id: "746"
slug: coming-soon-validated-problems-for-startups-with-a-high
title: "Coming soon: validated problems for startups with a high chance of success. Our mission: 0% failed startups."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/validated/yfo00hoie1-coming-soon-validated-problems-for-start"
category: validated
date: "2026-04-23"
tags: [Validated]
---
# Coming soon: validated problems for startups with a high chance of success

## Problem

Most startups die because they build something nobody needs. The conventional cure — "find a real problem before you build" — works in theory but in practice founders default to ideas they already have, and the open pools of "problems" that do exist (forums, app store reviews, support tickets) are either too shallow (a one-line complaint) or too noisy to drive a thesis. The ProblemHunt team (Boris and Victoria) announced on 2026-04-23 a new publication format, "Validated Problems", in which a problem is only published after the editors have spoken in person with at least 20 real people who experience it and uncovered the details a founder needs to scope a startup that is highly likely to be in demand. Their stated mission: 0% failed startups. The bottleneck this product must remove is the editorial + research pipeline that turns raw "people complain about X" submissions into a per-problem dossier a solo founder or small team can actually use to start building: the people interviewed, the verbatim quotes, the failed workarounds, the willingness-to-pay signals, the competitive landscape, and the gaps in existing solutions.

## Objective

Ship a recurring publication that, per validated problem, delivers (1) a one-paragraph headline, (2) the target-user profile, (3) at least 20 anonymised first-person interviews with verbatim quotes, (4) the workaround map (what people do today), (5) a willingness-to-pay summary drawn from those interviews, (6) a competitive landscape and adjacent solution scan, (7) a "what's missing" gap that a new startup could close. The MVP must sustain at least one new validated problem per week with a team of two editors, and serve the publication behind a free email signup with an optional paid tier for deeper dossiers.

## Target Users

- Primary: solo founders and small teams in the "looking for an idea" phase who want a defensible thesis before they spend 6 months building, and who will pay for a curated, research-backed shortlist instead of doom-scrolling Reddit.
- Secondary: indie hackers and corporate innovators running internal "venture studios" who want a steady stream of pre-validated opportunities they can pick from.
- Tertiary: investors and accelerators scouting for new thesis areas; they want the underlying research to spot emerging demand patterns before the founder community notices.

## MVP Scope

- A public landing page that explains what a "Validated Problem" is and captures email subscriptions for the weekly newsletter.
- An editorial back-office: a problem pipeline (`intake → research → interview → draft → publish`), interview-tracking sheet, draft editor with required sections, and a publish / schedule workflow.
- A research template per problem that enforces the seven required sections (headline, target user, interviews, workarounds, willingness-to-pay, competitive landscape, gap).
- An interview capture form that records verbatim quotes, anonymised demographics, and the question that elicited each quote; ≥ 20 entries per problem before the "publish" button unlocks.
- A public per-problem page (markdown-rendered) plus a weekly email digest linking to the latest one.
- A free tier (last 3 problems, headline + target user + gap) and a paid tier (full dossier + interview transcripts) gated behind Stripe.
- A Telegram community link and weekly newsletter opt-in (the existing ProblemHunt surface) for distribution.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The "20 real people interviewed in person" bar is non-negotiable; if the editors cannot reach the threshold for a candidate problem, the problem is shelved, not relaxed. The back-office must surface this as a hard gate before publish.
- Anonymity by default: interview transcripts published to paid tier must strip PII (name, employer, city-level resolution); the editorial schema enforces a redaction step.
- Pricing must not gate the headline + gap section that helps a founder decide whether to dig deeper; that stays free.
- A two-editor team is the operational ceiling; the back-office UI must collapse the per-problem workflow into ≤ 5 hours of editor time per problem so one per week is achievable.
- Distribution is constrained to the existing ProblemHunt newsletter, Telegram community, and an opt-in weekly digest; no paid acquisition in v1.
