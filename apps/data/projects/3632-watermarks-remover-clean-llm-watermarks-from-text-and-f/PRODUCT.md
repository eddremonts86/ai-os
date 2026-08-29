---
id: "3632"
slug: watermarks-remover-clean-llm-watermarks-from-text-and-f
title: "Watermarks Remover: Clean LLM watermarks from text and files"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481577"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python 3.11+, stdlib http.server, Pillow (EXIF/XMP), c2patool (C2PA), Claude Agent Skill, Docker]
---
# Watermarks Remover: Clean LLM watermarks from text and files

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A small, open-source tool with two surfaces — a Claude agent skill and a Python stdlib HTTP service — that strips the deterministic provenance marks the source names (invisible Unicode characters and C2PA / EXIF / XMP metadata) from files the user owns, and that makes a best-effort attempt at the statistical text marks the source names (Claude, Gemini-SynthID, OpenAI, Kirchenbauer and keyed-Gumbel class). The author's own qualifier — "best-effort" for the statistical class — is preserved throughout the documentation, the response shapes and the agent skill description, so no user is led to expect a guarantee the tool does not provide.

The HTTP surface is implementable on Python's standard library, which keeps the dependency footprint and the supply-chain surface small. The agent skill surface follows the Claude skill convention, which means the same operations are callable from a Claude session with the same semantics as from the HTTP endpoint.

**One-liner:** Watermarks Remover strips the invisible-Unicode and C2PA / EXIF / XMP marks from files you own, and makes a documented best-effort pass at the Claude / Gemini-SynthID / OpenAI / Kirchenbauer / keyed-Gumbel text-watermark class.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Self-publishing authors | Strip invisible Unicode and metadata before publishing, with a record of what was removed. |
| Self-hosting operators | A stdlib HTTP service that fits into an existing deployment without a heavy framework. |
| Claude agent users | A skill surface that lets an agent call the same operations from a conversation. |
| Privacy-focused creators | Local control over which metadata fields leave the machine, including a configurable allowlist. |
| Researchers | A reference implementation for what best-effort watermark removal looks like in practice. |
| Reviewers | A small dependency surface that makes end-to-end security review tractable. |
| Creators concerned about third-party watermark detectors | A tool that is honest about what it can and cannot do against a detector. |

## Jobs To Be Done

1. **Functional job** — Strip invisible Unicode characters from text the user is about to publish, with an audit of what changed.
2. **Functional job** — Remove C2PA manifests and EXIF / XMP blocks from images and documents, with a configurable allowlist for fields the user wants to keep.
3. **Functional job** — Make a documented best-effort pass at the statistical text-watermark class on a chunk of text, and report what was attempted without claiming a guarantee.
4. **Functional job** — Run the same operations from a Claude session via an agent skill with the same semantics as the HTTP endpoint.
5. **Emotional job** — Have a way to publish work without the invisible telltales that re-identify a file as a particular model's output.
6. **Social job** — Have a defensible answer to "what did you actually do?" by pointing at a small, readable codebase rather than a black-box API.
7. **Emotional job** — Trust a tool that tells the truth about its limits rather than one that promises more than it can deliver.

## Success Metrics

- **Removal determinism** — share of test inputs where the deterministic strippers (invisible Unicode, C2PA, EXIF, XMP) remove exactly the items they claim to, measured against a fixed corpus.
- **Best-effort honesty** — share of responses and documentation strings that preserve the author's "best-effort" qualifier on the statistical class, since a single over-claim breaks the tool's credibility contract.
- **Dependency footprint** — line count and package count of the running service, because stdlib is part of the stated surface and growth has to be deliberate.
- **Audit completeness** — share of responses that include a per-class removal count, so the caller can verify the operation ran end to end.
- **Allowlist correctness** — share of allowlist configurations where the kept fields actually survive the strip, since a silent drop would be a privacy regression in the other direction.
- **Agent-skill parity** — share of HTTP-endpoint operations that the Claude skill can perform with the same input and output shape.
- **Stdlib adherence** — share of HTTP-layer code paths that use the stdlib, so the deployment story stays the small one the source promises.

## Pricing & Monetization

The post names no price, no tier and no hosted plan; the project is open source by the source's stated choice, with both surfaces (agent skill and HTTP service) shipped in the repository. What the architecture does fix is the cost shape: a single stdlib service, a small image, and a deployment the user runs themselves. Any future managed offering would have to bill per file processed and would conflict with the "files you own" framing unless it ran inside the user's own infrastructure.

## Competitive Landscape

- **Online watermark-removal services** — third-party hosted tools that ask the user to upload a file; the source's positioning is that a local, stdlib-based tool exists for users who will not upload.
- **General-purpose metadata strippers (ExifTool, mat2)** — the established deterministic strippers for the metadata class; the source positions itself as a unified surface across Unicode, C2PA and metadata, plus the best-effort statistical class.
- **LLM-side paraphrasing tools** — services that rewrite text to obscure its origin; the source's positioning is that no paraphrase is reliable and that the best-effort statistical class is the honest claim.

The post names no direct competitor in the same space, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Decide how the best-effort statistical class reports what it attempted, since a single sentence "we tried" is too thin and a detailed log might leak information about the detector.
- [ ] Confirm the EXIF/XMP allowlist is honoured on every path, including the agent-skill path, since silent drops would be a privacy regression.
- [ ] Establish the response shape for a C2PA-signed document, since stripping the manifest may invalidate a downstream verifier's check and the user has to know.
- [ ] Decide whether the stdlib HTTP service should ship as a single Python file or a small package, because both shapes are within the source's stated surface.
- [ ] Audit the agent-skill surface for the same best-effort qualifier on the statistical class, so the qualifier survives across both surfaces.
- [ ] Verify the invisible-Unicode stripper handles identifiers that intentionally contain non-ASCII codepoints, so the safe default is actually safe.
- [ ] Decide the policy when a request targets a third-party file the user does not own, since "files you own" is part of the stated contract.
