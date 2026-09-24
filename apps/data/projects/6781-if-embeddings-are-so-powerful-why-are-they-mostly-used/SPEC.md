# SPEC.md — If embeddings are so powerful, why are they mostly used for retrieval?

## Problem

Vector embeddings natively are capable of much more than just retrieval. Even when OpenAI released their initial embedding models, it mentioned that their embeddings are natively capable of Search, Clustering, Recommendations, Anomaly Detection, Diversity Measurement, and Classification.<p>But everything is concentrated around Vector DBs and RAG, and is progressing towards GraphRAG and Knowledge Graphs. Why are the other representations being underused? Like, why didn’t they catch up?<p>Everyone is complaining that RAG is dead, Vector DBs are done, they are expensive, and the ROI is not worth it. I know most of this is noise. Embeddings are meaningful and a part of many production pipelines. But why don’t these people try to get more value out of their existing stored embeddings?<p>I don’t know if it’s just me being delusional, but I feel there is a lot of hidden potential that is untapped. Why is retrieval so dominant? I mean, yeah, search has throughout history been a really important operation across any data. But the purpose of embeddings itself was to capture semantic relations beyond just search. Is it because search is the easiest to productize and build features around? And other use cases are not so frequent?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49685838)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-13T16:38:42Z

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
