---
id: "777"
slug: online-clothes-shopping-is-a-lottery-theres-no-accessib
title: "Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/k5z415d0z1-online-clothes-shopping-is-a-lottery-the"
category: retail
date: "2026-01-22"
tags: [Retail, AI, Other]
country: India
tech: [Python, FastAPI, MediaPipe Pose, OpenCV, PostgreSQL, Three.js, Next.js, Tailwind CSS, Coolify, Docker]
---
# Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller.

## Tech Stack

- **Python with FastAPI** for the merchant API, because garment registration and per-merchant key validation are simple CRUD plus a small image-processing step, and FastAPI's async story fits a low-bandwidth backend without the ceremony of a Node framework.
- **MediaPipe Pose compiled to WebAssembly** for in-browser landmark extraction, since it ships a stable joint model that runs in the browser without GPU and is the reason the camera frame can stay on the device.
- **OpenCV (headless)** for garment registration on the server, used only to flatten, mask and measure the flat-lay or vendor product image into a parametric garment record; no GPU build, no model serving.
- **PostgreSQL** for merchants, garment records, per-product fit logs and the aggregate dashboard counters; it is the smallest store that survives the merchant-dashboard query patterns without a second datastore.
- **Three.js** for the client-side preview renderer, because it is the established path for a CPU-warped garment mesh on the open web and avoids pulling a heavier WebGPU stack.
- **Next.js + Tailwind CSS** for the merchant dashboard, served from the same Coolify node as the API, because the dashboard is small and does not need its own framework story.
- **Coolify and Docker** for deployment, mirroring the merchant's existing one-node shape so the widget has no new infrastructure prerequisite.

## Architecture

A shopper lands on a merchant's product page with the TryFit widget loaded as a deferred script. The widget opens a consent prompt, then captures a short video clip in the browser. The MediaPipe Pose WASM build extracts joint positions from each frame locally and discards the underlying frames; only the proportion vector (shoulder width, torso length, hip width, and a few ratios derived from those) plus a per-session pseudonymous hash crosses the network to the merchant's FastAPI backend. The shopper's face is never sampled, because the pose configuration ignores facial landmarks and the WASM build runs on a downscaled frame.

The merchant registers a garment by submitting a flat-lay or vendor product image plus a small set of measurements (chest, waist, hip, length). OpenCV flattens the image into a parametric garment record — a silhouette plus size-dependent scaling factors — which is stored in PostgreSQL alongside the merchant's product catalogue row. When a shopper opens the preview, the backend looks up the garment record, sends it to the widget, and the widget warps it onto the shopper's proportions using a simple, CPU-only heuristic: the garment's reference silhouette is scaled to match shoulder and hip width and positioned at the hip line. Three.js renders the warped result, optionally rotating it with device-orientation permission.

The merchant dashboard is a separate Next.js application served behind the same Coolify reverse proxy. It authenticates the merchant with a per-store API key, lists products and their garment-registration status, and shows aggregate counters — previewed visits, completions, and a per-product completion funnel. The dashboard never receives raw camera data, never sees per-shopper biometrics, and the API it calls reads only the per-merchant aggregate tables. This is the reason the dashboard can sit on the same node as the public API without expanding the privacy boundary.

## Milestones

1. **M1 — Pose in the browser** — MediaPipe Pose WASM integrated into a standalone widget that produces a proportion vector from a phone camera, with the camera frame discarded on device.
2. **M2 — Garment registration** — FastAPI endpoint that accepts a flat-lay image and measurements and returns a stored garment record, validated against a small reference catalogue.
3. **M3 — Try-on warp and render** — Three.js warp from the proportion vector and the garment record to a preview the shopper can rotate, with the low-power fallback.
4. **M4 — Embeddable widget** — Two-script-tag embed that any small-store product page can drop in, with the consent prompt and the failure modes covered.
5. **M5 — Merchant dashboard** — Next.js + Tailwind dashboard on the same Coolify node, showing per-product completion funnels and the per-visit aggregate counters.
6. **M6 — Reference deployment** — one small Indian boutique's storefront wired to TryFit end to end, documented as the worked example the next merchant follows.

## Risks

- **Heuristic warp looks unconvincing** — if the preview does not give shoppers more confidence than a size chart, the whole value prop collapses; this needs an early usability pass before the merchant-dashboard build.
- **MediaPipe WASM first-paint is too heavy on 4G** — the worker bundle is several megabytes, and a slow first interaction can drop the shopper before they consent; a smaller landmark set or a CDN-cached worker has to be evaluated.
- **Camera permission friction** — a shopper who declines permission still needs a usable product page, not a broken embed; the fallback design has to be tested, not assumed.
- **Garment registration variability** — vendor images vary widely in pose and lighting, and a registration that only works on perfect flat-lays turns into the merchant's support burden; OpenCV heuristics need a measured accuracy band.
- **Privacy story drift** — any change that incidentally captures the face or stores a recognisable frame invalidates the no-biometric promise, so the pose configuration and the storage path both need automated checks.
- **Coolify node capacity** — a single node serves the merchant dashboard, the API and the widget hosting; a small merchant who suddenly gets featured needs a graceful scale story that does not require a second stack.
