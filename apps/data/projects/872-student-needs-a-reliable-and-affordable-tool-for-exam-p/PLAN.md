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

## Tech Stack

- **Frontend:** React + TypeScript PWA served by TanStack Start; installable on Android; offline-first service worker caches the last past-paper pack and the student's own syllabus.
- **Backend:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, hosted on a single Coolify instance behind Docker. CDN in front of static assets to keep first-paint cheap on 3G.
- **Retrieval:** an embeddings-based retrieval over the student's indexed syllabus / textbook / past papers, with the source document name + page number attached to every retrieved chunk.
- **LLM:** a hosted LLM API constrained to a structured-output schema that requires `{answer_text, citation: {source, page, confidence}}`; the runtime rejects any answer that lacks a citation.
- **Fallback path:** when retrieval returns no usable chunk, the API returns the explicit "I can't find a verified source for this" message and offers the human-tutor upgrade (₹199/month).
- **Auth + billing:** phone-number OTP via a low-cost SMS provider for the Indian market (the student does not always have email), Stripe + Razorpay for ₹ pricing, ad SDK integrated for the free tier.
- **Feedback loop:** per-answer "correct / partially correct / wrong" button feeds a `feedback` table that ranks retrieval chunks by historical accuracy.

## Architecture

```
Android PWA ─▶ TanStack Start (PWA shell + offline cache)
                      │
                      ├─▶ /api/upload-syllabus  ──▶ index chunks (embeddings + page metadata)
                      │                                    │
                      │                                    ▼
                      │                            SQLite (chunks table)
                      │
                      ├─▶ /api/ask  ──▶ retrieve top-k chunks by question
                      │                  │
                      │                  ▼
                      │           LLM (structured output: answer + citation + confidence)
                      │                  │
                      │                  └─▶ guard: reject any output without citation
                      │
                      ├─▶ /api/feedback (correct / partial / wrong)
                      │
                      ├─▶ /api/tutor (₹199/month upgrade to human tutor)
                      │
                      ├─▶ Ad SDK ──▶ 5-second pre-answer ad (free tier only)
                      │
                      └─▶ Razorpay / Stripe webhook ──▶ Workspace.subscriptionStatus
```

## Milestones

1. **M0 — Spec + curriculum seed freeze.** SPEC.md + DESIGN.md approved; seed curriculum list for the top 50 Indian boards / universities + JEE / NEET / CUET ingested. End of week 2.
2. **M1 — Retrieval + citation-first answer.** LLM call constrained to the structured-output schema; the no-citation rejection guard wired; the "I don't know" fallback path live. End of week 5.
3. **M2 — PWA + 3G performance.** Service worker, offline past-paper pack cache, first-answer latency ≤ 2s on median Indian mobile. End of week 7.
4. **M3 — Feedback loop.** Per-answer correct / partial / wrong button; ranking of retrieval chunks by historical accuracy. End of week 8.
5. **M4 — Monetisation.** Free ad tier, $1 / $5 monthly tiers (with INR pricing), per-pack micropayments (₹10/pack), tutor upgrade (₹199/month). End of week 10.
6. **M5 — Pilot.** 200 student beta; weekly audit of "no-citation" rejections to confirm the guard never regresses. End of week 14.

## Risks

- **Hallucination is the headline risk.** The verification-first design must never silently regress to a confident guess. Mitigation: hard rule enforced in the structured-output guard; a separate retrieval-failure alert wired to the team's on-call; weekly manual audit of 20 random answers.
- **Syllabus ingestion accuracy** — extracting structure from PDFs across hundreds of boards is the biggest coverage problem. Mitigation: a curated seed of the top 50 boards plus a community-upload workflow with light moderation.
- **Latency on 3G** — Indian mobile networks are intermittent. Mitigation: PWA with offline past-paper pack cache, server-stripped answer payloads for the slow path.
- **Ad balance** — ads fund the free tier, but too many ads push students to ChatGPT or to a paid tier they can't afford. Mitigation: cap at 1 ad per answer (not per page); measure "answer-then-bounce" rate.
- **Past-paper licensing** — many past papers are not formally open. Mitigation: free tier links to the source URL; downloadable packs require permission or a clearly-marked derivative-work notice.
- **Co-founder fit** — the author is looking for a technical co-founder. Mitigation: the build plan is sized for 2 people, but if no co-founder is found, the founder must recruit or bootstrap solo with an external developer.
- **Affordability ceiling** — the headline price band is $1–5/month, well below Western SaaS norms. Mitigation: the architecture is intentionally SQLite-on-Coolify to keep infra cost < $0.01 per active user per month.
