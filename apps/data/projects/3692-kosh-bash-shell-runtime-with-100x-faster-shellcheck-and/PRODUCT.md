---
id: "3692"
slug: kosh-bash-shell-runtime-with-100x-faster-shellcheck-and
title: Kosh – Bash shell runtime with 100x faster Shellcheck and LSP built-in
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484178"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Rust (or C/Go), Bash parser (vdifonova or mvdan/sh), LSP server, Tree-sitter for embedded-shell]
---
# Kosh – Bash shell runtime with 100x faster Shellcheck and LSP built-in

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A shell scripter gets a single Rust-grade binary that both runs fast static analysis on Bash (the author claims roughly 100× faster than shellcheck on real workloads) and serves as a Language Server inside their editor — so the same engine that powers CI linting also powers inline squigglies, with no separate shellcheck or bash-language-server install. The product collapses two slow, fiddly tools into one and turns shell editing into a live, IDE-grade experience.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Sysadmin / SRE / DevOps | Edits `.sh` daily; current shellcheck is too slow on big scripts and the bash language server stalls in big workspaces. |
| DevX / platform engineer | Runs shell lint in CI on monorepos and wants sub-second feedback per file, not multi-minute CI runs. |
| Workflow / build-tooling author | Maintains GitHub Actions YAML or Compose files with embedded `run: bash -c ...` and wants the same diagnostics inside those blocks. |
| Editor author (Neovim / Helix / VS Code) | Wants a faster, more correct Bash LSP than the current `bash-language-server`. |

## Jobs To Be Done

1. **Functional job** — Lint Bash scripts and surface errors in an editor with sub-second feedback, including on large repos.
2. **Emotional job** — Stop dreading the "spinning shellcheck on a 2000-line script" round-trip and the "language server stalled" editor freeze.
3. **Social job** — Be able to point at a tool and say "this is how shell linting should feel in 2026" instead of patching together shellcheck + bash-language-server.

## Success Metrics

- **Speed:** `kosh check` on a published 5,000-line Bash corpus finishes in ≤ 1/30th of stock shellcheck's wall-clock on the same machine (the author's headline claim is ~100×; the floor for credibility is 30×).
- **Memory:** ≤ 1/4 the peak RSS of shellcheck on the same workload.
- **Editor latency:** LSP `textDocument/didChange` → diagnostic turnaround ≤ 50 ms on warm cache, ≤ 250 ms cold.
- **Diagnostic parity:** ≥ 90% of shellcheck SC-grade findings are also produced by `kosh` on a public Bash corpus, with the remaining 10% documented.
- **Adoption:** ≥ 500 GitHub stars within 3 months of public release; ≥ 50 issues filed against it within the first month as the author explicitly solicits.

## Pricing & Monetization

OSS-only. The Show HN post makes no commercial claim. Any future monetization would more naturally be a hosted SaaS variant (a team dashboard, hosted LSP, shared rule packs) rather than the binary itself.

## Competitive Landscape

- **Shellcheck (vdifonova/shellcheck)** — the reference static analyzer for Bash; the speed baseline Kosh is racing against.
- **bash-language-server / Bash-LSP** — community LSP implementations; the editorial baseline.
- **mvdan/sh** — high-quality Bash parser, used as a building block by both Kosh and others.
- **Editor-specific lint integrations** (ALE, syntastic, null-ls) — glue layer; the LSP underneath is still shellcheck or bash-language-server.
- **Language-specific shell linters** (shfmt, beautysh) — focused on formatting rather than correctness diagnostics.

## Risks & Open Questions

- [ ] Performance claim needs a reproducible benchmark before the README can lead with "100×" — without it, the headline is unfalsifiable marketing.
- [ ] Bash compatibility is a moving target (arrays, `[[ ... ]]`, process substitution, `set -e` semantics); the MVP must declare which Bash dialect/version it targets.
- [ ] Embedding-mode (YAML, JSON, Compose) is "planning to expand" — keep it behind a feature flag and do not promise it in the README.
- [ ] The author is openly soliciting bug reports; issue-triage discipline (templates, labels, a known-bad corpus) will determine whether the issue tracker stays usable.
- [ ] Possible naming collision with the Python `kosh` package and other prior art — confirm trademark / namespace risk before promoting widely.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49484178) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
