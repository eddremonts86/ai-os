# SPEC.md — Terraplane: webhook-based Terraform PRs with runners in your network

## Problem

Terraplane lets you run Terraform from GitHub PRs against private networks without punching holes in firewalls.<p>I built Terraplane after running in to the same problem for years:<p>1: I don&#x27;t want the IaC pipeline to die when the server it&#x27;s running on does. An all-in-one box is a single point of failure.
2: I don&#x27;t want to bend my network around the tools I use. I&#x27;d prefer not to punch holes in firewalls or peer networks just so automation can reach what it&#x27;s managing
3: Cross-account IAM&#x2F;SA assumption isn&#x27;t the same as direct network access<p>A runner with cloud credentials can call a lot of APIs for sure. However many TF providers require direct access to the resource they&#x27;re managing and role assumption often doesn&#x27;t cut it.<p>Terraplane is designed to address this.<p>An orchestrator component runs somewhere you&#x27;re happy for public traffic to reach. Webhooks hit the runner and it queues jobs for execution.<p>Agents run inside your network and pull jobs from the orchestrator. They run TF plan&#x2F;apply locally, and return the output to the orchestrator.<p>Credentials for private services stay in the network they belong to.<p>Terraplane is roughly designed to be ready to write integrations for SCM providers other than GitHub. I haven&#x27;t done it yet, but it should be fairly trivial.<p>This is an early alpha. I use it for my org&#x27;s IaC pipeline and I&#x27;ve been happy with the results. I&#x27;m open to any and all feedback.<p>I built this for me, I hope it works for you.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49532920)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T07:25:57Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
