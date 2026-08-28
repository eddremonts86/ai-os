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

## Problem

The poster shipped Routebase at routebase.dev, a tool where one OpenAPI spec drives documentation, mocks, tests, and monitors. The HN post body gives no further detail beyond the link.

## Objective

Drive docs, mocks, contract tests, and uptime monitors from a single OpenAPI spec for a service.

## Target Users

Backend teams who maintain an OpenAPI spec and are tired of duplicating it across four or five other tools.

## MVP Scope

Web app that takes an OpenAPI document and produces: rendered docs, a mock server, contract-test runner, and synthetic monitor.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Custom extensions in OpenAPI documents may not round-trip cleanly.
