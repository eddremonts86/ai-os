---
id: "499"
slug: what-does-your-setup-look-like-when-youre-the-only-one-
title: What does your setup look like when you’re the only one working on it?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnzb5d/what_does_your_setup_look_like_when_youre_the/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, MDX, PostgreSQL, Resend, Vercel]
---
# What does your setup look like when you’re the only one working on it?

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/499-what-does-your-setup-look-like-when-youre-the-only-one-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Solo-setup survey
- [ ] Public dashboard
- [ ] Guided suggestions
- [ ] Follow-up email

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, MDX) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 499-what-does-your-setup-look-like-when MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, MDX errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
