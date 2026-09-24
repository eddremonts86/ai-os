# SPEC.md — Dbmask – Discover, mask, and verify sensitive data in SQL databases

## Problem

Hi HN<p>I developed *dbmask*, an open-source Python tool designed to discover sensitive columns in SQL databases, masking them with deterministic fake values, and validate the masking results.<p>The motivation behind this tool stems from a common issue I encountered when handling test data: existing masking tools often assume the user already knows exactly which columns contain sensitive information. Furthermore, the successful completion of a masking task does not guarantee that <i>all</i> sensitive values   have actually been replaced.<p>dbmask aims to integrate these steps into a unified workflow rather than treating them as three separate tasks.<p>During the detection phase, the tool makes determinations by combining column names, sampled values, database type&#x2F;context, historical decisions, and optionally LLMs. While LLM functionality is disabled by default, it supports local execution via Ollama or other services compatible with the OpenAI API. If the tool cannot determine a column&#x27;s nature with confidence, it marks it as `UNKNOWN` rather than simply classifying uncertain cases as &quot;non-sensitive.&quot;<p>I also wanted to incorporate human decision-making into the system. Detection results can be exported for manual review, and confirmed decisions can be saved in CSV, XLSX, or Markdown formats, or stored in a SQL history decision table. The system logs information about both the analyst and the reviewer and re-evaluates past decisions if column types change or review results expire.<p>The masking process employs deterministic mapping, ensuring that identical original values   consistently map to the same synthetic values   across different tables. Once masking is complete, the `dbmask validate --strict` command compares the masked copy with the original data, checking row counts and table structures, and verifying sensitive values   row-by-row using primary keys wherever possible.<p>The project is currently in its early stages (version 0.1.x). The current CI (Continuous Integration) pipeline covers SQLite testing; integration tests for PostgreSQL and MySQL, as well as public detection benchmarks, are included in the future development roadmap.<p>I would particularly appreciate feedback on the detection rules, the manual review&#x2F;history tracking workflows, and the verification methods. Please let me know if you encounter any usability issues or potential security risks while testing on the temporary database.<p>Install:<p>pip install dbmask

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49645189)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T15:15:16Z

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
