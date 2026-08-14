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

## Tech Stack

- **Web app:** Next.js 14 (App Router), TypeScript, deployed on a China-region provider (Aliyun or Tencent Cloud) behind a CDN.
- **Database:** Postgres (RDS) for topics, explanations, gap notes, completion badges.
- **Model layer:** a China-reachable Anthropic-compatible endpoint, with a local Qwen / DeepSeek fallback for users who cannot reach the primary endpoint.
- **Tracing:** LangSmith (or a self-hosted equivalent) to inspect gap-detection outputs and iterate on prompts.
- **i18n:** zh-CN as default, en-US as a toggle.

## Architecture

A Next.js app serves the learner UI (topic input, explanation editor, gap feedback, badge view) and a small tutor-side dashboard for paid users. Each topic is a state machine: explain → detect gaps → ask questions → repeat. The detector reads the learner's explanation, asks the model to flag phrases that are vague or jargon-heavy, and the loop tightens until the explanation passes.

```
Browser (zh-CN) ─▶ Next.js
                       │
                       ├─▶ Postgres (topics, explanations, gap notes)
                       │
                       └─▶ Model layer (China-reachable Claude-compatible / Qwen)
                                      │
                                      └─▶ LangSmith trace per round
```

## Milestones

1. **M0 — Spec freeze + zh-CN UI.** Topic input and explanation editor live, no model calls yet. End of week 1.
2. **M1 — Gap detector.** Single round: explanation → flagged phrases → targeted questions. End of week 3.
3. **M2 — Loop completion.** Pass criteria, completion badge, history view. End of week 5.
4. **M3 — Tutor dashboard.** Gap reports per learner (paid tier). End of week 7.
5. **M4 — 200-learner pilot in 2 Chinese universities.** End of week 10.

## Risks

- **Endpoint reachability** — model calls from China can be blocked or slow; mitigation is a documented local-model fallback before paid traffic.
- **Detector over-triggering** — too many flags will frustrate learners; mitigation is a precision threshold tuned on a 50-explanation calibration set before the public launch.
- **Subject matter expertise gaps** — the detector may miss gaps in deep technical topics; mitigation is a "I disagree, skip this flag" button and a feedback loop into the prompt.
