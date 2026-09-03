# SPEC.md — Durable Workflow 2.0 polyglot workflows in PHP, Python and Rust

## Problem

I built a sample app for Durable Workflow 2.0 that lets you try it out via GitHub Codespaces in your browser.<p>What makes DW 2.0 unique? Several deployment modes.<p>If your app is Laravel then you can embed the workflow engine inside your app and it works with the storage and queues that your app is already using. No additional infra needed.<p>If not then you can run it in service-mode which provides a language-neutral HTTP+JSON control plane. Under the hood, it&#x27;s still a Laravel app so it&#x27;s fairly simple to deploy. But you don&#x27;t need to worry about PHP or Laravel in service mode for the most part. There are prebuilt Docker images and Helm charts.<p>Check out the launch article: <a href="https:&#x2F;&#x2F;durable-workflow.com&#x2F;blog&#x2F;durable-workflow-2-0&#x2F;" rel="nofollow">https:&#x2F;&#x2F;durable-workflow.com&#x2F;blog&#x2F;durable-workflow-2-0&#x2F;</a><p>Feel free to ask me questions here.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49521517)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T13:11:33Z

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
