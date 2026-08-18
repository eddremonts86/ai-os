---
id: "2974"
slug: an-open-protocol-for-knowledgememory-management
title: An Open Protocol for Knowledge/Memory Management
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337475"
category: ask-hn
date: "2026-08-17"
tags: [Ask HN, Problem]
---
# An Open Protocol for Knowledge/Memory Management

## Problem

Recently, I got to thinking about what it might look like to open-source the core fundamentals of my AllSign project. As I fell further and further down that conceptual rabbit hole, it occurred to me that those core fundamentals are actually a really good solution to a problem I saw with agent memory.I read this paper called "Filesystem-Based Memory for LLM Agents", https://arxiv.org/pdf/2607.26637, which concluded (rightfully so) that "information gathering and organization does not automatically get you intelligence". I agree.I thought to myself, what's missing is "curation". Something has to decide what's worth keeping, what replaces what, what's true, and what quietly stopped being true.Knowledge/memory management that supports HITL and HOTL.Then I thought, what if those AllSign core fundamentals could be turned into an open protocol for actor-agnostic knowledge management?That led me to create the Facts protocol and Fact CLI.If you're curious, you can read more here: https://gist.github.com/iamalnewkirk/22ae2d8c8cc1b8790236da9edf2f7b73- https://github.com/facts-kms/cli
- https://github.com/facts-kms/spec

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
