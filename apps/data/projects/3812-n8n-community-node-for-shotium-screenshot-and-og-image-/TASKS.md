---
id: "3812"
slug: n8n-community-node-for-shotium-screenshot-and-og-image-
title: N8n community node for Shotium – screenshot and OG image API
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495905"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [n8n community node, TypeScript, Shotium REST API, headless browser rendering, OG image templates, n8n credential framework]
---
# N8n community node for Shotium – screenshot and OG image API

## Phase 0: Scaffold

- [x] Read the Show HN post and the linked repository README to extract operations and the credential flow
- [x] Write SPEC.md (this document)
- [x] Scaffold the n8n community-node package with the nodes/Shotium layout
- [x] Create a Shotium test account with free render credits for integration testing

## Phase 1: Core

- [ ] Implement Take Screenshot with binary data output
- [ ] Implement Generate OG Image from typed templates
- [ ] Implement Generate Signed URL returning JSON with a url field
- [ ] Wire the declarative credential with GET /v1/me validation
- [ ] Handle 429 quota_exceeded explicitly and document success-only billing

## Phase 2: Deploy

- [ ] Submit for n8n community-node verification and fix review findings
- [ ] Publish to npm with release notes matching the repo's changelog conventions
- [ ] After verification, coordinate the Google sign-in and blog announcement in the main Shotium repo
