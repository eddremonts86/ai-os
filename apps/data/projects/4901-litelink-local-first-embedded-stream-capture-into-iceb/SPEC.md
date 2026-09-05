# SPEC.md — Litelink – local-first, embedded stream capture into Iceberg tables

## Problem

Hi HN! I just wanted to share litelink a local-first, embedded capture library I built in python (code is heavily AI generated but designed and reviewed by yours truly). I&#x27;ve been using this for point-and-shoot WebSocket capture but I imagine it could also be useful for observability&#x2F;metrics ingestion as well. Litelink supports a single writer per stream.<p>I&#x27;ve been doing a lot of development and deployments on tiny VMs (2 vCPU, 8GB, 50-100GB disk) and didn&#x27;t want the complexity or cost of managing central brokers (Kafka), databases (Postgres), and CDC&#x2F;connectors just to get queryable WebSocket stream capture running.<p>With litelink, you configure a log in code, and end-to-end setup takes &lt;5 minutes (see the example scripts in the repo). The log is itself an Iceberg table (actually two: a local and archive table), so there&#x27;s no second copy of your data to keep in sync or connector to manage.<p>I&#x27;m sure there are still bugs, but I recently migrated all the capture feeds for a personal research project to litelink, and the experience has been night and day. Before that, I&#x27;d hand-rolled a capture system and was dealing with all the issues you&#x27;d expect (e.g. small file problem). I&#x27;ll post some before&#x2F;after stats in a comment below.<p>I tried to channel the same ethos as LanceDB&#x2F;Iceberg&#x2F;SQLite. Everything runs local first without a network connection required. I&#x27;ve tried to abstract the complexity of stream&#x2F;data lifecycle maintenance away behind a few public library methods. Hopefully someone else finds this useful! Let me know what you think.<p>repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink</a><p>spec: <a href="https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink&#x2F;blob&#x2F;main&#x2F;docs&#x2F;SPEC.md" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink&#x2F;blob&#x2F;main&#x2F;docs&#x2F;SPEC.md</a><p>pypi: `pip install litelink`

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49549760)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T13:36:00Z

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
