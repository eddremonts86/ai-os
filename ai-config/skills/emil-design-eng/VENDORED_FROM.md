# Vendored from emilkowalski/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/emilkowalski/skills |
| Upstream path | `skills/emil-design-eng/` |
| Author | Emil Kowalski (creator of Sonner, Vaul; ex-Vercel design engineering) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `d16ebe60d09a5ba2afcb7054ede9d0a10c9f6128` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## Local modifications

None. `SKILL.md` is byte-identical to the vendored commit.

## Why this one

`taste-skill` covers motion at the mechanical level (the `MOTION_INTENSITY` dial, GSAP
sticky-stack/horizontal-pan skeletons, Motion vs GSAP choice). This is the judgment
layer underneath that: exact easing curves and why, duration bands per element type,
spring vs duration-based animation, the animate-transform-and-opacity-only performance
rule, and a mandatory Before/After review table format. Non-overlapping content, same
"motion" surface `taste-skill` and `micro-interactions` already touch, from someone who
shipped the actual components (Sonner: 13M+ weekly downloads) the advice comes from.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/emilkowalski/skills /tmp/ek
diff /tmp/ek/skills/emil-design-eng/SKILL.md ai-config/skills/emil-design-eng/SKILL.md
```

Port changes by hand; bump the commit table above.
