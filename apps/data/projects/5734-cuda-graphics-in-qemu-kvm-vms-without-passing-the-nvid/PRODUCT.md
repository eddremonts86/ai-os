# PRODUCT.md — CUDA/graphics in QEMU-KVM VMs without passing the Nvidia card to them

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN. I built this because I wanted a VM with a real GeForce GPU without losing the card on my desktop.<p>It allows you to run CUDA and graphics in VMs without VFIO&#x2F;vGPU by forwarding the NVIDIA driver&#x27;s own ioctl surface from the guest to the host.<p>That means stock libcuda and real Vulkan ICD run in the guest - no CUDA&#x2F;Vulkan API remoting or translation. Display, LLM, CUDA, headless supported. Your desktop keeps using the same card, multiple VMs supported.<p>Happy to go into the details of the architecture.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49609389) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
