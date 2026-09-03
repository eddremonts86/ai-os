# SPEC.md — Will your money last? AI-assisted financial simulator

## Problem

Hey all - I&#x27;ve been working on a financial simulator for more years than I can remember. I never felt like I got it right so they always ended up as half-made apps and scripts on my desktop.<p>After years of iterations I feel like I made a breakthrough. Here&#x27;s what led me to build Futurez:<p>Simple calculators let you quickly test ideas and help with questions like &quot;am I on the right track?&quot; It&#x27;s pretty obvious how they fall flat from modeling actual reality though. (you can&#x27;t have different accounts grow at different rates, model expenses with an end-date like a 30-yr mortgage, etc.)<p>Big fat spreadsheets were my next step. I could update balances over time and put income&#x2F;expenses on a schedule. I found that the more complicated it got, the harder it was to verify accuracy. I also realized that if I didn&#x27;t model the US tax system I would be missing critical opportunities that would ultimately make my estimates too rough to be a plan.<p>This year I got more serious about my family&#x27;s own financial planning and also started to take on my aging parents&#x27; situation. I used those real-world scenarios to help me build a new simulator from scratch. It handles taxes, custom logic, easy ways to model accounts&#x2F;income&#x2F;expenses, charts, a spreadsheet view, and most awesomely, first-class AI support including an MCP server so you can run all sorts of experiments and get personalized analysis of any situation. It&#x27;s privacy-minded (no connection to your accounts and anonymous to start) and I&#x27;ve intentionally made it lean slightly conservative.<p>I&#x27;m desperate for feedback so I can help more people and make this awesome.<p>Happy to answer anything, including the parts that aren&#x27;t good yet. Very interested to hear how it does with your scenarios!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49522623)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T14:38:01Z

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
