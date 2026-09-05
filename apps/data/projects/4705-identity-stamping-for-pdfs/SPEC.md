---
id: "4705"
slug: identity-stamping-for-pdfs
title: Identity Stamping for PDFs
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49547137"
category: ask-hn
date: "2026-09-03"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Identity Stamping for PDFs

## Problem

I built Ordius to solve a problem I couldn't find a clean solution for: establishing a deterministic identity stamp for a PDF document while preserving the document itself.Ordius creates an ID for a PDF and embeds that identity within the document so it can be verified later.
The important constraints for me were that Ordius should not normalize or reconstruct the document, modify its original payload bytes, strip metadata or maintain metadata exclusion logic, require a detached identity file, depend on PKI, and retain the submitted document.I like to think the byte dependency paradox has been resolved by this build, and the result is a small API with Generate and Verify operations.
It's live here: https://ordius.net/home/There are still some questions I am trying to answer: Do cloud storage applications preserve the Ordius Block when a document is uploaded and downloaded? Is the Ordius Block preserved when a stamped PDF is sent as an email attachment? What I have tested: sending an Ordius stamped document as an attachment in Gmail passes with no problems.I'd like to hear from people who work with documents, PDFs, signing, archives, or document integrity. I'm particularly interested to hear about unnecessary friction in the approach and situations where it doesn't make sense.

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
