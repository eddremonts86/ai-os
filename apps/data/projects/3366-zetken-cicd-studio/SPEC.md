---
id: "3366"
slug: zetken-cicd-studio
title: Zetken CI/CD Studio
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49459591"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
country: Local pipeline execution
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Zetken CI/CD Studio

## Problem

Hello everyone,
Please let me introduce the system, it's called Zetken CI/CD Studio.
This is local CI/CD system to create and run pipelines on your computer. The system works on Windows, Linux and macOS.
This is a standalone binary file with no CI server to configure, just download, run and open in browser. You can also migrate your existing pipelines from GitHub Actions, Azure DevOps and Jenkins.
It would be awesome if you could check it and give me some feedback.Zetken currently provides these features:
Local pipeline execution
Native Zetken YAML
Pipeline validation
Run history and detailed logs
Artifacts
Build-linked source snapshots and comparison
Runtime parameters
Environment variables and environment files
Secret masking
Job dependencies with needs
Parallel jobs
Matrix jobs
Cache restore/save
hashFiles()
Artifact downloads between dependent jobs
Docker image build steps
Migration Assistant for supported GitHub Actions, Azure DevOps, and Jenkins Declarative pipelines
Zetken currently executes pipeline commands on the same machine where zci is running. There are no remote Zetken runner pools yet.

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
