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

## Problem

The poster open-sourced Chapter Zero (github.com/cyb3ralbert/chapter-zero), a tool that helps you provision the machines that 'Kubernetes The Hard Way' asks you to bring. The HN post body gives no further detail beyond the repo.

## Objective

Pre-provision the machines the reader is expected to bring to Kubernetes The Hard Way, so the first chapter is one command, not a multi-hour setup.

## Target Users

Self-taught operators going through Kelsey Hightower's 'Kubernetes The Hard Way' tutorial who already stumble at the prerequisite machine setup.

## MVP Scope

Open-source tool that creates N VMs (locally or on a cloud) pre-configured with the OS and network Kubernetes The Hard Way assumes.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Default cloud choice and region; cost if users pick cloud by default without realising.
