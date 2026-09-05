---
id: "4654"
slug: terraplane-webhook-based-terraform-prs-with-runners-in-
title: "Terraplane: webhook-based Terraform PRs with runners in your network"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49532920"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Terraplane: webhook-based Terraform PRs with runners in your network

## Problem

Terraplane lets you run Terraform from GitHub PRs against private networks without punching holes in firewalls.I built Terraplane after running in to the same problem for years:1: I don't want the IaC pipeline to die when the server it's running on does. An all-in-one box is a single point of failure.
2: I don't want to bend my network around the tools I use. I'd prefer not to punch holes in firewalls or peer networks just so automation can reach what it's managing
3: Cross-account IAM/SA assumption isn't the same as direct network accessA runner with cloud credentials can call a lot of APIs for sure. However many TF providers require direct access to the resource they're managing and role assumption often doesn't cut it.Terraplane is designed to address this.An orchestrator component runs somewhere you're happy for public traffic to reach. Webhooks hit the runner and it queues jobs for execution.Agents run inside your network and pull jobs from the orchestrator. They run TF plan/apply locally, and return the output to the orchestrator.Credentials for private services stay in the network they belong to.Terraplane is roughly designed to be ready to write integrations for SCM providers other than GitHub. I haven't done it yet, but it should be fairly trivial.This is an early alpha. I use it for my org's IaC pipeline and I've been happy with the results. I'm open to any and all feedback.I built this for me, I hope it works for you.

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
