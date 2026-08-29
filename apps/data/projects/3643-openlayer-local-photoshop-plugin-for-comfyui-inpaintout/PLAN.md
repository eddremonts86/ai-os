---
id: "3643"
slug: openlayer-local-photoshop-plugin-for-comfyui-inpaintout
title: OpenLayer – local Photoshop plugin for ComfyUI (inpaint/outpaint demo)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480266"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Photoshop CEP/UXP Extension (HTML/JS), ComfyUI HTTP API, Python, ComfyUI Server, WebSocket, PNG via Canvas]
---
# OpenLayer – local Photoshop plugin for ComfyUI (inpaint/outpaint demo)

## Tech Stack

- **Photoshop CEP/UXP extension** as the host-side shell, because the title explicitly names a Photoshop plugin and these are the only APIs that let code run inside the Photoshop process.
- **HTML and JavaScript** for the extension's panel UI, since the Photoshop extension model already mandates these.
- **WebSocket client** in the extension to consume ComfyUI's progress stream, so the panel reflects queue and progress in real time.
- **ComfyUI HTTP and WebSocket API** as the only backend the plugin talks to, because the integration's whole point is to drive a workflow the user already runs.
- **Python** for the small server-side helper that ships with the repo, used only to generate the default inpaint and outpaint workflows as JSON the user can edit.
- **PNG via a Canvas** as the transport between Photoshop and ComfyUI, because both sides speak PNG and the mask can be encoded as an alpha channel.
- **No deploy target** — the plugin is distributed as a Photoshop extension package and a workflow file; there is no server to run.

## Architecture

The plugin runs inside Photoshop as an extension. When the user clicks Inpaint, the extension reads the active document's current selection or active layer's mask, encodes the visible pixels and the mask as PNGs, and POSTs them to the configured ComfyUI server's `/prompt` endpoint with the workflow ID and inputs the user has set. The extension then subscribes to the server's WebSocket stream to receive progress and the final image. When the final image arrives, the extension writes its pixels back into the active layer at the document's bit depth.

Outpaint uses the same pipeline with one difference. The extension grows the canvas on the chosen side, builds a mask that is white in the new region and black in the old, and ships both. When the result returns, the extension pastes it at the correct offset into the now-larger canvas rather than replacing the original.

The default workflows ship as JSON in the repo, one per operation. They are minimal graphs that take an image input and a mask input and return a single image output. Users who already author workflows can swap in their own graphs by pointing the extension at a different workflow ID. The plugin does not interpret or edit the graph; it sends the right inputs and reads the right outputs.

Local-only is enforced by configuration rather than by code. The extension is configured with a host and a port, defaulting to `127.0.0.1:8188`, and the readme is explicit that the user is responsible for the ComfyUI server they point it at. There is no built-in remote endpoint.

## Milestones

1. **M1 — Extension skeleton** — a Photoshop extension that shows a panel with two buttons and a configurable ComfyUI host and port.
2. **M2 — Inpaint** — encode the active layer and mask, POST to ComfyUI, write the result back at the document's bit depth.
3. **M3 — Outpaint** — grow the canvas, build the mask, POST, paste at the correct offset.
4. **M4 — Progress** — subscribe to the WebSocket stream and reflect queue position and progress in the panel.
5. **M5 — Default workflows** — ship the minimal inpaint and outpaint JSON graphs and document how to swap them.
6. **M6 — Colour management** — verify pixel fidelity at 8-bit, 16-bit and the document's colour profile on at least one sample document.

## Risks

- **Photoshop extension API drift** — Adobe has shifted between CEP and UXP, and a plugin built against the wrong API only runs on a subset of versions.
- **Colour-profile mismatch** — ComfyUI returns sRGB by convention; a document in ProPhotoRGB or 16-bit will show a visible shift unless the extension explicitly converts.
- **GPU bottleneck** — the plugin's latency is dominated by ComfyUI's queue, and users on weak GPUs will hit the same wall as ComfyUI itself.
- **Workflow drift** — ComfyUI's node schema changes across versions, and the shipped default workflows can silently stop loading.
- **Local-only promise** — the title claims no remote calls, so the extension must not fall back to a cloud endpoint under any failure mode.
- **Mask semantics** — Photoshop's mask channel and ComfyUI's mask input differ in edge handling and antialiasing, which can produce a visible seam at the mask boundary.
