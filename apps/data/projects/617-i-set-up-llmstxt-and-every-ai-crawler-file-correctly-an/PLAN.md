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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Probe runner:** a per-assistant API client (OpenAI, Anthropic, Perplexity, Google).
- **Storage:** Supabase (auth, per-site probe results, weekly monitor).
- **Action-list engine:** a JSON-defined rule per gap, mapped to a concrete recommendation.
- **Payments:** Stripe.

## Architecture

Single web app + a probe runner that hits each assistant's API with a curated question set. The results are aggregated into a per-site dashboard.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-site probe demo. End of week 1.
2. **M1 — Probe runner for ChatGPT, Perplexity, Claude, Gemini.** End of week 3.
3. **M2 — Gap analysis + action list.** End of week 5.
4. **M3 — Weekly monitor + Stripe paywall.** End of week 7.

## Risks

- **Rate limits** — each assistant's rate limit is the binding constraint; the per-day cap is the safety net.
- **Probe variability** — the assistant's answer can change between probes; the tool surfaces a probability, not a promise.
