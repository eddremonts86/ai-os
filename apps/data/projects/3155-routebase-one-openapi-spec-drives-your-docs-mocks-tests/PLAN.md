---
id: "3155"
slug: routebase-one-openapi-spec-drives-your-docs-mocks-tests
title: "Routebase – One OpenAPI spec drives your docs, mocks, tests, monitors"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447372"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Routebase – One OpenAPI spec drives your docs, mocks, tests, monitors

## Tech Stack

Web app at routebase.dev with a small backend.
OpenAPI parser library (e.g. OpenAPI tools / swagger-parser).
Docs renderer (Redoc or Stoplight Elements); mock server in the same backend.

## Architecture

Single-process deliverable: Web app that takes an OpenAPI document and produces: rendered docs, a mock server, contract-test runner, and synthetic monitor.

## Milestones

MVP at routebase.dev: spec upload, docs + mock + contract tests.

## Risks

Custom extensions in OpenAPI documents may not round-trip cleanly.
