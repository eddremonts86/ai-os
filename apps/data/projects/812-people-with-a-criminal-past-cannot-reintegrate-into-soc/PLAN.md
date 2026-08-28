---
id: "812"
slug: people-with-a-criminal-past-cannot-reintegrate-into-soc
title: People with a criminal past cannot reintegrate into society because their real skills are «invisible»
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/krxg2n1ge1-people-with-a-criminal-past-cannot-reint"
category: career
date: "2025-12-11"
tags: [Career, Legal, AI, Other]
country: Norway
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# People with a criminal past cannot reintegrate into society because their real skills are «invisible»

## Tech Stack

React with TypeScript for the guided intake UI, TanStack Start as the Node.js API, SQLite with Drizzle ORM for the local record, deployed via Coolify and Docker. Chosen because the MVP is a single-user form-and-export tool that needs to run cheaply and keep personal data on a known server.

## Architecture

A single web app with a guided intake form, a server-side renderer that produces a shareable CV, and a small admin view for the social worker who is supporting the user. No external CV service; the export is plain HTML and PDF generated locally.

## Milestones

- M1 — Guided intake that asks for experience in plain language and returns a structured work history.
- M2 — CV export (HTML and PDF) in Norwegian, designed to be read by employers who do not specialise in reintegration.
- M3 — Social-worker view: one coach can see and edit the drafts of several users, with an explicit consent step.

## Risks

- Source is thin: the plan cannot be validated against a full problem statement until the original ProblemHunt body is read.
- Privacy posture must be confirmed before any data leaves the user's device.
- Norway-specific employment language is needed or the CV will not read as credible.
