# SPEC.md — 188M Hindi encoder, 28B tokens, 8K context, 1× RTX 4090

## Problem

I wanted to improve Hindi retrieval quality, particularly for longer documents ( as the current architectures don&#x27;t really have a longer context length ), and was curious how far can I push a 4090 haha :)<p>So I trained a Hindi-first ModernBERT from scratch:<p>188M parameters
~28.5B Hindi tokens
8,192-token context, one of the first Hindi encoders to support 8K context ( directly benefits the retrieval capacity, for which encoder models are used for )<p>1× RTX 4090 (24GB) ~5 days of training<p>After DPR fine-tuning, it achieves SOTA on the Hindi retrieval benchmarks I evaluated:<p>mMARCO Hindi: 0.2825 nDCG@10
MLDR Hindi: 0.2635 nDCG@10<p>The MLDR result is particularly interesting because it evaluates long-document retrieval, where the 8K context window can actually be used.<p>It also achieves:<p>Hindi NER: 0.8001 F1
MASSIVE Hindi intent: 0.4731 Macro-F1<p>Model and evaluation details:<p><a href="https:&#x2F;&#x2F;huggingface.co&#x2F;kkkamur07&#x2F;hindi-modernbert" rel="nofollow">https:&#x2F;&#x2F;huggingface.co&#x2F;kkkamur07&#x2F;hindi-modernbert</a><p><a href="https:&#x2F;&#x2F;github.com&#x2F;kkkamur07&#x2F;indic-modernBERT" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kkkamur07&#x2F;indic-modernBERT</a><p>My goal is to extend this to a lot of low resource languages, I would be really grateful for feedback and collaboration opportunities ;) so that I can improve this even further.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49587099)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T14:57:35Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
