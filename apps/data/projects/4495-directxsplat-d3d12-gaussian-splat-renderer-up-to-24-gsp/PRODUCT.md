# PRODUCT.md — DirectXSplat – D3D12 Gaussian splat renderer, up to 2.4× gsplat FPS

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi all,<p>Over the past few months, I&#x27;ve been working on and off on DirectXSplat, a C++&#x2F;Direct3D 12 library for rendering 3D Gaussian Splats. It can load PLY, SPZ, .splat, SOG, and lod-meta.json scenes and render them from a host D3D12 application.<p>Features:<p>- GPU-accelerated D3D12 rasterization<p>- Up to 2.4x the FPS of gsplat in matched-quality, resident-scene benchmarks on an NVIDIA GeForce RTX 4070 SUPER<p>- Native embeddable D3D12 renderer with a host-owned device, queue, command list, fences, and render targets<p>- Compact packed GPU scene buffers, persistent uploaded scenes, and reusable renderer resources<p>- No CUDA dependency for DirectXSplat rendering<p>- Support for trained 3DGS scenes in PLY, SPZ, .splat, and SOG formats, plus lod-meta.json scene manifests<p>- Whole-scene updates and uploaded scene&#x2F;chunk mutation<p>- GPU resource interop for external work that references renderer-owned resources<p>- Optional approximate splat-depth output<p>- Convenience APIs including an interactive viewer through Show(...) and offscreen image capture through Draw(...)<p>Some of the performance work includes an adapted GPU OneSweep radix sort, GPU-side culling and compaction, and indirect dispatch and draw arguments based on the surviving splats. Scene data is stored in compact packed GPU buffers. Uploaded scenes and renderer-owned resources persist and are reused between frames. Large scenes are internally partitioned into chunks and support hierarchy-based visibility, screen-space LOD selection, configurable splat and residency budgets, and residency caching.<p>The project is MIT licensed and completely open source.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49532043) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
