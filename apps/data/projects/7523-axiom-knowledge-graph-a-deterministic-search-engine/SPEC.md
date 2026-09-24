# SPEC.md — Axiom Knowledge graph: A deterministic search engine

## Problem

Every time you search on internet you might feel in any corner of your mind as does this a correct information because now in 2026 every search becomes AI search and as we know AI can show errors and shows misleading information confidently which is wrong. We want a proper search engine which can show real facts and true facts with under millisecond of search. So, presenting Axiom a search engine which can solve these all problems. Axiom is not a simple search engine but a hybrid BM25 and a sematic vector search engine. 
AXIOM addresses these systemic pathologies by re
locating computational control to a sovereign local exe
cution node. AXIOM operates independently of external
cloud services, processing web documents through a high-performance pipeline and indexing them into a locally stored vector space.
AXIOM is explicitly architected for environments requiring high throughput, structural permanence, and absolute data privacy:
• Offline-First Academic Research: Enables continuous,
local ingestion of scientific repositories (e.g., ArXiv,
PubMed, IEEE Xplore, CERN, Springer) for local
query resolution without web access.
• Deterministic Agentic RAG: Serves as a zero
hallucination ground-truth context provider for
autonomous AI agents requiring verified factual
lookups.
• Self-Hosted Knowledge Infrastructure: Provides
high-density indexing of sensitive internal documentation alongside public domain datasets within a strictly air-gapped security perimeter.
AXIOM presents a production-grade alternative to centralized search platforms. By unifying high-concurrency Rust
spidering, local vector indexing in Qdrant, and strict cross
encoder thresholding, AXIOM delivers high throughput information retrieval while ensuring absolute data sovereignty and factual accuracy. 
Axiom had won from Bing copilot search in information from Wikipedia about maths formulas and concepts and here Bing copilot search told this completely wrong and incorrect whereas on Axiom it shown correct and actual information.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49737804)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-17T08:06:25Z

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
