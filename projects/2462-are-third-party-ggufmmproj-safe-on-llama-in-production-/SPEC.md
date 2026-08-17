---
id: "2462"
slug: are-third-party-ggufmmproj-safe-on-llama-in-production-
title: Are third party gguf/mmproj safe on Llama in production env
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49261767"
category: ask-hn
date: "2026-08-11"
tags: [Ask HN, Problem]
---
# Are third party gguf/mmproj safe on Llama in production env

## Problem

So i had been building a side project screenmind ,sort of local ai desktop assistant, and hit a confusing multimodel failure...texts worked,but vision and image failed no crash just returning . i narrowed it down to unsloths gemma 4 gguf +mmproj broke on llama(atleast thats my hypothesis , feel free to correct me) b10244, and the fix was to just switch to ggml.So is pinning the tested llama build the only option or how do people using llama on production handle this

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
