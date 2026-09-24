# SPEC.md — Rayrun – one MCP gateway for the whole company

## Problem

Hey HN,<p>First time building SaaS. Don&#x27;t be too harsh, but I would appreciate your feedback. I have a strong technical background, but never had an opportunity to design as much as a landing page or think about product positioning. If you see something that&#x27;s an obvious gap, please take a second to leave a comment.<p>Now, the product:<p>I use MCPs. I&#x27;ve worked in teams that use MCPs. Regardless of whether you are 1 or many, these are the issues that you will run into:<p>* random API keys in .env files<p>* OAuth credentials that expire<p>* no visibility of which MCPs are used<p>* no controls over what data is being sent to MCPs<p>There are also nice-to-haves that you wish you&#x27;ve had:<p>* hosting&#x2F;sharing private MCP tools<p>* fixing context bloat<p>MCP gateways are designed to solve these problems. However, in my experience, they are expensive and hard to use. Everything that I&#x27;ve tried felt like it was designed by someone who can conceptualize the problem, but hasn&#x27;t experienced it. Whereas I have seen it working for a big team and also trying to setup my own development environment. And that&#x27;s Rayrun – an MCP gateway that solves hosting, data governance, secrets, OAuth rotation, and gives visibility across your organization. It&#x27;s designed to be useful whether you are solo or a 500 people team.<p>I would truly appreciate you giving it a try and ask any questions or share observations.<p>If you are curious about feature parity with the existing MCP gateways, I&#x27;ve made a comparison matrix <a href="https:&#x2F;&#x2F;ray.run&#x2F;compare" rel="nofollow">https:&#x2F;&#x2F;ray.run&#x2F;compare</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49636609)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T00:30:57Z

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
