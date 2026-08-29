---
id: "872"
slug: student-needs-a-reliable-and-affordable-tool-for-exam-p
title: Student needs a reliable and affordable tool for exam preparation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-affordable"
category: education
date: "2025-10-28"
tags: [Education, AI, Other]
country: India
wtp:
  raw: "$1-5/month after confirming effectiveness, plus ads or micropayments"
  currency: USD
  min: 1
  max: 5
  period: month
  mrrMid: 3
  note: "Author explicitly named a $1–5/month band, with ads and per-feature micropayments as acceptable alternative monetisation models."
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Student needs a reliable and affordable tool for exam preparation

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A curriculum-aware exam-prep assistant that returns answers grounded in the student's own syllabus PDF, textbook, or past paper, with the source attached and a confidence flag — never a confident guess. Every answer carries a citation traceable to a real page in a real document, and when the model can't find a verified source it says so explicitly. Affordable by design: $1–5/month or supported by short pre-answer ad reads for students who can't pay at all.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Undergraduate / competitive-exam student (India) | Needs accurate, syllabus-aligned answers daily and cannot afford ChatGPT Plus or paid edtech. |
| High-school board-exam student (CBSE / ICSE / state boards, JEE / NEET / CUET) | Wants past-paper-grade accuracy without paying for a coaching subscription. |
| Working professional on a tight budget | Needs a reliable answer source for certifications or graduate exams at student-tier pricing. |
| Author (Anushila) | Specifically looking for a co-founder to build the solution with. |

## Jobs To Be Done

1. **Functional job** — Ask a complex question from the syllabus, get a verified answer with the source page in seconds, even on a $100 Android phone over 3G.
2. **Emotional job** — Stop the daily anxiety of "is this ChatGPT answer even right?" by replacing it with "here is the page it came from".
3. **Social job** — Be able to share a verified answer with a study group without worrying it is wrong.

## Success Metrics

- **Activation:** ≥ 60% of new signups upload a syllabus or pick a board / university track within their first session (proxy for "the student sees the value of curriculum grounding").
- **Citation coverage:** ≥ 95% of answered questions return at least one traceable citation; ≤ 5% fall through to the explicit "I can't find a verified source" path (which is itself a feature, not a failure).
- **Answer quality:** ≥ 80% of answers are marked "correct" or "partially correct" by the student within 30 days of activation.
- **Affordability reach:** ≥ 70% of monthly active users are on the free ad-supported tier (proxy for "this is serving students who could not pay"); the remaining 30% convert to $1–5/month or per-pack micropayments.
- **Latency:** first answer rendered in ≤ 2 seconds on a median Indian mobile connection (3G / weak 4G).

## Pricing & Monetization

The author explicitly named $1–5/month with ads and per-feature micropayments as acceptable alternative models. All three are first-class:

- **Free tier (ad-supported)** — 20 verified answers / day; a 5-second static or short video ad reads before each answer; the headline experience for students who cannot pay.
- **$1/month tier** — 100 verified answers / day, no ads, downloadable past-paper pack of the month.
- **$5/month tier** — unlimited verified answers, no ads, all past-paper packs, priority retrieval on slow connections.
- **Per-pack micropayment** — ₹10 (about $0.12) per past-paper pack (e.g. "JEE 2024 mock set"), ₹20 per subject textbook pack; usable from the free tier without a subscription.
- **Tutor upgrade** — ₹199/month connects the student to a vetted human tutor when no verified source covers the question; paid out of the platform fee.

## Competitive Landscape

- **ChatGPT free / Plus** — general-purpose LLM; no curriculum grounding, frequent hallucinations on syllabi, no citations.
- **Google Search + past-paper sites** — accurate but unstructured; the student must read, compare, and synthesise themselves.
- **Indian edtech (Byju's, Unacademy, Vedantu, Toppr)** — full-stack coaching; subscription prices start at ₹500/month, well above the $1–5 student band.
- **Free educational platforms (NCERT, SWAYAM, DIKSHA)** — authoritative source material but no interactive Q&A; complementary, not competitive.
- **Perplexity AI** — citation-first design but no curriculum ingestion and no price band that fits the Indian student budget.
- **Chegg / Course Hero** — pay-per-answer, $20+/month; out of reach for the Indian student.

## Risks & Open Questions

- [ ] Syllabus ingestion accuracy — extracting the right structure from PDFs across hundreds of Indian boards and universities is the biggest coverage problem. Mitigation: a curated seed of the top 50 boards / universities plus a community-upload workflow with light moderation.
- [ ] Hallucination is the headline risk. The verification-first design must not silently regress to a confident guess when retrieval returns nothing. Mitigation: hard rule — if no citation is found, return the "I can't find a verified source" message; a separate retrieval-failure alert is wired to the team's on-call.
- [ ] Latency on 3G — Indian mobile networks are intermittent. Mitigation: PWA with offline past-paper packs cached locally, server-stripped answers for the slow path.
- [ ] Monetisation balance — ads fund the free tier, but too many ads drive students to ChatGPT or to a paid tier they can't afford. Mitigation: cap at 1 ad per answer (not per page); measure "answer-then-bounce" rate and dial down if it spikes.
- [ ] Co-founder fit — the author is explicitly looking for a technical co-founder. The build plan is sized for a 2-person team, but if no co-founder is found, the founder must either recruit or bootstrap solo with an external dev.
- [ ] Past-paper licensing — many past papers are not formally open; the free tier can link to the source URL, but bundling them as downloadable packs requires permission or a transformation that adds clear derivative-work notice.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-affordable) · **Category:** education · **Tags:** Education,AI,Other
