# SPEC.md — SeaSearch – Lightweight, S3-backed multi-tenant search engine

## Problem

Hi HN, I&#x27;m Daniel, co-founder of Seafile.<p>I&#x27;m glad to share our open-sourcing project SeaSearch, a search engine written in Go (built on ZincSearch) that we’ve been running in production for over two years for Seafile project.<p>After years of using Elasticsearch, we think there are two main problems with Elasticsearch:<p>It is not lightweight and hard to maintain a cluster<p>All of seafile tenants&#x27; data was stored in a single index and it is slow to search a file in a single library because the whole index need to be searched<p>Three years ago, we started developing a solution to solve the two problems. Rather than building a search engine from scratch, we built on top of ZincSearch, that is implemented in Go rather than JVM with a smaller runtime footprint and has Elasticsearch API compatibility, but it was still missing something that we get to find out along the way.<p>We have now open-sourced SeaSearch with the pieces we needed:<p>S3-backed Storage: Index data lives in S3. Compute nodes share the same backend, making scaling&#x2F;failover instant (no data replication needed).<p>Smart Caching: Uses a local disk cache for immutable segments to keep things fast despite the S3 backend.<p>ES API Compatible: Works as a drop-in replacement for most Elasticsearch query endpoints.<p>Lightweight Go Runtime: No JVM overhead.<p>Vector Search: Built-in support for HNSW&#x2F;IVFPQ for hybrid semantic search.<p>Hope this helps fellow devs who are stuck in this problem when building multi-tenant SaaS applications. Looking forward to your responses.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49721546)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T02:45:52Z

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
