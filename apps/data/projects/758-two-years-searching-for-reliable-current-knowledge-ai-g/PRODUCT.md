---
id: "758"
slug: two-years-searching-for-reliable-current-knowledge-ai-g
title: "Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of links. Need a personalized guide to trusted information."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/35l4crn5d1-two-years-searching-for-reliable-current"
  captured: "2026-03-12"
category: education
date: "2026-03-12"
tags: [Education, Productivity, Other]
country: Russia
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL with pgvector, RSS + arXiv + Semantic Scholar connectors]
---
# Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of links. Need a personalized guide to trusted information.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A self-directed learner names a topic and a starting level, and the guide returns a sequenced path of trusted sources with inline citations and a short rationale for each. The registry updates weekly, so the path stays current as the field evolves. Compared with the alternative (search engines returning thousands of links, AI giving generic answers, ready-made courses that are too shallow or too advanced), the value is a structured, level-appropriate path with auditable quality signals.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Self-directed adult learner (Apollinaria's profile) | Wants to teach themselves across fields without committing to a multi-year degree program; needs a curated path that does the source-filtering for them. |
| Career switcher | Needs to ramp a new domain fast; the level-aware path beats the generic "start with Wikipedia" advice. |
| Curious professional in an adjacent field | Wants to keep up with a neighboring domain (marketer learning data science, designer learning ML) without enrolling in a 6-month bootcamp. |
| Tutor / mentor | Wants a structured baseline they can adapt per student, not start from scratch each time. |
| Independent researcher | Wants a faster way to triangulate a new field's canonical sources before doing the deep reading. |

## Jobs To Be Done

1. **Functional job — learner** — Get a level-appropriate path of trusted sources for a goal topic, fast.
2. **Functional job — learner** — Know why each source was recommended (the audit-trail promise in the post).
3. **Emotional job — learner** — Stop feeling that two years of self-study have produced more confusion than competence.
4. **Social job — learner** — Have something to point to when explaining what they are learning ("I am following this path"), instead of "I am reading whatever I find."
5. **Risk-management job — learner** — Be able to verify that a recommended source is genuinely authoritative, not a disguised advertisement.

## Success Metrics

- **Activation:** median time from signup to first generated path is under 3 minutes.
- **Path completion:** median user completes ≥ 60% of generated path steps in the first 30 days.
- **Source quality signal:** ≥ 80% of recommended sources on the first 5 paths a user generates are clicked-through, validating that the registry's ranking matches user interest.
- **Recency:** ≥ 90% of recommended sources have been re-verified by the registry in the last 60 days.
- **Return frequency:** ≥ 35% of week-1 users generate a second path within 30 days (a new goal, a new level, or a new field).
- **Multilingual coverage:** ≥ 50% of Russian-language users see at least one Russian-language source in their path (the post's author is Russian-speaking, this is a stated audience).
- **Source-distinguishing promise:** the product surfaces the source's credential category (academic, practitioner, editorial) on every citation, and ≥ 70% of users click through to inspect the rationale.

## Pricing & Monetization

The post does not name a price. A reasonable model: a free tier with one active path and the full source registry, a paid tier (€9–15/month) that unlocks unlimited paths, reading tracking, recency alerts when a path's sources go stale, and offline export. Annual at 20% off. The paid tier's headline value is the recency alerts and the unlimited paths; the free tier must be useful enough that the user can prove the model without a card.

## Competitive Landscape

- **Generic AI assistants (ChatGPT, Claude, Gemini)** — what Apollinaria tried and rejected for returning generic answers with no level calibration or verification.
- **Search engines (Google, Yandex)** — what she tried and rejected for drowning her in links with no quality signal.
- **Ready-made courses (Coursera, Udemy, Stepik)** — what she tried and rejected for being too superficial or too advanced.
- **Wikipedia + curated reading lists (r/askscience, Hacker News "best of", Substack newsletters)** — the closest thing to the product, but maintained by humans and decaying faster than anyone refreshes them.
- **NotebookLM, ChatGPT Team with attached files** — generic chat-with-files products that do not generate paths and do not maintain a quality-ranked source registry.
- **Refind, Pocket Premium, Readwise Reader** — read-later and highlight tools that solve a different job: managing sources you have already found, not guiding you to the right ones.

## Risks & Open Questions

- [ ] Whether the source registry can be built and maintained at sufficient breadth without an editorial team. The product's value depends on quality across many fields, and a self-bootstrapping registry may converge on the same handful of well-known sources for every field.
- [ ] Whether the level calibration (beginner / intermediate / advanced) can be inferred accurately from a single intake question, or whether the product needs an adaptive quiz to place the user. The post is explicit that level matters.
- [ ] Whether the post's author (Apollinaria) is reachable for design-partner feedback; the post exposes an email contact.
- [ ] Whether the recency monitor can keep up with fast-moving fields (LLM research, AI tooling) without false positives on slower-moving fields (philosophy, classical music theory). The cadence must be per-field.
- [ ] Whether Russian-language source coverage is sustainable at the same quality bar as English, given the post's audience. A registry that is excellent in English but thin in Russian will fail the multilingual promise.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/education/35l4crn5d1-two-years-searching-for-reliable-current) · **Category:** education · **Tags:** Education, Productivity
