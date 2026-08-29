---
id: "868"
slug: search-for-an-ai-tool-to-create-high-quality-and-natura
title: Search for an AI tool to create high-quality and natural-looking animation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/8p64cdskm1-search-for-an-ai-tool-to-create-high-qua"
category: ai
date: "2025-10-29"
tags: [AI, Media, Design]
country: India
tech: [Python, FastAPI, PyTorch, ComfyUI, Celery, Redis, Next.js, S3-compatible object storage]
---
# Search for an AI tool to create high-quality and natural-looking animation

## Tech Stack

- **Python with FastAPI** for the service layer, because the pipeline is dominated by Python ecosystem work — PyTorch, model loading, image and tensor handling — and FastAPI keeps the surface small while exposing an async API the worker fleet can call.
- **PyTorch** as the model runtime, because the available animation and video diffusion models ship in PyTorch and reimplementing that stack is not in scope.
- **ComfyUI** as the graph-based inference layer where it fits, because several of the relevant checkpoints ship ComfyUI workflows and a model-agnostic queue that can load those graphs saves the operator from rewriting them.
- **Celery with Redis as the broker** for the render queue, because the render is long-running, must survive worker restarts, and needs a queue the operator can inspect and re-prioritise.
- **Redis** as the broker and as a small cache for run metadata and parameter diffs, since it is already on the path and avoids a second piece of infrastructure.
- **Next.js** for the operator review surface, because the review loop is a heavy client-side experience — video playback, parameter forms, side-by-side diffs — and the operator is comfortable with a browser.
- **S3-compatible object storage** for rendered frames and intermediate tensors, kept outside the database so a render can be re-edited at a different parameter without re-running the model.

## Architecture

The operator submits a prompt and a reference through the Next.js review surface. The submission lands as a render job in the Celery queue with a unique run id, the prompt text, the reference path, the chosen parameters and the seed. A worker picks the job up, checks the GPU memory budget against the requested render size, and refuses the job rather than crash if the budget is exceeded.

The render itself runs through PyTorch and, where the chosen checkpoint ships a ComfyUI workflow, through ComfyUI's graph executor. Each render writes its frames to object storage with the run id as the key, so a later re-edit at a different parameter can reuse the cached frames where they are still valid. The model's intermediates are written to a per-run scratch path the worker owns, and that path is deleted when the run completes and the frames are uploaded.

The review surface reads the run metadata from Redis and the frames from object storage. Every render carries its seed, its sampler, its checkpoint version and its parameters in the metadata, so a replay submits the same job to the queue and produces a clip within a documented tolerance. The parameter-diff view compares the latest render against the previous one for the same prompt, so the operator can see what changed without keeping a separate log.

Worker scaling is horizontal: each GPU machine runs one or more Celery workers, and the queue is shared across machines through Redis. The deployment starts on a single box, and the second box is added only when the first is consistently busy. There is no multi-tenant scheduler in the MVP; the operator owns the box and the workers.

## Milestones

1. **M1 — Render skeleton** — prompt-and-reference intake, a single Celery worker that loads one model checkpoint and renders one clip, and the run metadata recorded to Redis.
2. **M2 — Queue and budget** — Celery queue with GPU memory check before dispatch, a refused-rather-than-crashed contract for oversized requests, and Redis-backed run history.
3. **M3 — Object storage** — frames and intermediate tensors written to S3-compatible storage with the run id as the key, and the per-run scratch path cleaned up after upload.
4. **M4 — Review surface** — Next.js page for the clip browser, the prompt form, the parameter form and the parameter-diff view.
5. **M5 — Replay** — a replay action that resubmits the same prompt, parameters and seed, with a documented tolerance for what counts as a match.
6. **M6 — Multi-worker** — a second worker on a second box sharing the same Redis queue, with the operator able to see per-worker utilisation.

## Risks

- **GPU out of memory** — the scheduler must check fit before dispatch, because a worker that crashes mid-clip loses the run and the frames the operator cared about.
- **Model drift** — swapping the underlying checkpoint changes the look of every output, so the metadata must record the exact checkpoint version that produced each render.
- **Reproducibility illusion** — non-deterministic samplers and floating-point order matter; a replay that produces a visibly different clip is a feature that has stopped working.
- **Queue starvation** — a single long render blocks every later render on the same worker, so the design must either support concurrent workers or refuse long renders gracefully.
- **Reference ambiguity** — a reference that does not match the prompt is a render the operator will discard, and the surface must let the operator swap the reference without redoing the whole intake.
- **Object-storage lock-in** — S3-compatible storage is portable, but a feature that depends on a specific provider's signed-URL behaviour is not, so the design must keep the storage layer behind an interface.
