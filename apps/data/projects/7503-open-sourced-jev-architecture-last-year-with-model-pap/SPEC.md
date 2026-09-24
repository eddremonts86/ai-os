# SPEC.md — Open-sourced jev architecture last year with model,paper and dataset

## Problem

Everyone now talks about the architecture  that&#x27;s not auto regressive and does lightning fast probability prediction with a json schema. I worked on this literally one year back in March 2025, published an arxiv paper, pushed the model to huggingface along with the pypi package and training dataset. And then one year later, a frontier lab came, proposing the same idea like literal breakthrough without technical papers, open weights and  no open dataset.  For anyones information the main guiding model is RL not embedding model or LLM<p>Paper: https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2503.23303<p>Model: https:&#x2F;&#x2F;huggingface.co&#x2F;DeepMostInnovations&#x2F;sales-conversion-model-reinf-learning<p>Dataset: https:&#x2F;&#x2F;huggingface.co&#x2F;datasets&#x2F;DeepMostInnovations&#x2F;saas-sales-conversations<p>Also the second work published in September 2025 was exactly the same one jev proposed now<p>Paper: https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2510.01237<p>My model uses PPO over sequence embeddings to output turn-by-turn conversion trajectories (probabilities from 0.0 to 1.0).<p>Jev uses parallel sampling (trained via RLCD) to output confidence distributions and schema choices.<p>It&#x27;s incredibly frustrating that the thing that you made with months of hard work, sweat and sleepless night is architecturally similar with the vertical use case and don&#x27;t get the support you deserve because frontier lab build something horizontal. The open-source story in general

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49736660)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-17T05:13:00Z

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
