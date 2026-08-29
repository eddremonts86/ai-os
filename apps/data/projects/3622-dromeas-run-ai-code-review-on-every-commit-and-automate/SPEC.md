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

## Problem

Dromeas is listed on BetaList as agentic code review plus release management. The listing is vendor copy, so the engineering problem has to be read out of its claim set, and that claim set is unusually specific. It asserts four things: every pull request and every commit landing on the default branch is reviewed across quality, security, compliance, tests and documentation; each review posts inline comments plus a single merge-readiness verdict; every release tag gets a scope and readiness assessment computed from a deterministic Code Map; and a council of top-tier LLMs cross-verifies findings to cut false positives.

Two words in that list carry most of the engineering weight. **Deterministic** applies to the Code Map: if the map of the repository is resampled from a language model on each run, two assessments of the same release tag will disagree, and a release gate that disagrees with itself is not a gate. The map therefore has to be derived from the source tree by parsing, not by generation, and be reproducible from a commit SHA alone. **Council** is the stated answer to the false-positive problem that makes existing review bots easy to ignore: a finding from one model is a hypothesis, and only findings that survive cross-checking by other models are worth a reviewer's attention or a blocking verdict.

The second half of the listing is an integration problem rather than a review problem. Supporting GitHub, GitLab and Bitbucket means three webhook payload shapes, three inline-comment APIs with different anchoring rules for diff positions, and three permission and installation models. Offering a hosted Model Context Protocol server on top means review state cannot live only inside a forge's comment thread: findings, verdicts and the Code Map have to be queryable objects that an IDE or an assistant can ask about outside the pull-request page.

The gap the product implies is the release step. Per-diff bot reviewers see a patch, not a repository, so they cannot answer the question a release manager actually asks: what changed since the previous tag, which of those changes touch risky surfaces, and is anything unfinished. That question needs a repository-level model of the code plus the review history of every commit in the range, which is why review and release assessment are one product here rather than two.

## Objective

Ship a review service that (1) reviews every pull request and every default-branch commit on GitHub, GitLab and Bitbucket across quality, security, compliance, tests and documentation, (2) reduces each review to inline comments plus one merge-readiness verdict, (3) produces a release scope and readiness report on each release tag from a Code Map that is reproducible from the commit SHA, and (4) exposes the same review state through a hosted MCP server. Findings only reach a reviewer after cross-model verification.

## Target Users

- Engineering teams that already run a review bot and stopped reading its comments because the false-positive rate outran the value; the council step exists for them.
- Release managers and tech leads who cut tagged releases and today assemble scope and risk by hand from a commit log.
- Compliance-facing teams that must show a reviewed-and-verdicted record for every change on the default branch, not just for changes someone chose to open a pull request for.
- Developers using MCP-aware IDEs and assistants who want to ask about findings on their branch without leaving the editor.

## MVP Scope

- Forge app for GitHub first, receiving pull-request and push webhooks, with the ingest layer written against a normalised event shape so GitLab and Bitbucket are adapters rather than rewrites.
- Code Map builder: parse the repository with tree-sitter into a symbol, file and dependency graph keyed by commit SHA, cached and byte-identical when rebuilt from the same SHA.
- Five review dimensions as separate analysers over the diff plus its Code Map neighbourhood: quality, security, compliance, test coverage of changed symbols, documentation of changed public surfaces.
- Council verification: each candidate finding is re-checked by at least two other models; findings that fail cross-checking are dropped, and the survival record is stored so precision can be measured.
- One merge-readiness verdict per change, derived from surviving findings by an explicit, published rule rather than by asking a model for a summary judgement.
- Inline comment posting with stable anchoring, plus update-in-place on force-push so a reviewer never reads stale comments.
- Default-branch commit review: the same pipeline runs on direct pushes, producing a verdict record even where no pull request exists.
- Release-tag assessment: on tag creation, diff the tag against the previous tag, list changed surfaces from the Code Map, and roll up the per-commit verdicts in the range into a readiness report.
- Hosted MCP server exposing findings, verdicts and Code Map queries for a repository and branch.

## Design Direction

The reader is a developer inside a pull request or a release manager reading a report; both are scanning for one thing, so the surface stays dense and text-first. Findings render as a table sorted by verdict impact, with the merge-readiness verdict as the only element allowed a colour. Code Map views are rendered as indented text rather than a force-directed graph, because determinism is the product claim and a stable layout is part of showing it. No motion beyond a diff-loading state. Mono for code and symbol names, one text family everywhere else, a four-step scale so a long finding list stays compact.

## Constraints

- The Code Map must be reproducible: same commit SHA, same map, byte for byte. Anything nondeterministic in its construction is a defect, not a tuning parameter.
- Reviewing every default-branch commit sets a hard cost ceiling per commit. The council step multiplies model calls, so cheap static filtering has to run before any model is called.
- Source code leaves the customer's forge to reach the models. The data-handling boundary, retention window and per-model routing must be documented before the first paying repository is connected.
- Inline comment anchoring differs across the three forges; positions that drift on rebase produce comments on the wrong line, which destroys trust faster than a missed finding.
- A blocking merge-readiness verdict sits in the critical path of someone's deploy. Latency budget and a documented fail-open behaviour are launch requirements.
- The council needs more than one model provider to mean anything, so provider outages must degrade the verdict explicitly rather than silently reducing to a single opinion.

## Out of Scope

- Automatic fix commits or pull requests. The listing describes review, verdicts and release assessment, and nothing about writing code.
- Self-hosting. The MCP server is described as hosted, and the MVP follows that.
- Languages tree-sitter has no maintained grammar for; unsupported languages report as unmapped rather than being reviewed without a Code Map.
