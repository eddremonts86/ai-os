# SPEC.md — Revliu – Multi-touch attribution from acquisition to revenue

## Problem

I’m a founder and I just built RevliI’m a founder and I just built Revliu.<p>After building several products, I always wanted to understand how my customers were actually finding me. Which campaign brought them in, which source they came from, and what their full journey looked like.<p>There are already tools for this, but one problem I kept running into is that they often stop at first touch or last touch.<p>That’s why I built Revliu around multi-touch attribution and the full customer journey.<p>As soon as someone lands on your website, Revliu gives them an anonymous ID and starts tracking their journey. Once they sign up, that journey can be connected to the actual customer.<p>From there, you can see if they’re on a trial, how often they come back, how many sessions they open, and eventually when they pay.<p>For me, this also makes it easier to talk to that user and understand why they decided to move forward at that specific moment.<p>Today, Revliu tracks acquisition sources, returning visitors, sessions, touchpoints, and revenue.<p>Instead of just knowing that a campaign got a certain number of impressions, I want to know how much money it actually brought in. Impressions are not really what I care about.<p>The app itself is pretty simple.<p>The main page gives you an overview of revenue by source.<p>Traffic shows visitors, their journey, and their sessions.<p>Campaigns shows the acquisition funnel. For a SaaS, that can be visitor → lead → trial → paying customer. For an online store, it can simply be acquisition → purchase.<p>Customers lets you look at each customer individually, see their touchpoints, where they came from, their journey, and when they bought.<p>The technical side is simple in principle.<p>It starts with an anonymous visitor who gets an ID. We keep track of their visits and touchpoints. When they sign up, that anonymous journey is connected to the customer.<p>Stripe is connected as well, so when the customer pays, the revenue can be linked back to the same journey.<p>The goal is basically to connect acquisition → visits → signup → customer → revenue.<p>Right now, the app is still in its first phase. I haven’t built all the integrations I want yet.<p>What I want to build next is something that does more than just show data.<p>If someone leaves their email but never finishes signing up, comes back several times without buying, or shows real interest without converting, I want to use that information to try to recover that potential customer.<p>The idea would be to reach them again by email or, depending on the integrations, through other channels like LinkedIn.<p>That’s why I still see the app as limited today. I first want to test this attribution part and see if there’s real traction around the problem before building everything else.<p>The part I’m really interested in for the future is revenue recovery.<p>By combining it with AI, the goal would be to adapt to different customers, understand which ones are hesitating, and do more than just display data.<p>I want the data to actually do something inside the product.<p>And I’d really like to know how you’re handling this today.<p>Coding has become much easier than it used to be, but the difference between a good product that sells and a good product nobody uses often comes down to marketing and distribution.<p>I’d really like your feedback on Revliu, the way I’m approaching the problem, and what you would do differently.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49625804)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T12:57:33Z

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
