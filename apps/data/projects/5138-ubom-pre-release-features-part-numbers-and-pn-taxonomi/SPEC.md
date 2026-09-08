---
id: "5138"
slug: ubom-pre-release-features-part-numbers-and-pn-taxonomi
title: UBOM pre-release features part numbers and pn taxonomies
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49567993"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# UBOM pre-release features part numbers and pn taxonomies

## Problem

Previous posts:- https://news.ycombinator.com/item?id=49293169
- https://news.ycombinator.com/item?id=49413449I would have posted over this previous weekend, but I ran afoul of a mismatch between how the UI works and how the underlying abstractions lace together. Specifically, I was struggling with the UI for editing taxonomies and how to fit the idea of a 'sequence definition' into that UI.This has been cleaned up substantially.I'm considering spinning up a live instance if there is interest.---This release contains (relatively) complete UI for sequence definition and taxonomy authoring, as well as preliminary UI stubbed in for adding new part numbers.The workflow goes something like this:When first spinning up UBOM, an engineer (preferably someone who knows the org's quality system) will determine the valid grammar for their part number schema. A grammar here is essentially the same as a programming language; what characters/tokens are allowed in a given segment.Then, from the grammar we scaffold the taxonomy. This just means we given meaning to the various segments of the sequence definition. For example, we may have a segment in our sequence definition that is something like [0..99]{padding: 2, char: 0} (two characters, a range from 0 to 99, padded by one character specified as 0). When we add our taxonomy, we can add a category "blue things", and a rule on that category of "match 0..25". Any new part number created with a value between 0 and 25 will automatically get put into the "blue stuff" category.Once we have a taxonomy, it gets attached to a new part number schema. The sequence definition + taxonomy IS a part number schema, but it could also be other things, so we make this relationship deliberate.Now you can start adding part numbers. :D Part numbers are guaranteed to be unique across all schemas, and are validated against their underlying taxonomy and sequence definition.One of the useful things about this setup is that you don't have to pick a new part number at random (or guess that it might be right). Instead, you can say something like 'create new part number in this taxonomy category', and the next available part number will be allocated once your part number draft has been released.---Next up (I think) is some dev-in-prod testing. I've got a fair amount of QA work to do before I'm comfortable moving onto the next pre-release. I'll be using this to create a part catalog for several products, nailing the bugs, and trying to smooth out the rough spots.Thanks for taking a look! I'd love to hear your thoughts.God bless.

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
