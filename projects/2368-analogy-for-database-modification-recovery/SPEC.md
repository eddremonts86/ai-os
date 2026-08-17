---
id: "2368"
slug: analogy-for-database-modification-recovery
title: Analogy for Database Modification Recovery?
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49295620"
category: ask-hn
date: "2026-08-14"
tags: [Ask HN, Problem]
---
# Analogy for Database Modification Recovery?

## Problem

What is a proper analogy for deferred database modification and immediate database modification recovery?This is what I understand so far about deferred database modification and immediate database modification.In deferred database modification, whatever the transactions wants to execute is written only in log. The log is forwarded to disk, then a commit log record is written to disk as well. The catch is that nothing is applied on disk until everything is committed.In immediate database modification, whatever the transaction wants to execute is written to the log record-->then immediately to the database on disk.My problem is that I cannot imagine the failure scenarios for recovery.I somewhat understand that in deferred database modification, undo will not be required because nothing was written to the disk till commit.Besides that I do not understand anything else.https://dbms-ii.blogspot.com/2010/03/defferred-update-method.html

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
