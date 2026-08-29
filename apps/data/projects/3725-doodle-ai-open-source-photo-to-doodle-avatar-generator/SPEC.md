---
id: "3725"
slug: doodle-ai-open-source-photo-to-doodle-avatar-generator
title: "Doodle AI: open-source photo-to-doodle avatar generator"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487781"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Python, diffusion model, image-to-image, FastAPI, web UI]
---
# Doodle AI: open-source photo-to-doodle avatar generator

## Problem

The Show HN post is a short prose body:

> good morning New Doodle project is live -> https://doodleai.art/. I started this project for the Kiro Hackathon and honestly now I just love building this lol. Not sure if I'll get any return from this or not, but still feels worth building instead of just making some random .lol site. Still adding more features, but you can try it now. You'll get some signup credits too. It's open source, so if you like it, please give the repo a star. https://github.com/Type-Think-AI/doodle-ai. any feedback?

Reading the post and the linked project page ([doodleai.art](https://doodleai.art/)), the problem is converting a real photo into a doodle-style avatar. The author describes the project as something they "just love building," is unsure about commercial return, and was originally scoped for the Kiro Hackathon. The repo at [github.com/Type-Think-AI/doodle-ai](https://github.com/Type-Think-AI/doodle-ai) is the open-source surface.

The post does not name the model, the training data, the doodle style, the resolution, or the signup-credit mechanic. The author explicitly says features are still being added.

## Objective

Ship an open-source tool that takes a photo and renders a doodle-style avatar, with a hosted demo at doodleai.art where new signups get a few free credits to try it. The MVP targets the "see a doodle version of yourself, quickly" promise. It does not target enterprise identity pipelines, deepfake-grade photorealism, or a fully self-serve commercial product.

## Target Users

- Hackathon-adjacent builders and indie hackers who want a fun image-to-image toy to play with and fork.
- Curious visitors who land on doodleai.art, sign up to use their free credits, and judge whether the output is worth paying for.
- Open-source contributors who want a small, forkable image-AI codebase with a clear surface.

The post does not name professional designers, marketing teams, or enterprise use; the framing ("any feedback?", "still adding more features") is creator-side.

## MVP Scope

- A web UI at doodleai.art where a user uploads a photo and gets back a doodle-style avatar.
- An open-source codebase at github.com/Type-Think-AI/doodle-ai that documents the model choice, the prompt or conditioning, and the inference path.
- A signup-credit mechanic: new signups get a small number of free generations so they can try before paying.
- The hosted demo runs the inference; self-hosters can run the same code against their own compute.

The MVP does not include a batch product pipeline, a brand-asset manager, or a commercial API tier. The post explicitly says the author is unsure about commercial return.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Open source: the repo is the codebase a curious reader can audit. Inference weights, prompts, and conditioning must live in the repo (or be clearly linked) rather than hidden behind the hosted demo.
- Hackathon origin: the MVP started at the Kiro Hackathon and is still actively being expanded; the MVP scope must be honest about what is shipping vs. "still adding more features."
- Free credits on signup: the signup-credit mechanic is part of the headline experience; the MVP must deliver on it (no bait-and-switch where credits never materialize).
- Honest about quality: the post does not claim photorealism; the MVP should not oversell the output as production-grade brand assets.
- Single-creator scope: the author's tone ("I just love building this") signals a one-person project; the MVP should not assume a team, a sales pipeline, or enterprise support.
