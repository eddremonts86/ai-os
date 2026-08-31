---
id: "3869"
slug: bentopdf-hyper-compress-and-kura
title: "BentoPDF, Hyper Compress and Kura"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499829"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [WebAssembly, PDF object editing, Compression engine, PDF/A conversion, Preflight validation, C API]
---
# BentoPDF, Hyper Compress and Kura

## Value Proposition

Open-source PDF editing, hyper compression and standards preflight that runs in the browser, CLI or backend — with WebAssembly builds that never upload the document. The value is a full PDF toolchain with a privacy guarantee: edit, compress and validate locally, or embed the same engine anywhere from C to npm. The poster's benchmark claim — 30,677 conversions with zero crashes, zero timeouts and a 0.05-second median — is his own number, reported here as stated.

**One-liner:** Open-source PDF editing, hyper compression and standards preflight that runs in your browser, CLI or backend — documents never uploaded.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Backend developers | Compress, convert and validate PDFs via CLI, C API or npm. |
| Archivists and print shops | PDF/A, PDF/X and print preflight with 396 profiles. |
| E-invoicing teams | Factur-X, ZUGFeRD, XRechnung and Order-X support. |
| Privacy-conscious users | WASM builds keep PDFs entirely on-device. |

The post describes the tools, not the segments; the rows follow from the stated surfaces and formats.

## Jobs To Be Done

1. **Functional job** — Edit existing PDF text, images and objects in the browser.
2. **Functional job** — Compress PDFs with high fidelity without breaking conformance.
3. **Functional job** — Convert and preflight PDFs against PDF/A, PDF/X, PDF/UA and e-invoicing standards.
4. **Emotional job** — Trust: documents never leave the machine when using the WASM builds.

## Success Metrics

- **Compression ratio** at equivalent fidelity versus other open-source compressors, via a published benchmark suite.
- **Conversion reliability:** hold zero crashes and zero timeouts on the 30,677-conversion corpus.
- **Median conversion time:** stay near the stated 0.05 seconds at scale.
- **Conformance pass rates:** per suite — veraPDF corpus, Isartor, BFO, Ghent Output Suite 5.0, PDF/UA Reference Suite.

## Pricing & Monetization

None stated. All three tools are described as open source in the post.

## Competitive Landscape

The post names no competitors directly but claims Hyper Compress "surpasses all the other open source PDF compression tools". The category is open-source PDF tooling — compressors, conversion libraries and preflight validation suites — plus cloud PDF tools that the WASM no-upload builds explicitly avoid. The conformance coverage (11 PDF/A levels plus PDF/X, PDF/UA and e-invoicing formats) is the stated breadth play.

## Risks & Open Questions

- [ ] Performance and conformance claims are the poster's own benchmarks; independent reproduction is pending.
- [ ] Maintaining 396 preflight profiles plus many conformance levels is a heavy long-term load.
- [ ] PDF editing fidelity in the browser is hard; complex documents may not round-trip.
- [ ] Open source with no stated funding model; sustainability is unclear.
