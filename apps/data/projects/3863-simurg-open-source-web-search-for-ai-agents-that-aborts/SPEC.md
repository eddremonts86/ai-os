---
id: "3863"
slug: simurg-open-source-web-search-for-ai-agents-that-aborts
title: Simurg open-source web search for AI agents that aborts hallucinations
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500488"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Open-source search backend, Agent tool-call API, Grounded answer retrieval, Hallucination abort logic, Self-hostable service, Web index querying]
---
# Simurg open-source web search for AI agents that aborts hallucinations

## Problem

This Show HN capture is a bare link to github.com/doofzoff/SIMURG with no body text, so the product claim is carried entirely by the submission title: "Simurg open-source web search for AI agents that aborts hallucinations". The claim is that Simurg is an open-source web-search layer for AI agents whose job is to cut off hallucinated answers by grounding them in real web results. Nothing else about the project — implementation language, API shape, index coverage or hosting model — is stated in the capture, so this plan describes the claim as captured, not verified behavior.

## Objective

Build the product the title claims: an open-source web search for AI agents whose core behavior is aborting hallucinations. The MVP is a search endpoint an agent can call, a grounding path that turns results into answer context, and an explicit refusal when no retrieved result supports the answer.

## Target Users

- Agent builders who need a web-search tool their agents can call.
- Self-hosters who want an open-source alternative to hosted search APIs.
- Teams whose agent outputs must be grounded in retrievable sources rather than model memory.

## MVP Scope

- A web search endpoint usable from a single agent tool call.
- Result ingestion that turns search hits into grounded answer context.
- An abort path: no grounded evidence means an explicit refusal, not a guess.
- Open-source distribution with self-hosting instructions.

## Constraints

- The capture is title-only: every detail beyond the title's claim is unstated and must not be presented as fact.
- Open source is the stated distribution model.
- "Aborts hallucinations" is a behavioral claim; the MVP must make the abort path explicit and observable, not assumed.

## Design Direction

See `DESIGN.md` for this project's design tokens.
