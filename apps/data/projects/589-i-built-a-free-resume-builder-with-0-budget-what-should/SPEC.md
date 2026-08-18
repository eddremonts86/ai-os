---
tags: ["saas", "consumer", "free", "career"]
tech: ["Next.js", "TypeScript", "jsPDF", "Supabase"]
id: "589"
slug: i-built-a-free-resume-builder-with-0-budget-what-should
title: I built a free Resume Builder with $0 budget. What should I do next?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voij6e/i_built_a_free_resume_builder_with_0_budget_what/"
category: saas
date: "2026-08-14"
---
# I built a free resume builder with $0 budget, what should I do next

## Problem

A founder spent a long time thinking about building a SaaS — ideas, monetisation, features, architecture — but kept thinking instead of building. They decided to stop looking for the perfect idea and just build something: a very simple and probably very crowded resume builder. They built it, deployed it, made it completely free, and are not trying to monetise it. The goal was to get real experience with what happens after launch. They have almost no marketing budget and have not had anyone actually use the product. They are asking what to do next: find first users with $0 budget, get useful feedback instead of 10-second website visits, whether to keep improving the product or move on. The implicit product: a free resume builder with $0 marketing, looking for the playbook to get to first users.

## Objective

Define the MVP scope for the resume builder and the $0-budget launch playbook. The MVP is the existing product; the work is the launch.

## Target Users

- **Primary:** recent graduates and first-job seekers who need a resume and do not want to pay for a resume builder.
- **Secondary:** career switchers who want a clean resume without learning LaTeX.
- **Tertiary:** university career centres that want a free tool for their students.

## MVP Scope

- Resume builder web app: structured fields (experience, education, skills), live preview, PDF export.
- 3-5 templates; one is enough to start.
- Free forever; no paid tier in v1.
- Excluded in v1: AI suggestions, ATS scoring, multi-language, cover letter builder.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single resume-builder surface — the structured fields on the left, the live preview on the right, the PDF export button at the top. No marketing-site chrome; the product is the resume.

## Constraints

- $0 marketing budget; every acquisition channel must be free.
- The product must be useful without an account; an account is for saving multiple resumes, not for using the builder.
- The PDF export must work in the browser (no server round-trip).
