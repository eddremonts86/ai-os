---
tags: ["saas", "ai", "seo", "geo"]
tech: ["Next.js", "TypeScript", "OpenAI API", "Anthropic API", "Perplexity API", "Google API", "Supabase", "Stripe"]
id: "617"
slug: i-set-up-llmstxt-and-every-ai-crawler-file-correctly-an
title: I set up llms.txt and every AI crawler file correctly and got zero visibility. The problem was the domain being 3 days old
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0suj/i_set_up_llmstxt_and_every_ai_crawler_file/"
category: saas
date: "2026-08-15"
---
# I set up llms.txt and every AI crawler file correctly and AI assistants still don't see my site

## Problem

A founder launched a site three days ago and wanted to know whether AI assistants could see it. Set up llms.txt, robots.txt with 19 named AI crawler tokens, clean markup, the whole checklist. Asked a few assistants about the site and got nothing back. Assumed something was blocking the crawlers. Spent a while checking and eventually discovered that the AI assistants are using something other than the public crawlers — they are using retrieval-augmented generation pipelines with their own index, and the public crawlers are not what feeds the assistant's answer. The implicit product: a tool that surfaces whether a site is actually in the AI assistants' retrieval index, not just whether the crawlers can crawl it.

## Objective

Define the MVP scope for an AI-retrieval-index checker: a tool that probes whether a site is in the major AI assistants' retrieval index, surfaces the gap between "crawlers can reach" and "assistant answers from", and gives the founder a concrete action to close the gap.

## Target Users

- **Primary:** indie SaaS founders who have set up llms.txt and want to know if AI assistants actually see their site.
- **Secondary:** content marketers optimising for AI-driven discovery.
- **Tertiary:** SEO agencies adding AI-retrieval to their audits.

## MVP Scope

- A probe that asks a curated set of questions to the major AI assistants (ChatGPT, Perplexity, Claude, Gemini) and reports whether the founder's site appears in the answer.
- A gap analysis: per assistant, what is in the index vs what the founder expects.
- A concrete action list: submit the site to the assistant's retrieval pipeline where possible, improve the llms.txt, add structured data.
- Free tier: 1 site, 5 probes / day. Pro at $29/month: 5 sites, 100 probes / day, weekly monitor.
- Excluded in v1: assistant-specific optimisation, citation tracking, automated llms.txt generation.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single retrieval-check surface — the probe input on the left, the assistant-by-assistant result in the centre, the gap analysis on the right. No marketing-site chrome; the product is the probe.

## Constraints

- The probe must respect each assistant's rate limits; the per-day cap is the safety net.
- The probe cannot guarantee what the assistant will answer on a future query; the tool surfaces a probability, not a promise.
- The action list must be specific; generic "improve your SEO" advice is the failure mode.
