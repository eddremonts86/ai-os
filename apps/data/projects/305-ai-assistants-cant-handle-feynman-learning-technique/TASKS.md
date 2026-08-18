---
id: "305"
slug: ai-assistants-cant-handle-feynman-learning-technique
title: "AI assistants can't handle Feynman learning technique"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/education/tnjlstt8s1-ai-assistants-cant-handle-feynman-learni"
category: education
date: "2025-11-12"
tags: [Education, AI, Other]
country: China
tech: [Next.js, TypeScript, Postgres, Anthropic Claude API, LangSmith tracing, Vercel]
---
# AI assistants can't handle Feynman learning technique

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (topic card, explanation editor, gap feedback panel, badge view)
- [ ] Provision China-region Postgres (RDS) + Next.js deploy on Aliyun / Tencent
- [ ] Wire model layer: China-reachable Anthropic-compatible endpoint + Qwen/DeepSeek fallback
- [ ] i18n: zh-CN default, en-US toggle

## Phase 1: Core

- [ ] Topic input: free text or paste of study notes (max 2000 chars)
- [ ] Explanation editor: learner writes their plain-language explanation in Chinese
- [ ] Gap detector: model call returns JSON list of flagged phrases with categories (vague / jargon / source-dependent)
- [ ] Targeted question loop: 3–5 questions per round, learner answers, next round
- [ ] Pass criteria: explanation under 200 Chinese characters with ≤ 2 jargon terms, no flagged phrases remaining
- [ ] Completion badge stored per topic; shareable image
- [ ] Tutor dashboard (paid): list of learners with their gap notes per topic
- [ ] End-to-end test: 50 topics across CS / economics / engineering; measure pass rate and gap-detection precision

## Phase 2: Deploy

- [ ] Switch model layer to paid capacity with the China-reachable endpoint
- [ ] Recruit 200 pilot learners in 2 Chinese universities
- [ ] Status page + LangSmith trace dashboard
- [ ] Post-mortem after week 10 with the pilot cohort
