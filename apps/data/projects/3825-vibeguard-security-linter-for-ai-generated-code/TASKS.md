---
id: "3825"
slug: vibeguard-security-linter-for-ai-generated-code
title: VibeGuard – security linter for AI-generated code
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494097"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Tree-sitter AST parsing, security rule engine, hardcoded secret detection, SQL injection and JWT rule set, zero-config CLI, A-F grade reporter]
---
# VibeGuard – security linter for AI-generated code

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the named rules (SQL injection, hardcoded secrets, JWT bypass, 15+ more) and the A-F grade
- [x] Write SPEC.md (this document)
- [x] Scaffold the CLI with a tree-sitter parser for the first language
- [x] Implement the SQL injection and hardcoded secret rules as working checks

## Phase 1: Core

- [ ] Add the JWT bypass rule and the rest of the 15+ rule pack
- [ ] Build the A-F grader that maps finding severity to a letter grade
- [ ] Make the tool truly zero-config: run on a directory, print findings and grade
- [ ] Add a CI-friendly exit code and output format for review workflows
- [ ] Build a corpus of AI-generated vulnerable snippets as regression tests

## Phase 2: Deploy

- [ ] Publish the linter and its rule documentation
- [ ] Invite developers to run it on real AI-generated code and report false positives
- [ ] Decide the coverage roadmap: languages, frameworks, IDE integrations

---

_Generated automatically by Lúa on 2026-08-30_
