---
id: "3622"
slug: dromeas-run-ai-code-review-on-every-commit-and-automate
title: Dromeas – Run AI code review on every commit and automate release readiness
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/dromeas-2?utm_campaign=startup-180999&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Go, tree-sitter, PostgreSQL, Redis Streams, MCP server in TypeScript, Kubernetes]
---
# Dromeas – Run AI code review on every commit and automate release readiness

## Phase 0: Scaffold

- [x] Read the BetaList listing and separate its claims from its marketing
- [ ] Write down the normalised review event shape (forge, repo, SHA, base SHA, change kind) before writing any forge adapter
- [ ] Define the merge-readiness verdict rule explicitly: which dimensions and severities block, which only comment
- [ ] Decide what the Code Map excludes: generated files, vendored trees, build output, lockfiles
- [ ] PostgreSQL schema for installation, repository, code_map, review, finding, council_check, release_report
- [ ] Redis Streams queue with per-repository partitioning and a consumer group per analyser pool
- [ ] Pin the tree-sitter grammar set and record versions in the Code Map content hash input
- [ ] Write the source-code handling policy: which providers see code, what is retained, for how long
- [ ] Build the labelled finding set (target 200 candidates) that the council precision claim will be measured against

## Phase 1: Core

- [ ] Code Map service: tree-sitter parse to files, symbols and edges, keyed and cached by commit SHA
- [ ] Determinism test: rebuild the same SHA ten times, assert one content hash, wire it into CI on a fixed corpus
- [ ] GitHub App: install flow, webhook receiver for pull_request, push and release, normalised into the internal event
- [ ] Shallow checkout worker with a bounded disk budget and cleanup on crash
- [ ] Static pre-filter pass that runs before any model call and drops candidates cheaply
- [ ] Quality analyser over the diff plus Code Map neighbourhood of each changed symbol
- [ ] Security analyser, with the reached-callers set from the Code Map as part of its input
- [ ] Compliance analyser against a named, per-repository configurable rule set
- [ ] Test analyser: for each changed symbol, find referencing tests through the Code Map and report uncovered changes
- [ ] Documentation analyser: changed public surfaces whose docs did not change
- [ ] Council: submit each candidate to at least two other models, persist every check outcome, drop non-survivors
- [ ] Verdict reducer implementing the published rule, emitting exactly one verdict per review
- [ ] Inline comment poster keyed by finding ID, updating in place on force-push
- [ ] Default-branch push review path producing a verdict record with no pull request present
- [ ] Release-tag path: tag-to-tag diff, changed surfaces from both Code Maps, verdict roll-up, readiness report
- [ ] GitLab adapter against the normalised event shape (merge-request discussions, commit status)
- [ ] Bitbucket adapter against the normalised event shape (inline comments, build status)
- [ ] Hosted MCP server: findings, verdicts and Code Map queries, read-only, scoped per installation
- [ ] Provider-outage behaviour: degrade the verdict explicitly rather than silently reducing the council to one model
- [ ] Precision dashboard: pre-council and post-council numbers per repository, per dimension

## Phase 2: Deploy

- [ ] Analyser pool on Kubernetes with autoscaling on Redis queue depth, not on a fixed replica count
- [ ] Latency budget published per change size, with the fail-open path exercised under a forced provider outage
- [ ] Mirror one test repository to GitHub, GitLab and Bitbucket and assert the same finding set on all three
- [ ] Onboard the first repositories with the verdict advisory-only, then flip to blocking once verdict agreement is measured
- [ ] Publish the determinism and precision numbers as re-runnable checks rather than claims
- [ ] Week 12 review: finding precision, verdict agreement, comments shown per pull request, release-report open rate
