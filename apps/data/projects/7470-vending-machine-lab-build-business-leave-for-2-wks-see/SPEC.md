# SPEC.md — Vending Machine Lab – Build business, leave for 2 wks, see what breaks

## Problem

I spent a while exploring whether AI could help build businesses that operate with little ongoing owner involvement. This was inspired in part by Andon Labs’ Vending-Bench work on AI agents running simulated businesses. Their Project Vend collaboration with Anthropic takes that question into a real shop. (Obviously it was also inspired by &quot;the dream.&quot;)<p>Unfortunately, currently, I think the answer is generally &quot;no.&quot; Vending-Bench shows outcomes relative to a well-defined business environment, while starting businesses isn&#x27;t well-defined and much harder, for us and AI.<p>But one useful result was this browser simulation, which I&#x27;m sharing as a free side project. It basically generalizes the idea behind Vending-Bench itself, but in a simulation that anyone can mess around with, including AI.<p>Choose a digital product, custom digital service, vending machine, or reusable equipment such as a laundromat. Set demand, costs, staffing and rules, then run 14 simulated days without the owner. Inspect unfinished orders, cash, refunds and requests for your help. Change the setup and rerun the same conditions.<p>The model supplies fictional customers and failures. AI help has preset outcomes; no model is called by the site. It&#x27;s a way to explore operating assumptions, not a demand or profit forecast. An optional copy&#x2F;paste workflow lets your own assistant plan decisions with the fictional fortnight known in advance. It is not thinking live between days.<p>I developed it with substantial AI coding assistance, automated checks, AI role-playing of users (occupying user types&#x2F;roles), and feedback from human friends who tried it. It runs in the browser without signup.<p>Repo here: <a href="https:&#x2F;&#x2F;github.com&#x2F;automatedteach&#x2F;vending-machine-lab" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;automatedteach&#x2F;vending-machine-lab</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49733012)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T21:05:48Z

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
