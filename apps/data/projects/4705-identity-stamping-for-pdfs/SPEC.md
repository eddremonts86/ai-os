# SPEC.md — Identity Stamping for PDFs

## Problem

I built Ordius to solve a problem I couldn&#x27;t find a clean solution for: establishing a deterministic identity stamp for a PDF document while preserving the document itself.<p>Ordius creates an ID for a PDF and embeds that identity within the document so it can be verified later.
The important constraints for me were that Ordius should not normalize or reconstruct the document, modify its original payload bytes, strip metadata or maintain metadata exclusion logic, require a detached identity file, depend on PKI, and retain the submitted document.<p>I like to think the byte dependency paradox has been resolved by this build, and the result is a small API with Generate and Verify operations.
It&#x27;s live here: https:&#x2F;&#x2F;ordius.net&#x2F;home&#x2F;<p>There are still some questions I am trying to answer: Do cloud storage applications preserve the Ordius Block when a document is uploaded and downloaded? Is the Ordius Block preserved when a stamped PDF is sent as an email attachment? What I have tested: sending an Ordius stamped document as an attachment in Gmail passes with no problems.<p>I&#x27;d like to hear from people who work with documents, PDFs, signing, archives, or document integrity. I&#x27;m particularly interested to hear about unnecessary friction in the approach and situations where it doesn&#x27;t make sense.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49547137)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T07:53:39Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
