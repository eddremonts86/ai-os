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

## Problem

The author (Anushila, India) is preparing for final exams and needs reliable, accurate answers to complex questions across the syllabus. Free AI assistants such as ChatGPT frequently contain errors and inaccuracies, which jeopardise academic performance, and the author cannot afford paid educational services on a student budget. Free educational platforms cover only parts of the required curriculum. The author uses ChatGPT daily to find explanations and answers but constantly runs into unreliable information. The author explicitly named a willingness to pay around $1–5/month for a tool that solves the reliability problem, and also accepted alternative monetisation models: watching ads, micropayments for individual features, or a symbolic monthly fee after they have confirmed the tool actually works. The author is also looking for a technical co-founder to build the solution.

## Objective

Ship a curriculum-aware, answer-verification-first exam-prep assistant for Indian university and competitive-exam students that, on every question, (1) returns an answer grounded in a verified source (syllabus PDF, textbook, official past paper, or a citation traceable to one), (2) flags answers the underlying model is unsure about rather than guessing, and (3) is operable on the price band the author named ($1–5/month or equivalent ad / micropayment monetisation).

## Target Users

- Primary: undergraduate and competitive-exam students in India who prepare daily for final exams and need accurate, syllabus-aligned explanations at a price they can afford on a student budget.
- Secondary: high-school students preparing for board exams (CBSE, ICSE, state boards) and entrance exams (JEE, NEET, CUET) where past-paper accuracy matters.
- Tertiary: working professionals in India preparing for certifications or graduate exams on a tight budget.

## MVP Scope

- Curriculum ingestion: the student uploads a syllabus PDF or selects a board / university / exam track (e.g. "Delhi University BSc Physics Semester 5"), and the assistant indexes the official materials.
- Question-answering endpoint with mandatory citation: every answer returns the answer text + the source (`syllabus.pdf p.42`, `textbook.pdf ch.3`, `past_paper_2024.pdf q.7`) + a confidence flag.
- "I don't know" mode: if no source covers the question, the assistant returns an explicit "I can't find a verified source for this" message rather than a guessed answer; the student can request a human tutor instead.
- Per-question feedback: the student marks each answer as correct / partially correct / wrong; the feedback loops back into the model's retrieval ranking and surfaces the worst-performing topics.
- Affordability tiers: a free tier supported by short pre-answer ad reads (5-second video or static), a $1/month tier with 100 verified answers / day, a $5/month tier with unlimited verified answers and downloadable past-paper packs, and a per-pack micropayment (₹10 / pack) for individual past-paper bundles.
- Mobile-first PWA: most Indian students access the web primarily on Android phones over intermittent connections, so the UI must be PWA-installable and work on 3G.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Hard price ceiling of $1–5/month for any subscription tier; the free ad-supported tier is the headline experience for students who cannot pay.
- Answer integrity is the headline promise: every answer must come with a traceable citation, and an explicit "I don't know" path must exist when no source covers the question. Hallucinated answers are the failure mode that destroys trust.
- Operable on a mid-range Android phone over 3G; the PWA must serve the first answer within 2 seconds on a typical Indian mobile connection.
- Curriculum coverage must include at least the boards / universities the author lists (final exams) plus at least one competitive exam track in v1; coverage beyond that is community-driven (students upload syllabi).
- The author is looking for a technical co-founder; the build plan must be fundable as a two-person team, not a venture-funded staff.
