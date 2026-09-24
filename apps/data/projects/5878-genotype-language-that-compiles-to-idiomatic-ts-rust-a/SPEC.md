# SPEC.md — Genotype: language that compiles to idiomatic TS, Rust and Python

## Problem

Hey HN! I just shipped the first public version of a new programming language that I have worked on for the past two years.<p>Its goal is to help synchronize types between TS, Rust, and Python (more to come). Two main use cases are the API client libraries and client-server interop, i.e., a TS web app talking to a Rust server.<p>I focused on making it as flexible as possible but always produced idiomatic types that look and feel like they were carefully crafted by humans. It was a challenge, e.g., I had to test 7 Python versions for every language feature or had to implement Rust literals runtime.<p>It&#x27;s written in Rust, btw ;-)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49617861)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T22:09:04Z

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
