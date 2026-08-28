---
id: "707"
slug: built-a-micro-saas-to-translate-pdfs-without-wrecking-t
title: Built a micro-SaaS to translate PDFs without wrecking the layout. How do you handle long processing times?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpzn6g/built_a_microsaas_to_translate_pdfs_without/"
category: saas
date: "2026-08-16"
---
# Built a micro-SaaS to translate PDFs without wrecking the layout. How do you handle long processing times?

## Phase 0: Scaffold

- [ ] Confirm `SPEC.md` Problem carries the poster's exact framing: layout-preserving PDF translation + API timeouts on heavy files + the async-mechanism question
- [ ] Carry the stated stack (Next.js + PostgreSQL + Railway) into `PLAN.md` Tech Stack as a hard constraint, not a default
- [ ] Note in `SPEC.md` Constraints that the layout-preservation quality is the stated differentiator and must not regress
- [ ] Add frontmatter `tags` for `pdf`, `translation`, `async-processing`, `micro-saas`, `nextjs`

## Phase 1: Core

- [ ] Re-read the Reddit thread and capture the async-mechanism replies (webhook, background job, hybrid)
- [ ] Pick the mechanism with the most concrete operational justification, not the most popular vote
- [ ] Reject any enrichment that names a different stack or adds services the poster did not mention
- [ ] If a future iteration adds a webhook callback, gate it on a documented retry / dead-letter path

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
