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

## Tech Stack

- **Go** for the ingest, orchestration and analyser services: the workload is many concurrent repository checkouts and parse passes, and a single static binary per worker keeps the runner image small.
- **tree-sitter** for the Code Map: grammars are deterministic parsers, which is the only way the same SHA can be guaranteed to yield the same map.
- **PostgreSQL** for findings, verdicts, council survival records, installations and release reports — relational because the release report is a join over the commit range.
- **Redis Streams** as the review queue with consumer groups, giving per-repository ordering and redelivery when an analyser worker dies mid-review.
- **MCP server in TypeScript** because the reference MCP SDK and the IDE clients live there; it stays a thin read layer over the same PostgreSQL.
- **Kubernetes** to run the analyser pool, since commit-triggered review load is spiky and the pool has to scale on queue depth rather than on a fixed size.

## Architecture

A forge app receives webhooks and normalises them into one internal event type carrying forge, repository, SHA, base SHA and change kind (pull request, default-branch push, or release tag). Normalising at the edge is what makes GitLab and Bitbucket adapters instead of forks: everything downstream sees the same event regardless of origin. Events land on a Redis stream partitioned by repository so two reviews of the same repository never race on its checkout.

An analyser worker claims an event, fetches a shallow checkout at the SHA, and asks the Code Map service for the map. The map service parses the tree with tree-sitter into files, symbols and edges, keys the result by SHA, and caches it; a second request for the same SHA is served from cache and must be identical. The worker then runs the five dimension analysers over the diff plus the Code Map neighbourhood of every changed symbol — callers, callees and tests referencing it — so a reviewer's comment can cite what a change reached, not just what the patch touched. Cheap static passes run first and filter before any model call, since the council multiplies every surviving candidate.

Each candidate finding then enters the council: it is submitted to at least two models other than the one that produced it, and only findings that survive are persisted as shown. The survival record is kept, which is what makes the precision metric computable later. Shown findings are reduced to one merge-readiness verdict by a published rule over finding severity and dimension, not by a summarising model call. The comment poster writes inline comments through the forge adapter, keyed by finding ID so a force-push updates in place instead of duplicating. On a release-tag event the pipeline changes shape: it diffs tag against previous tag, pulls changed surfaces from both Code Maps, rolls up the stored verdicts for every commit in the range, and writes a readiness report. The MCP server reads that same store, so an IDE query and a pull-request comment can never disagree.

## Data Model

- `installation` — forge, account, credentials reference, enabled repositories.
- `repository` — forge coordinates, default branch, language set, Code Map status.
- `code_map` — commit SHA, content hash, symbol and edge blobs, build duration. The content hash is what the determinism metric checks.
- `review` — repository, SHA, base SHA, change kind, state, verdict, latency.
- `finding` — review, dimension, severity, file, symbol, anchor, body, originating model.
- `council_check` — finding, checking model, outcome, so precision before and after verification is reconstructable.
- `release_report` — repository, tag, previous tag, commit range, changed surfaces, rolled-up readiness.

## Integrations

- **GitHub** — App install, webhooks for pull_request, push and release, Checks API for the verdict, review comments for findings.
- **GitLab** — project or group webhooks, merge-request discussions, commit status for the verdict.
- **Bitbucket** — workspace app, pull-request and push webhooks, inline comments, build status.
- **Model providers** — at least two independent providers, required for the council to be more than one opinion.
- **MCP clients** — hosted MCP server for IDEs and assistants, read-only over findings, verdicts and Code Map queries.

## Milestones

1. **M0 — Deterministic Code Map.** Build a map for a repository at a SHA, rebuild it ten times, and show ten identical content hashes. Exit criterion: the determinism metric reads 100% on a repository of at least 50k lines, and unsupported languages are reported as unmapped rather than skipped silently.
2. **M1 — Single-forge review with a verdict.** GitHub pull-request webhook to inline comments plus one merge-readiness verdict on the Checks API, with all five dimensions running. Exit criterion: a pull request in a test repository shows anchored comments and exactly one verdict, and a force-push updates the comments in place instead of adding a second set.
3. **M2 — Council verification measured.** Cross-model checking live, with pre-council and post-council precision recorded on a labelled set of at least 200 candidate findings. Exit criterion: post-council precision is measurably higher than pre-council on that set, or the council design is revised before shipping.
4. **M3 — Default-branch commits and release reports.** Direct pushes reviewed and verdicted; tag events producing a readiness report from the commit range. Exit criterion: a release report for a tag lists the changed surfaces and every commit verdict in the range, and re-running it on the same tag pair produces the same report.
5. **M4 — Second and third forge, plus hosted MCP.** GitLab and Bitbucket adapters against the normalised event shape; MCP server answering findings and Code Map queries. Exit criterion: the same test repository mirrored to all three forges produces the same finding set, and an MCP client retrieves those findings for a branch.

## Risks

- **Determinism erodes quietly.** A grammar upgrade, a changed traversal order or an unsorted map iteration all break reproducibility without any error. The content-hash check has to run in CI on a fixed corpus, not just at M0.
- **Council cost per commit.** Reviewing every default-branch commit and tripling model calls per finding puts a floor under per-repository cost. If the static pre-filter does not remove most candidates, the unit economics decide the product before the quality does.
- **Comment anchoring across three forges.** Each forge anchors diff comments differently and rebases invalidate positions; a comment on the wrong line loses trust faster than a missed finding.
- **Verdict as a merge blocker.** Once the verdict gates merges it is on the critical path of every deploy, so the latency budget and the fail-open behaviour are product decisions, not operational details.
- **Compliance is undefined.** The listing lists compliance as a review dimension without a standard. Reviewing against an unnamed standard produces findings nobody can act on.
- **Customer source leaves the perimeter.** Code is sent to multiple model providers by design. One unacceptable retention policy in that chain is enough to disqualify the product for the compliance-driven buyer it is aimed at.
