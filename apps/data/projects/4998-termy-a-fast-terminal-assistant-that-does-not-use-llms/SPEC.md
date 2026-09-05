# SPEC.md — TERMy – A fast terminal assistant that does not use LLMs

## Problem

I love research and development, you may have heard of me because of PJON (Padded Jittering Operative Network). It is a network protocol I started developing in 2010, which was recently implemented in silicon by the ETH Zurich university thanks to the research of Pius Sieber.<p>I am excited to share with you TERMy, a terminal assistant built on top of the NPC-Forge framework. Unlike everything else being built today, TERMy does not use embeddings, machine-learning or LLMs. It runs on the CPU (even on a Raspberry Pi Zero) both in the terminal or client-side in a browser tab and responds in milliseconds. It is a cynical but very knowledgeable Linux terminal assistant that translates your natural language into shell commands without relying on a single artificial neuron.<p>I had a chance to focus for 2 months on my personal projects since early July, during the strange times of AI price hikes and the end of subsidized tokenmaxing. I was curious to see if I could develop from scratch a terminal assistant capable of handling simple natural language requests. I have a bad memory and got used to ask to copilot &quot;activate the virtual environment&quot; or similar trivial operations spending a non negligible sum every month. I started thinking, maybe I can do something to make my workflow more efficient? Do I really need trillions of parameters to accomplish those tasks?<p>How it Works<p>When you type a prompt, it goes through a lightweight NLU pipeline written in ~1000 lines of Python that implement the following steps:<p>1. Strip expletives, interjections, encouraging, discouraging and thanking words (remove noise)<p>2. Sentiment analysis<p>3. Exact Match (very fast)<p>4. Template Match (slower)<p>5. Probabilistic Match (even slower)<p>Step 5 relies on:<p>1. IDF (Inverse Document Frequency) to identify rare words.<p>2. BOW (Bag Of Words) to accommodate word inversions.<p>3. IDF weighted Levenshtein to safely handle typos.<p>Permission gating is hardcoded into the dataset and enforced for all potentially destructive commands, so it&#x27;s inherently safer than letting an unpredictable LLM run wild on your machine.<p>- TERMy in operation: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg</a><p>- Variance and typo tolerance: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=tQvGDk6fkk0" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=tQvGDk6fkk0</a><p>- Copilot integration: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=Wzzouhq2a8A" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=Wzzouhq2a8A</a><p>- Advanced features: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg</a><p>- Source Code: <a href="https:&#x2F;&#x2F;github.com&#x2F;gioblu&#x2F;NPC-Forge" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;gioblu&#x2F;NPC-Forge</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49562219)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T09:03:00Z

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
