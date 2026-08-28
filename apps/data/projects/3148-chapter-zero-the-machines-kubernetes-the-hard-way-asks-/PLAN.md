---
id: "3148"
slug: chapter-zero-the-machines-kubernetes-the-hard-way-asks-
title: Chapter Zero – the machines Kubernetes The Hard Way asks you to bring
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447993"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Chapter Zero – the machines Kubernetes The Hard Way asks you to bring

## Tech Stack

Declarative infrastructure code plus a thin CLI wrapper, so the machine set is described once and can be created and destroyed reproducibly against a chosen target. The whole value is that the environment is identical to what the tutorial assumes.

## Architecture

A machine specification derived from the tutorial's prerequisites, an infrastructure module that realises it on the selected target, and a wrapper providing up, status, and down. Destroy is treated as a first-class command, not an afterthought, because the artefact is a disposable lab.

## Milestones

1. Machine spec matching the tutorial's stated prerequisites
2. Provision on one target with a single command
3. Destroy command plus a cost warning before create
4. Public repo with the tutorial revision it tracks

## Risks

- Cloud provisioning costs money and a forgotten lab keeps costing it
- The tutorial's prerequisites drift; the tool has to be pinned to a revision
- Networking assumptions differ between local virtualisation and cloud targets
