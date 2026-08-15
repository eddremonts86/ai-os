---
id: "614"
slug: i-built-a-simpler-alternative-to-an-ats-for-teams-that-
title: I built a simpler alternative to an ATS for teams that receive CVs by email
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0wp4/i_built_a_simpler_alternative_to_an_ats_for_teams/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, recruitment, cv-parsing, b2b, freemium]
scores:
  money: 6
  learn: 5
  fun: 5
tech: [Python, FastAPI, PostgreSQL, OpenAI API (CV extraction), IMAP/Graph email ingestion, Next.js]
---
# I built a simpler alternative to an ATS for teams that receive CVs by email

> Product brief — auto-generated then authored.

## Value Proposition

**One-liner:** Turn a recruitment mailbox into a searchable candidate library, without adopting a full ATS.

RecrutFlo connects to a recruitment mailbox and turns incoming CVs into structured candidate records (experience, skills, technologies, languages, role context) that the team can search and filter. The product is deliberately scoped below an ATS: no hiring pipelines, no candidate rankings, no automated hiring decisions. AI organises the information; recruiters stay in control. The free plan has no time limit and no payment details, so a team can keep using it inside the plan limits as long as it helps.

## Target Users

- Small companies whose hiring process runs out of a shared recruitment mailbox and whose recruiter (often a founder or office manager) currently copies CVs into a spreadsheet by hand.
- Small recruitment agencies whose value is the candidate library, not the pipeline.
- Teams that have looked at a full ATS and decided it is more than they need.

## Jobs To Be Done

1. Functional — stop doing the "open email, download CV, copy fields into a spreadsheet" loop on every incoming application, so the recruiter can answer "who do we already have for X?" without rereading every CV.
2. Functional — turn an inbox full of attachments into a list that can be searched and filtered by skill, technology, language or role context.
3. Emotional — let a small team look professional to candidates (faster response, no CV lost in an inbox) without buying into enterprise software.
4. Social — be the person who said "yes, we already have someone with that background" instead of "let me check the emails".

## Success Metrics

- Activation: a team connects a mailbox and receives at least one parsed candidate record within their first session.
- Retention: teams that continue receiving CVs through the connected mailbox after 30 / 60 / 90 days (the free plan has no time limit, so retention is the only signal that the product is earning its place).
- Quality: share of parsed candidate records the recruiter leaves unchanged or with only small edits (a proxy for extraction accuracy).
- Conversion: teams that move from the free plan to a paid tier — only when they have already proven the value to themselves.

## Pricing & Monetization

The source describes a freemium: a free plan with no time limit and no payment details required. Teams use the product inside the plan limits as long as they want and only upgrade when the product has proven useful. The source did not name a paid tier, a price, or a plan cap — only the free plan and the principle that upgrade is earned, not forced.

## Competitive Landscape

The product is positioned against a full ATS by being deliberately smaller. A full ATS gives a hiring team pipelines, candidate rankings, interview scheduling, scorecards and (often) automated decisions. RecrutFlo is the contrast: it does the part most teams actually do by hand — getting CVs out of an inbox and into a searchable list — and stops there. The poster's framing ("deliberately not a full ATS") is the positioning. The source did not name specific competitors, so this section stops there.

## Risks & Open Questions

- Risk: the freemium without a time limit means there is no forced conversion point — if free plan limits do not chafe, upgrades do not happen.
- Risk: CV parsing quality varies by language, layout and CV style; if recruiters have to heavily correct records, the "AI organises, you stay in control" promise reads as more work than the spreadsheet.
- Risk: holding mailbox credentials (IMAP / Microsoft Graph) is a sensitive trust boundary; any incident is a brand problem for a small product.
- Open question (the poster asks it directly): is "recruitment inbox → searchable CV library" a clear and useful proposition, or do the people with this problem already expect more from a recruitment tool?
- Open question: what plan limits actually drive upgrades — volume of CVs, number of seats, retention window, search depth — was not stated in the source.

---

_Source:_ [Reddit r/SaaS](https://www.reddit.com/r/SaaS/comments/1vp0wp4/i_built_a_simpler_alternative_to_an_ats_for_teams/) · **Posted:** 2026-08-15