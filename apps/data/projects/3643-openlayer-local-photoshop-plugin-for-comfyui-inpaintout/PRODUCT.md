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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

OpenLayer is a Photoshop plugin that talks to a local ComfyUI server and turns the two operations Photoshop users most often want from a generative model — inpaint a masked region and outpaint beyond the current canvas — into one-click actions inside the Photoshop panel. The plugin reads the active document and the user's mask, ships them to a ComfyUI workflow the user already runs, and writes the returned pixels back into the layer at the document's bit depth and colour profile.

Because the integration is local, no pixels leave the user's machine. The plugin does not author the workflow; it invokes one. A minimal default workflow for each operation is shipped so the demo works without a graph already authored, but the user can point the plugin at any saved graph that exposes the right inputs and outputs.

**One-liner:** OpenLayer is a local Photoshop plugin that inpaints and outpaints the active document against a ComfyUI server the user already runs, with no pixels leaving the machine.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Photoshop users already running ComfyUI | They want a one-click path from a layer mask to a generated fill, not a manual PNG round-trip. |
| Concept artists and retouchers | They want generative fills without leaving the document they are editing. |
| ComfyUI users | They want a friendlier surface than the node graph for inpaint and outpaint specifically. |
| Hobbyists running ComfyUI on a home GPU | They want a tighter loop between mask and result than exporting, queueing and re-importing. |
| Anyone who values local-only tooling | No cloud round-trip means the document never leaves their machine. |

## Jobs To Be Done

1. **Functional job** — Inpaint a masked region of the active document without exporting a PNG and re-importing the result.
2. **Functional job** — Outpaint beyond the canvas on a chosen side and have the result land at the correct offset.
3. **Functional job** — Watch the queue and progress without leaving the Photoshop panel.
4. **Functional job** — Point the plugin at any saved ComfyUI workflow that exposes the right inputs.
5. **Emotional job** — Keep generative fills in the same tool as the rest of the edit, instead of breaking the workflow to a different surface.
6. **Social job** — Show that local generative tooling can be ergonomic without being a web app.

## Success Metrics

- **One-click success rate** — share of inpaint or outpaint actions that complete without the user re-queuing or re-importing manually.
- **Round-trip latency** — time from clicking the button to pixels reappearing in the document, dominated by ComfyUI itself.
- **Pixel fidelity** — share of results that match the host document's bit depth and colour profile without a visible gamma shift.
- **Workflow portability** — share of users who can swap in their own saved ComfyUI workflow without editing plugin code.
- **Local-only verification** — the plugin's network panel shows zero outbound calls during a fill, which is the property the title promises.

## Pricing & Monetization

The post names no price, no tier and no business model. The architecture fixes a specific cost shape regardless: the user already owns Photoshop and already runs a ComfyUI server, so the plugin adds no infrastructure cost of its own. Any future monetisation would therefore be either a paid version with extra workflow presets or a tip jar, never a hosted service.

## Competitive Landscape

- **Photoshop's built-in Generative Fill** — runs in the cloud and is bound to Adobe's subscription model, which is exactly what "local" is positioned against.
- **Manual PNG round-trip with ComfyUI** — works but breaks the editing loop, which is the friction the plugin removes.
- **Other Photoshop generative plugins** — the post names none specifically, and no competitor is named in the capture, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm which Photoshop extension API is targeted, since Adobe has shifted between CEP and UXP and the choice constrains the supported Photoshop versions.
- [ ] Decide whether the plugin ships a default ComfyUI workflow per operation or expects the user to point at one, since the title only promises the demo.
- [ ] Establish the colour-management contract so results from ComfyUI land at the document's bit depth and profile, not as a flattened sRGB bitmap.
- [ ] Verify the plugin against ComfyUI's WebSocket progress stream so the panel reflects queue position rather than polling blindly.
- [ ] Document the GPU requirement explicitly, since users without a compatible GPU will hit the same wall as ComfyUI itself.
- [ ] Make the local-only property provable, by surfacing the network panel during a fill so the user can see zero outbound calls.
