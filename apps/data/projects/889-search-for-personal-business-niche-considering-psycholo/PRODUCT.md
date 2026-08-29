---
id: "889"
slug: search-for-personal-business-niche-considering-psycholo
title: Search for personal business niche considering psychological barriers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-niche-consi"
  captured: "2025-10-22"
category: psychology
date: "2025-10-22"
tags: [Psychology]
country: Russia
tech: [Next.js, TypeScript, Node.js API, PostgreSQL, a small LLM for barrier-categorisation (OpenAI-compatible endpoint), a private journaling store, optional VPN-friendly deployment on Coolify]
---
# Search for personal business niche considering psychological barriers

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A would-be solopreneur works through a structured self-reflection on the psychological barriers that shape which business niches they will actually commit to — visibility, selling, conflict, repetition, money conversations — and receives a shortlist of niches scored on both market fit and personal sustainability, with the reasoning behind each score visible so the result is a starting point for their own judgement rather than a black-box recommendation. The source post is unusually thin (title + category only); the value proposition is grounded in what the title and category imply, not in fabricated market or user data.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Aspiring first-time solopreneur in a Russian-speaking market | Has done surface research (SEO tools, Reddit threads, YouTube gurus) but cannot tell whether the resistance they feel toward a niche is the market or their own fear. |
| Career changer in their 30s–40s | More life experience to draw on but tighter financial runway; the psychology of the search matters more than for a 22-year-old. |
| Business coach / psychologist | Wants a structured intake clients can complete between sessions so live time is more productive. |

## Jobs To Be Done

1. **Functional job** — Get a shortlist of business niches that scores both market fit and personal sustainability, with reasoning visible.
2. **Emotional job** — Tell the difference between "this niche is wrong for me" and "this niche scares me and that's why I keep coming back to it."
3. **Social job** — Take a printable, defensible artefact to a coach or mentor instead of another vague "I think I want to do SaaS" conversation.

## Success Metrics

- **Completion:** ≥ 60% of users who start the interview finish it (the interview is the value, not the marketing page).
- **Action-ability:** ≥ 40% of users who finish the interview download the PDF export within 7 days.
- **Reported clarity:** Self-reported "I have a clearer next step than before" rating ≥ 4 / 5 in the post-interview survey, sampled across ≥ 100 users.
- **Retention:** ≥ 25% of completed users return within 30 days to re-run the interview after a meaningful life change; the metric is re-use, not session time.

## Pricing & Monetization

The source post does not state a price; price modestly to keep the audience reachable for first-time solopreneurs. $9 one-time for the full interview + shortlist + PDF export, with a free preview (first three barrier categories + one niche recommendation) so the user sees the shape of the tool before paying. Annual "rerun" subscription at $19/year for users who want to revisit the interview quarterly is a Phase 2 lever, not a v1 decision.

## Competitive Landscape

- **Standard "find your niche" market-research tools** (Google Trends, Exploding Topics, Niche Pursuits) — answer the market-fit half of the question; do not surface the user's psychological barriers at all, which is the part the title of the source post explicitly names.
- **Ikigai / Blue Ocean / Design Your Life workbooks** — qualitative frameworks with no software; the product is the workbook as a structured interview, which these leave to the user to do themselves.
- **AI "business idea generators"** — produce dozens of niche ideas in a single prompt; do not personalise against the user's stated barriers, which is the differentiator this product is betting on.
- **1:1 business coaching** — what the user typically ends up paying for when the self-research stalls; the product is a cheaper self-serve intake that makes the live coaching time more productive, not a replacement.

## Risks & Open Questions

- [ ] Decide whether the barrier-categorisation is a 9-category fixed set or a free-form journal that an LLM categorises later; the LLM path is more flexible but introduces privacy and reproducibility concerns that the fixed-set path sidesteps.
- [ ] Validate that the niche-template library can be authored and reviewed responsibly without manufacturing market-size claims the source did not make; the templates are the load-bearing content and the wrong framing can mislead vulnerable users.
- [ ] Confirm the Russian-language copy can be written by a native speaker before launch; auto-translated copy in the psychology vertical is a brand-destroying risk and the Russian-speaking audience is the primary user.
- [ ] Settle the "is this therapy?" boundary in copy and in onboarding. The tool is structured self-reflection, not diagnosis; the language has to enforce that line on every screen, not just in a disclaimer at the bottom of the page.
