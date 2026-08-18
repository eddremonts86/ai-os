---
id: "2910"
slug: i-gave-my-job-search-data-an-mcp-interface
title: Ackd — AI Job Search Workspace with MCP integration
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49334815"
  captured: "2026-08-17"
category: productivity
date: "2026-08-17"
tags: [Show HN, Product, Problem, Productivity, AI]
country: USA
tech: [SvelteKit, Postgres, MCP, OpenAI, Anthropic Claude]
---
# Ackd — AI Job Search Workspace with MCP integration

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A tech applicant can paste any job link and get a structured application record with attached resume versions, follow-up reminders, and outcome analytics by source — and connect the same data to Claude, Cursor, or any MCP-compatible AI tool so it works from the applicant's real pipeline instead of generic job-search advice.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Tech applicant at volume | Loses track of which resume went where; AI advice without context is generic; spreadsheets do not auto-track follow-ups. |
| Career coach / outplacement firm | Needs a structured pipeline per candidate without rebuilding a Notion schema each time. |
| AI tool user (Claude, Cursor) | Wants the AI to ground advice in the user's actual application data, not in a fresh empty prompt. |

## Jobs To Be Done

1. **Functional job** — Keep every application, resume, follow-up, and outcome tied to one record so nothing gets lost when applying at volume.
2. **Emotional job** — Stop second-guessing whether a follow-up is overdue and stop feeling like the AI is giving the same advice to everyone.
3. **Social job** — Show up to interviews prepared with a clean record of every touchpoint with the company.

## Success Metrics

- **Activation:** user pastes their first job link and gets a structured record within 60 seconds of signup.
- **Engagement:** ≥ 60% of beta users return at least 3× in week 1; median user tracks ≥ 5 active applications.
- **MCP adoption:** ≥ 20% of beta users connect at least one MCP client (Claude, Cursor, or other) within 30 days.
- **AI feature use:** bounded by a monthly quota per user during beta so abuse does not blow the bill.
- **Outcome signal:** week-over-week growth in callback/reply rate per resume version (founder's stated promise; no number asserted).

## Pricing & Monetization

The product page states "Free during beta · No credit card required" and the structured JSON-LD offer lists price `0 USD`. The Show HN post does not state what happens after beta, so a paid tier is not asserted; founder has not publicly disclosed WTP.

## Competitive Landscape

- **Spreadsheets / Notion templates** — flexible but require manual schema; no follow-up nudges; no AI tooling.
- **Generic job boards (LinkedIn, Indeed, Greenhouse public boards)** — track applications from the recruiter side; do not give the applicant a private structured pipeline with attached resume versions and outcomes.
- **Specialised trackers (Huntr, Teal)** — closer category overlap; Ackd's stated wedge is the MCP integration that lets the user's AI tools read and write the same data the user sees.
- **Notion + AI plugin** — possible substitute; requires the user to design the schema and wire the AI client themselves.

## Risks & Open Questions

- [ ] Confirm whether paste-link ingestion handles the long tail of custom career pages (not just the named ATS boards).
- [ ] Validate that AI features can be billed per-quota in beta without breaking the "free" promise.
- [ ] Decide post-beta pricing without inventing WTP; the founder's post does not name a number.
- [ ] MCP server must keep its schema stable so existing Claude/Cursor setups do not break on release.
- [ ] LinkedIn Easy Apply and Indeed are explicitly out of scope for paste-link — manual entry is the fallback until scope changes.

---

_Source:_ [Show HN: I gave my job search data an MCP interface](https://news.ycombinator.com/item?id=49334815) · **Category:** productivity · **Tags:** Show HN, Product, Problem, Productivity, AI
