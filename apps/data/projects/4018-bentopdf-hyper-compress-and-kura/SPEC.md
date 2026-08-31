---
id: "4018"
slug: bentopdf-hyper-compress-and-kura
title: "BentoPDF, Hyper Compress and Kura"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499829"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# BentoPDF, Hyper Compress and Kura

## Problem

Hello. I developed an open source tool called BentoPDF. Its an open source PDF toolkit that runs in your browser. With the latest update, you can actually edit existing pdf text, images and objects right in your browser.Live Website: https://www.bentopdf.com
Repository: https://github.com/alam00000/bentopdfAlong with the latest update I would like to share with you Hyper Compress. Its a high fidelity, content preserving compression engine that preserves PDF conformance and surpasses all the other open source PDF compression tools.It runs everywhere: CLI, Node SDK, C API, self hosted service, and also in browser via WebAssembly.Live Website: https://hyper.bentopdf.com
Repository and benchmarks: https://github.com/alam00000/bentopdf-hyper-compressKura is a PDF standards, conversion and preflight engine.It supports:- All 11 PDF/A conformance levels: PDF/A-1a, PDF/A-1b, PDF/A-2a, PDF/A-2b, PDF/A-2u, PDF/A-3a, PDF/A-3b, PDF/A-3u, PDF/A-4, PDF/A-4e and PDF/A-4f- Accessibility: PDF/UA-1 and PDF/UA-2- Print production: PDF/X-1a, PDF/X-3, PDF/X-4, PDF/X-4p, PDF/X-5g, PDF/X-5n and PDF/X-5pg- Engineering and variable data printing: PDF/E-1 and PDF/VT- E-invoices: Factur-X, ZUGFeRD, XRechnung and Order-X- 396 bundled print-preflight profilesIt has been tested against several standards suites, including the veraPDF corpus, Isartor, BFO, Ghent Output Suite 5.0, the PDF/UA Reference Suite and Cal Poly's PDF/VT suite.Across 30,677 PDF conversions it had zero crashes and zero timeouts, with a 0.05 second median conversion time.Like Hyper, it ships as a CLI, C library, npm package, Docker image and WebAssembly build.Live Website: https://kura.bentopdf.com/
Repository and benchmarks: https://github.com/alam00000/bentopdf-kuraBoth Kura and Hyper Compress are running the WASM build so none of your PDF is uploaded and everything runs in your browserrIf possible I would like you guys to try them out and give me feedback on how it worked for you.Thank you.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
