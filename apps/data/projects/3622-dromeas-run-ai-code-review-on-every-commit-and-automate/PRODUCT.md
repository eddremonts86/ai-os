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

## Value Proposition

Every pull request and every default-branch commit gets reviewed for quality, security, compliance, tests and documentation, and comes back as inline comments plus one merge-readiness verdict a reviewer can act on without reading a report. Every release tag gets a scope and readiness assessment built from a Code Map that is reproducible from the commit SHA. Findings are cross-verified by several models before they are shown, so the comment count stays low enough to still be read.

The pitch to a team that already switched its review bot off: the same repository, fewer comments, and one verdict per change instead of a list to triage.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Reviewers on a busy repository | Want one merge-readiness signal, not a per-diff comment stream they have learned to skip. |
| Release managers cutting tagged releases | Need release scope and risk assembled from the commit range instead of read off a changelog by hand. |
| Compliance and audit owners | Need a reviewed-and-verdicted record for every change on the default branch, including direct pushes. |
| Platform teams running GitLab or Bitbucket | Most review tooling is GitHub-first; all three forges are named here as first-class. |
| Developers in MCP-aware IDEs | Want to query findings for their branch from the editor rather than the pull-request page. |

## Jobs To Be Done

1. **Functional job** — Decide whether a change is safe to merge, and whether a tag is safe to release, without reconstructing the context by hand.
2. **Functional job** — Produce evidence that every default-branch change was reviewed against a stated set of dimensions.
3. **Emotional job** — Trust the bot again. The council step exists because the previous generation of review bots was silenced by its own false positives.
4. **Social job** — Show a reviewer, an auditor or a customer that the release gate is deterministic and re-runnable rather than a model's opinion of the day.

## Success Metrics

- **Finding precision** — share of shown findings a reviewer marks as real, tracked before and after the council step so the cross-verification claim is measurable rather than asserted.
- **Verdict agreement** — share of merge-readiness verdicts that match what the human reviewer decided on the same change.
- **Code Map determinism** — percentage of repeat builds on an unchanged SHA that produce a byte-identical map. This is a pass or fail number, and anything below 100% is a bug.
- **Release-report adoption** — share of release tags whose readiness report is opened before the release ships.
- **Comment load** — mean shown findings per pull request; the product fails if this climbs back to the level teams already ignore.
- **Forge coverage** — repositories connected per forge, since the three-forge claim is only credible if GitLab and Bitbucket have real installs.

## Pricing & Monetization

The BetaList listing names no price, tier or billing unit; absent beats invented. What the architecture does fix is the shape of the cost: reviewing every default-branch commit and running a multi-model council makes model spend scale with commit volume, so whatever pricing is chosen has to be bounded per repository or per commit rather than per seat alone.

## Competitive Landscape

- **Per-diff review bots already installed in these repositories** — the listing positions against them implicitly, by making the false-positive rate the thing the council fixes, and by adding a release-level assessment they do not produce.
- **Static analysers and security scanners in CI** — deterministic and cheap, but they report per rule rather than as a single merge-readiness verdict, and they say nothing about documentation or release scope.
- **Manual release checklists** — what the release assessment replaces. The listing does not name a tool here, and neither does this document.

The listing names no competitor by name, so no further comparison is claimed.

## Risks & Open Questions

- [ ] Measure whether the council actually raises precision, or only raises cost. If two extra model calls do not move the precision number, the central claim is empty.
- [ ] Define what "deterministic Code Map" excludes: generated files, vendored trees, and build outputs all threaten reproducibility.
- [ ] Decide the fail-open or fail-closed behaviour when a model provider is down mid-review and a verdict is owed to a blocked merge.
- [ ] Resolve the compliance dimension: compliance against what standard, chosen by whom, and configurable per repository or fixed.
- [ ] Confirm inline comment anchoring survives rebases and force-pushes on all three forges before promising them equally.
- [ ] Establish the source-code retention and model-routing policy, since customer code leaves the forge to be reviewed.
