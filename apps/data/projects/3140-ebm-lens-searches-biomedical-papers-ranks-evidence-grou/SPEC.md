---
id: "3140"
slug: ebm-lens-searches-biomedical-papers-ranks-evidence-grou
title: "EBM Lens, searches biomedical papers, ranks evidence, grounds claims"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448826"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# EBM Lens, searches biomedical papers, ranks evidence, grounds claims

## Problem

The poster open-sourced EBM Lens (github.com/mauroforlin/ebm-lens), a tool that searches biomedical papers, ranks evidence, and grounds each claim back to a source. The HN post body gives no further detail.

## Objective

Search biomedical papers, rank the evidence, and tie every claim back to the paper it came from.

## Target Users

Clinicians, medical researchers, and evidence-based-medicine students who want an answer with its source attached.

## MVP Scope

Open-source app that queries PubMed (or equivalent), ranks hits, and grounds each answer sentence to the source paper.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Quality of ranking depends on the underlying search and ranking heuristic.
