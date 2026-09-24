# SPEC.md — QuantSupport, a Rust-based quant library

## Problem

Hi,<p>I wanted to share a project I&#x27;ve building for a while. QuantSupport is a quant library that comtemplates curve construction, simulation and risk analytics for a different asset classes (equity, rates, fx, FI).<p><a href="https:&#x2F;&#x2F;github.com&#x2F;jmelo11&#x2F;quantsupport" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;jmelo11&#x2F;quantsupport</a><p>It&#x27;s goal is to be a realistic production tool for financial institutions, instead of being another analytics library as many other tools are. For this, it leverages automatic differentiation from the ground up to obtain risk functionalities (sensitivites), essential for real trading setups.<p>The library features other engines, like and XVA engine and a scripting language for structuring more complex payoff structures.<p>Also, its available an example in the following repo:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;jmelo11&#x2F;derivative_structuring" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;jmelo11&#x2F;derivative_structuring</a><p>where LLMs leverage the scripting functionalities of the library to provide pricing and insights to user prompted requests, allowing model-consitent results and showing the flexibility of the library.<p>I like to think that is reaching a more mature state, but to know for sure, it would be very helpful to get feedback from people from the quant space. Any feedback is highly appreciated.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49709680)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T08:57:27Z

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
