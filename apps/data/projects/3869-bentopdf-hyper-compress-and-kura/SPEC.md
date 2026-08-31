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

## Problem

The poster introduces three open-source PDF tools he built. BentoPDF is a browser PDF toolkit whose latest update edits existing PDF text, images and objects in the browser. Hyper Compress is a high-fidelity, content-preserving compression engine that keeps PDF conformance and, he claims, surpasses all other open-source compression tools; it runs as a CLI, Node SDK, C API, self-hosted service and WebAssembly build. Kura is a PDF standards, conversion and preflight engine supporting all 11 PDF/A levels, PDF/UA-1 and PDF/UA-2, the PDF/X family, PDF/E-1, PDF/VT, e-invoicing formats (Factur-X, ZUGFeRD, XRechnung, Order-X) and 396 bundled print-preflight profiles. He reports testing against the veraPDF corpus, Isartor, BFO, Ghent Output Suite 5.0, the PDF/UA Reference Suite and Cal Poly's PDF/VT suite: across 30,677 PDF conversions, zero crashes, zero timeouts and a 0.05-second median conversion time. Kura ships as a CLI, C library, npm package, Docker image and WebAssembly build; the WASM builds mean no PDF is uploaded, since everything runs in the browser. He asks the community to try the tools and give feedback.

## Objective

Package the three tools as a coherent open-source PDF suite: browser editing (BentoPDF), compression (Hyper Compress) and standards conversion plus preflight (Kura), with the WASM no-upload story as the privacy anchor. The MVP makes all three usable through their stated channels with reproducible benchmarks.

## Target Users

- Developers automating PDF creation, conversion and compression in CI or backends.
- Archivists and print shops needing PDF/A or PDF/X conformance.
- E-invoicing implementers targeting Factur-X, ZUGFeRD, XRechnung or Order-X.
- Privacy-sensitive users who refuse to upload documents to cloud tools.

## MVP Scope

- BentoPDF: browser editing of existing PDF text, images and objects.
- Hyper Compress: high-fidelity compression with conformance preserved, across CLI, Node SDK, C API, self-hosted and WASM surfaces.
- Kura: conversion and preflight for the stated PDF/A, PDF/UA, PDF/X, PDF/E, PDF/VT and e-invoicing targets with 396 profiles.
- A published benchmark harness reproducing the 30,677-conversion, zero-crash, 0.05-second-median results.

## Constraints

- The poster's claims — including surpassing all other open-source compressors — are self-reported and must be reproduced before being restated as fact.
- The WASM builds must keep documents on-device; no upload path may exist.
- The conformance surface is defined by the named formats only; anything beyond them is out of scope.

## Design Direction

See `DESIGN.md` for this project's design tokens.
