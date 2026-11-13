---
name: aios-ui-3d
description: Build a 3D scene or WebGL/shader piece for the web (three.js, React Three Fiber, shaders) that matches reference images and still loads fast. Fixed camera shots, side-by-side checks, scored critics, a web budget (lazy canvas, poster, reduced motion). Explicit invocation, /aios-ui-3d <what to build> [references].
disable-model-invocation: true
---

# aios-ui-3d

3D that holds up next to its references and does not cost the page. Reuse the skills named below; do not restate
them. The reference loop is adapted from cook by Leon Lin (MIT, see NOTICE-cook.md).

1. **Reuse first.** Ask ui-indexador before building: `search_items` with `feature=shader3d`, or a description
   ("3d globe", "shader gradient background", "particle field"), `osi_only=true`, the project's `framework`. Read
   each candidate with `npx shadcn@latest view` (checks in `/aios-ui-design` step 4). A proven shader background
   beats a hand-written one; build only what no indexed piece covers.
2. **Brief and references.** References are the minimum bar, not inspiration: target images (made with an image
   model, or captures of real sites), studied at full size before any code. If the build is longer than one
   session or must run unattended, use `aios-loop` long-run mode (`run/BRIEF.md`, one intake, then no questions).
3. **Shot list.** One row per reference in `run/SHOTS.md`, each with a **camera preset in code**: position, target,
   field of view, time of day, plus what to take from it (light, color, composition, materials). For a web hero
   a shot is also a viewport: 1280 and 375 at least.
4. **Stack.** Check `package.json` first. React project: React Three Fiber with drei; otherwise plain three.js;
   a single full-screen shader can be `ogl` or a raw WebGL canvas. Pin versions the project already uses.
5. **Harness, before the first round.**
   - **Deterministic:** drive every animation from a time parameter, never the wall clock, and expose
     `?shot=S01&t=2.5` so a still is the same every time.
   - **Stills:** capture each shot at its preset with Playwright (`preserveDrawingBuffer` on the renderer), then
     `aios-ui-verify/scripts/compare.py` for the side by side and the measured color deltas.
   - **Too grey is the most common failure.** Check the pipeline before repainting materials: renderer output
     color space (sRGB), tone mapping (ACES or AgX), exposure, fog and haze color.
6. **Quality.** Depth over breadth: one shot exceptional before the next. Detail near and far: render to the
   horizon, vary shape, color and scale per instance (InstancedMesh with per-instance attributes), nothing
   copy-pasted. Light and haze carry the mood; materials must take light like the reference (water, stone,
   foliage, metal). External models and textures are allowed for the web unless the brief says "all in code";
   ship them compressed (glTF with Draco or meshopt, KTX2) and credit them.
7. **Web budget, not optional.**
   - The canvas is never the LCP element: render a **poster** (a still from the harness) first and lazy-load
     three.js with a dynamic import after the page is interactive.
   - `prefers-reduced-motion`, no WebGL, or `Save-Data`: show the poster, no animation.
   - Cap the pixel ratio at 2, pause when off screen or the tab is hidden (`frameloop="demand"` or an
     IntersectionObserver), lower geometry and particle counts on small screens.
   - Measure, do not guess: frame time on desktop and on a throttled mobile profile, bundle size of the 3D chunk,
     Lighthouse mobile (performance at least 90) with the scene in place.
   - A decorative canvas is `aria-hidden`; anything meaningful also exists as text.
8. **Offline quality for stills and video.** For renders that leave the browser, render frame by frame from the
   frame number with sub-frame accumulation: jitter time for motion blur, light position for soft shadows, lens
   for depth of field, sub-pixel offset for anti-aliasing. Measure seconds per frame on a short test first. A
   video deliverable continues in `/aios-ui-video`.
9. **Score and gate.** `aios-ui-review` scored mode on composition, light, color, materials, detail near and far,
   motion; at least two fresh critics, median, calibrated by the user's estimate. Send stills every round; no final
   render or export before the user approves the stills. Then `/aios-ui-verify` on every page the scene is on.

## Never

- Let a 3D scene block the first paint, or run when nobody can see it.
- Copy one reference element 1:1, or publish third-party references.
- Report a frame time, size or score that no command produced.
