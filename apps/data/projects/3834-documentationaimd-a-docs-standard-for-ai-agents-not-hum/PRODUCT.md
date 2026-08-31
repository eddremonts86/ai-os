---
id: "3834"
slug: documentationaimd-a-docs-standard-for-ai-agents-not-hum
title: "Documentation.ai.md – a docs standard for AI agents, not humans"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493041"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Markdown-based documentation standard, llms.txt-complementary convention, machine-actionable doc schema, example docs, CC BY 4.0 license, community contribution workflow]
---
# Documentation.ai.md – a docs standard for AI agents, not humans

## Value Proposition

Docs written for agents, not humans. Documentation.ai.md proposes a machine-first documentation standard — files whose structure an AI agent can act on directly — explicitly complementary to llms.txt and licensed CC BY 4.0 so anyone can adopt it. The value claim is that human-readable docs are not agent-usable docs; this standard is the second layer.

**One-liner:** An open standard for documentation.ai.md — machine-first docs your users' AI agents can act on, complementary to llms.txt.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Maintainers of SDKs and APIs | A docs convention their users' agents can follow. |
| Agent developers | Machine-actionable documentation instead of prose parsing. |
| Docs tooling authors | A spec to build validators and generators against. |

The post's audience is anyone who ships documentation that agents will consume.

## Jobs To Be Done

1. **Functional job** — Give projects a standard place (documentation.ai.md) where agents find actionable docs.
2. **Functional job** — Complement llms.txt rather than replace it — the repo's stated positioning.
3. **Functional job** — Let any project adopt freely under CC BY 4.0.
4. **Functional job** — Grow the standard through examples and community contribution.

## Success Metrics

- **Adoption:** projects shipping a documentation.ai.md (zero at capture time).
- **Clarity:** an agent can act on a conformant file without human intervention.
- **Community:** contributors and proposals beyond the initial 4-commit repo.
- **Interop:** tools treat it as complementary to llms.txt, as the repo frames it.

## Pricing & Monetization

None stated. The standard is CC BY 4.0 — free to adopt; there is no pricing, service or monetization in the capture.

## Competitive Landscape

The post does not name competitors; the repo itself names its relationship to llms.txt — complementary, not competing. The product sits in the category of machine-readable documentation conventions (llms.txt and its ecosystem, agent-facing context files), differentiated by targeting agent-actionable docs specifically.

## Risks & Open Questions

- [ ] Adoption is everything: at capture time the repo had 4 commits and no stars, and standards without adopters die.
- [ ] llms.txt already owns the mindshare this standard wants to sit beside; "complementary" can read as "obscure".
- [ ] CC BY 4.0 allows wide use but weakens the standard's governance (no license-enforced compatibility).
- [ ] "Agents can act on" is a strong claim; the spec must prove agents do act on conformant docs.
- [ ] The capture is URL-only with no community signal beyond the repo's own files.
