---
id: "617"
slug: i-set-up-llmstxt-and-every-ai-crawler-file-correctly-an
title: I set up llms.txt and every AI crawler file correctly and got zero visibility. The problem was the domain being 3 days old
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0suj/i_set_up_llmstxt_and_every_ai_crawler_file/"
category: saas
date: "2026-08-15"
tags: [saas, ai, seo, geo]
tech: [Next.js, TypeScript, OpenAI API, Anthropic API, Perplexity API, Google API, Supabase, Stripe]
---
# I set up llms.txt and every AI crawler file correctly and AI assistants still don't see my site

## Phase 0: Scaffold

- [ ] Create `apps/617-i-set-up-llmstxt-and-every-ai-crawler-file-correctly-an/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-site probe data
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Provision Supabase: auth, per-site probe results, weekly monitor
- [ ] Wire the per-assistant API clients (OpenAI, Anthropic, Perplexity, Google)
- [ ] Implement the action-list engine in TypeScript

## Phase 1: Core

- [ ] Probe runner for ChatGPT, Perplexity, Claude, Gemini
- [ ] Gap analysis: per-assistant in-index vs expected
- [ ] Action list: submit to retrieval pipeline, improve llms.txt, add structured data
- [ ] Weekly monitor (Pro tier)
- [ ] Free tier: 1 site, 5 probes / day

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 paying founders via IndieHackers and r/SaaS
- [ ] 90-day per-assistant rate-limit audit
- [ ] Post-mortem at week 7
