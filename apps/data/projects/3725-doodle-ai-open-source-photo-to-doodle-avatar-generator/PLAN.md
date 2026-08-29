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

## Tech Stack

- **Model:** a diffusion-based image-to-image model fine-tuned (or LoRA-tuned) to produce a doodle style from a real photo. The base model and the doodle conditioning live in the repo or are clearly linked.
- **Inference runtime:** Python with a standard diffusion framework (the exact choice — diffusers, ComfyUI, or a custom pipeline — is a repo-level decision).
- **Backend:** a small Python web service (FastAPI or Flask) that exposes a generation endpoint to the web UI.
- **Web UI:** a static front end that lets the user upload a photo, shows the signup / credits state, and renders the resulting avatar.
- **Auth and credits:** a signup flow tied to a credit counter; the MVP must store enough state to honor the free-credit promise without pretending credits exist when they don't.
- **Hosted demo:** doodleai.art, run by the author, with the open-source repo at github.com/Type-Think-AI/doodle-ai as the auditable surface.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐    ┌────────────┐
│ Browser    │───▶│ Backend    │───▶│ Diffusion  │───▶│ Doodle     │
│ (upload +  │    │ (Python)   │    │ inference  │    │ avatar     │
│  result)   │    │            │    │ (GPU)      │    │ (returned) │
└────────────┘    └────────────┘    └────────────┘    └────────────┘
                         │
                         ▼
                  ┌────────────┐
                  │ Credits /  │
                  │ signup DB  │
                  └────────────┘
```

The hosted demo is one deployment of the open-source codebase. Self-hosters run the same code against their own compute; the demo and the repo are not separate products.

## Milestones

1. **M0 — Surface agreement.** Lock the base model, the doodle conditioning, the credit mechanic, and the licensing terms for generated avatars. These are repo-level decisions, not product features.
2. **M1 — Working generator.** A photo goes in, a doodle avatar comes out. Backend inference works on the author's GPU.
3. **M2 — Hosted demo + signup credits.** doodleai.art serves the UI, the signup flow, and the credit counter end-to-end.
4. **M3 — Repo hygiene.** README with model card, base-model attribution, license, and a clear "free credits = N generations, here's N" statement.

## Risks

- **Base-model bias and quality.** Image-to-image models inherit the limits and biases of their base; the MVP must state what base is used and not oversell the output.
- **Credit-mechanic honesty.** Free credits are easy to promise and hard to deliver on; the MVP must show the counter and not silently reduce N.
- **Licensing clarity.** The post does not state whether generated avatars are commercial-use; the README must be explicit so users do not assume the wrong default.
- **Single-creator ops.** A one-person project is fragile to absences; the repo's deploy story must be reproducible by a contributor who is not the author.
- **GPU cost.** Inference is GPU-bound; if the hosted demo grows, the author's bill grows with it, and the "unsure about commercial return" framing becomes a real risk.
