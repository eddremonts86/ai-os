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

## Tech Stack

- **Python 3.11+** as the runtime, because the source names stdlib and the modern stdlib has the http.server and asyncio primitives the service needs.
- **stdlib http.server** (with asyncio in front) for the HTTP surface, matching the source's stated dependency shape and avoiding a heavyweight framework.
- **Pillow** for EXIF and XMP reading and stripping, because it is the de-facto Python image library and exposes the metadata directly.
- **c2patool** (or a thin wrapper over the C2PA reference library) for C2PA manifest detection and removal on supported image and document formats.
- **A Claude agent skill definition** following the Claude skill convention, so the same operations are callable from a Claude session with the same semantics.
- **Docker** for packaging, so the stdlib service can be deployed the way the rest of a self-hosting stack already is.

## Architecture

The HTTP service is a small Python process built on stdlib http.server, fronted by an asyncio loop that handles concurrent requests without a thread per request. The service exposes three endpoint families, one per deterministic class — invisible Unicode, C2PA, EXIF / XMP — plus a fourth endpoint that wraps the best-effort statistical text class. Each endpoint accepts a file (or a chunk of text for the statistical endpoint) and returns a JSON response with the per-class removal count and, where relevant, the list of fields that were touched.

The Unicode stripper is a small module that walks the input, classifies each non-ASCII codepoint against a list of well-known invisible characters, and emits a cleaned version. The classification list is exposed so the operator can audit what was removed, and a safe-mode flag forces the stripper to skip codepoints that look like legitimate identifiers. The response carries the count and the codepoints removed, never the original text.

The C2PA and EXIF/XMP strippers delegate to the appropriate library for the format-specific work. The EXIF/XMP path honours a per-deployment allowlist of fields the user wants to keep, and the response lists both the removed and the kept fields so the caller can audit. The C2PA path returns a stripped file with the manifest removed and a flag indicating that any downstream verifier's check is now invalidated.

The best-effort statistical endpoint reads the text, runs a series of rewrites targeted at the four families the source names — Claude, Gemini-SynthID, OpenAI, Kirchenbauer and keyed-Gumbel class — and returns the rewritten text alongside a JSON block describing what was attempted. The response description preserves the author's own "best-effort" qualifier and does not claim a removal percentage.

The Claude agent skill is a separate package that exposes the same operations as callable tools. The skill definition follows the Claude skill convention, and every tool description carries the same qualifiers the HTTP endpoint carries, so the user cannot see a different promise on the skill side than on the HTTP side.

## Milestones

1. **M1 — Stdlib service skeleton** — asyncio loop, http.server endpoints, request and response shapes, and a healthcheck.
2. **M2 — Invisible Unicode stripper** — codepoint classifier, safe-mode default, audit list in the response.
3. **M3 — EXIF/XMP stripper** — Pillow-backed, with the per-deployment allowlist and the kept-field report.
4. **M4 — C2PA stripper** — wrapper over c2patool, with the verifier-invalidation flag in the response.
5. **M5 — Best-effort statistical surface** — the four-family rewrite pass with the author's qualifier preserved in every output.
6. **M6 — Claude agent skill** — skill package with tool definitions mirroring the HTTP surface, qualifier strings carried across.
7. **M7 — Dockerfile** — single-image packaging with the stdlib service and the skill package.
8. **M8 — Honesty audit** — CI grep that asserts the best-effort qualifier appears alongside every statistical-class claim in the docs and the responses.

## Risks

- **Over-claiming the statistical class** — a single sentence that drops the best-effort qualifier breaks the tool's credibility contract and has to be caught.
- **Stdlib drift** — newer Python stdlib features can simplify the service, but only if they remain stdlib; a dependency upgrade that crosses into third-party territory breaks the source's stated surface.
- **C2PA detector incompatibility** — the C2PA reference implementation may evolve; the stripper has to track the manifest format the embedders actually use.
- **Allowlist silent drops** — an EXIF/XMP path that drops a field the allowlist wanted to keep would be a privacy regression in the wrong direction.
- **Safe-mode false negatives** — a Unicode stripper in safe mode that misses an actually-invisible codepoint is worse than no stripper; the classifier has to be conservative in the right direction.
- **Skill / HTTP parity drift** — a tool added on the HTTP side without a skill equivalent, or vice versa, gives the caller two surfaces that disagree.
- **Misuse scope creep** — the "files you own" framing is part of the contract; a request policy that does not enforce it lets the tool be used against the author's stated intent.
