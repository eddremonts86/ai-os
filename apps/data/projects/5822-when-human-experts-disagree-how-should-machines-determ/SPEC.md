# SPEC.md — When human experts disagree, how should machines determine truth?

## Problem

This question matters as fully automated or AI-assisted scientific loops become common.<p>For example, MDA-MB-435 was a cell line used to study breast cancer for decades, but its origin was disputed for years and eventually confirmed as melanoma.<p>Another open question, one layer above experiments: what is the greatest barrier to curing cancer?<p>Is it disease understanding? [0]<p>Or regulatory reform of clinical trials? [1]<p>Or clinical trial scarcity? [2]<p>Or science upstream of clinical trials, and other factors? [3, 4]<p>Many experts disagree.<p>If machines allocated resources and set priorities, how should they decide what is right?<p>If you want to dive into the challenges of curing cancer, I recommend reading all five sources, starting with [1]. It&#x27;s a New York Times essay with insightful quotes from leading oncologists and vivid patient stories. Beautifully written, the piece captures why regulatory reform is critical and long overdue.<p>More importantly, experts are actively debating the essay on X and may answer your questions.<p>I intertwined ML with cancer research because both share surprising parallels. A simple one is that many ideas sound compelling in theory but die in reality. In cancer, findings may not translate to patients while ML methods may not transfer across models.<p>Cancer is a systemic problem, and HN attracts some of the best systems thinkers.<p>Hope this post sparks curiosity.<p>---<p>0. https:&#x2F;&#x2F;deepphenotype.substack.com&#x2F;p&#x2F;drug-discovery-has-no-magic-wands<p>1. https:&#x2F;&#x2F;www.nytimes.com&#x2F;2026&#x2F;09&#x2F;04&#x2F;opinion&#x2F;clinical-trials-drugs-science.html<p>2. https:&#x2F;&#x2F;x.com&#x2F;davidycli&#x2F;status&#x2F;2096315300841214423<p>3. https:&#x2F;&#x2F;www.drvinayprasad.com&#x2F;p&#x2F;why-dont-we-have-more-cancer-cures<p>4. https:&#x2F;&#x2F;x.com&#x2F;LocasaleLab&#x2F;status&#x2F;2096353702684807416

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49615925)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-08T19:47:06Z

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
