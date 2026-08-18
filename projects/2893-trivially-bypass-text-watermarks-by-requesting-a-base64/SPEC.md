---
id: "2893"
slug: trivially-bypass-text-watermarks-by-requesting-a-base64
title: Trivially bypass text watermarks by requesting a Base64 response
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49333167"
category: ask-hn
date: "2026-08-17"
tags: [Ask HN, Problem]
---
# Trivially bypass text watermarks by requesting a Base64 response

## Problem

Anthropic plans to release text watermarking based on SynthID, which modulates the PNRG behind the token choosing mechanism deterministically in a way that lets another tool later estimate whether text was written by AI.This is trivial to bypass that, it's current form:
1. Ask for the response/essay/email encoded in base64
2. Decode it using https://www.base64decode.org/While the encoded text will follow the watermarked distribution, the decoded text will not.

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
