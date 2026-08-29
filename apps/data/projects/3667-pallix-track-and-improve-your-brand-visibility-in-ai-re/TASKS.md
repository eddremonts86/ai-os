---
id: "3667"
slug: pallix-track-and-improve-your-brand-visibility-in-ai-re
title: Pallix – Track and improve your brand visibility in AI recommendations
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/pallix?utm_campaign=startup-181418&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Next.js, TypeScript, PostgreSQL, Prisma, OpenAI API, Perplexity API, Gemini API, Reddit/YouTube/marketplace connectors]
---
# Pallix – Track and improve your brand visibility in AI recommendations

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3667-pallix-track-and-improve-your-brand-visibility-in-ai-re/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the methodology framework with templates for visibility score, competitor share, sentiment, prioritization and impact measurement, and require a methodology page before any metric is shown
- [ ] Build the per-brand prompt-set authoring surface with rationale recorded per prompt, so generic prompts do not miss the buyer's actual questions
- [ ] Implement adapters for ChatGPT, Perplexity and Gemini behind a common interface, with a multi-run aggregation rule published for AI-engine non-determinism
- [ ] Build the citation graph linking brand-presence entries to citations and to the underlying community signal
- [ ] Implement signal ingestion connectors for Reddit, YouTube, marketplaces and editorial sites, with data-source coverage documented per brand
- [ ] Add the sentiment model with failure modes named explicitly, and the competitor-share computation with the competitor set defined per brand
- [ ] Build the prioritized fixes surface that traces each fix back to the evidence (prompt, citation, signal)
- [ ] Implement the impact-measurement view using the published methodology rather than an ad-hoc comparison
- [ ] Ship the free audit and guided demo flows with the data flow documented (what the user gets, what is generated, what is stored)
- [ ] Attribute every claim about the product to the BetaList listing rather than asserting it as a measured result, and document the per-brand coverage honestly

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
