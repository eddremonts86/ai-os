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

## Problem

The capture is only the GitHub repository URL and the title. The title names four things: OpenLayer is a Photoshop plugin, it is local, it targets ComfyUI, and the demo is inpaint and outpaint. That is the entire spec. The repository URL is github.com/MehranMarxian/OpenLayer, and there is no prose body in the capture beyond the title and the URL.

The four named words do, however, fully describe the shape of the thing. Photoshop exposes a plugin model that lets an extension run inside the host and read or write the active document as pixels. ComfyUI is a node-based stable-diffusion workflow runner that exposes its queue over an HTTP and WebSocket API. Inpaint and outpaint are the two image-generation operations that take an existing image plus a mask and return a modified image. "Local" in the title means no cloud round-trip; the Photoshop plugin talks to a ComfyUI server that the user runs on their own machine.

What is not stated is the UX of the plugin, the depth of the ComfyUI integration, whether the plugin picks the right workflow automatically or exposes a node graph, whether it ships a default workflow, and what output formats it writes back into the open Photoshop document. Those are honest gaps left by the URL-only capture. The plan scopes what is knowable from the four named words and leaves the rest unstated.

## Objective

Ship a Photoshop plugin, named OpenLayer, that runs locally on the user's machine, talks to a ComfyUI server the user also runs locally, and demonstrates the two operations Photoshop users most often want from a generative model: inpaint a masked region of the active document, and outpaint beyond its current edges. The integration is local, so no pixels leave the user's machine.

## Target Users

- Photoshop users who already run ComfyUI locally and want a one-click path from a layer mask to a generated fill without exporting PNGs and re-importing them by hand.
- Concept artists and photo retouchers who want generative fills without leaving the document they are editing.
- ComfyUI users who want a friendlier surface than the node graph for the two specific operations of inpaint and outpaint.
- Hobbyists running ComfyUI on a single GPU at home who want a tighter loop between mask and result.

## MVP Scope

- A Photoshop extension that detects the active document and exposes a panel with two buttons: Inpaint and Outpaint.
- An Inpaint action that takes the currently selected mask layer, sends it to a local ComfyUI server, waits for the result, and writes the returned pixels back into the active layer.
- An Outpaint action that extends the canvas on the chosen side, sends the padded image plus its mask to ComfyUI, and writes the returned pixels back at the correct offset.
- A configurable connection to the local ComfyUI server, including the host, port and the workflow ID or saved-graph name to invoke.
- A status display inside the panel that shows queue position, progress and any error returned by ComfyUI.
- Pixel-format and colour-profile handling so a result from ComfyUI lands in the Photoshop document at the document's bit depth and profile rather than as a sRGB bitmap.
- A shipped, minimal default ComfyUI workflow for each operation, so the demo works without the user first authoring a workflow in the node graph.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Local-only: the plugin must not contact any remote service, and the readme and install must make that explicit, because a cloud call would violate the title.
- The plugin must depend on a ComfyUI server the user already runs; it does not ship or install ComfyUI itself.
- The Photoshop host API only exposes certain pixel operations, so the integration is limited to what the current document can carry, which constrains which ComfyUI output formats are usable.
- ComfyUI is GPU-bound; a user without a compatible GPU will hit the same hardware limit as ComfyUI, and the plugin cannot paper over it.
- The capture has no statement of the plugin's UX, the depth of the integration, or any features beyond inpaint and outpaint, so anything beyond what the title names is not claimed here.
