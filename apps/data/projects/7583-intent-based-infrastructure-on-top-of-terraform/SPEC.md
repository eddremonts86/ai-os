# SPEC.md — Intent Based Infrastructure on Top of Terraform

## Problem

Hey everyone! I built a platform that works on top of Terraform to expose high level constructs you want to create in your infrastructure (intent) rather than actually dealing with cloud resources (typical terraform modules).<p>I am looking for other enthusiasts to work on this project, and gather feedback.<p>The problem I am trying to solve is complexity. Typically you make infra by either asking AI, or dealing with very low level resources that other people on your team might not fully understand. If you expose a higher level construct, people will only typically deal with a well understood graph of intent which is much easier to understand and reason about, without worrying about low level resources.<p>It works by declaring a model graph that consists of simple nodes like App, Region, Environment, Service, Server, etc that you show your intent with. E.g. My infrastructure consists of 3 AWS accounts (QA, Staging, Prod), with 2 Regions in each, and 1 Environment, under which my Service X resides.<p>The Octo library then converts those intent to actual cloud resources using your instructions. E.g. it would convert a Region node into a vpc + internet-gateway. Or an Environment into an ECS Cluster.<p>It will also generate the Terraform code for each of these cloud resources that your intent wanted.
You can then run this Terraform code normally and get your infrastructure.<p>There is a lot more depth, features, and roadmap items to this.
Happy to go in more detail.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49740408)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T13:23:06Z

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
