---
id: "4190"
slug: linux-server-management-over-ssh-written-in-rust-and-ta
title: "Linux server management over SSH – written in Rust and Tauri"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509679"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Linux server management over SSH – written in Rust and Tauri

## Problem

Serverbox (serverbox.stupidlabs.lol) is a desktop app, written in Rust + Tauri, that gives a Linux administrator a single window for managing remote servers over SSH. The product is positioned as agentless: nothing to install, update, or babysit on the server side. The app uses the credentials the operator already has and offers live dashboards, a real terminal, file management, Docker, services, cron, users, and firewalls. The landing page emphasises that secrets stay in an encrypted vault on the local machine and that the app respects the distro (Debian, Ubuntu, Fedora, RHEL, openSUSE, Arch).


---

## Objective

Ship a desktop app that lets a Linux administrator manage one or more remote servers over SSH from a single window — live dashboards, real terminal, file manager, Docker, services, cron, users, and firewalls — with no agent installed on the server side.


## Target Users

Linux administrators and developers who manage remote servers and want a single GUI instead of a stack of SSH sessions. Assumes the reader is comfortable with SSH credentials and basic Linux administration.


## MVP Scope

- A desktop app (Rust + Tauri) that opens an SSH session per server.
- A live dashboard per server (CPU, memory, disk, uptime, load averages, storage, network).
- A real terminal tab that drops into the server's shell.
- A file manager tab that browses and edits files over SFTP.
- Tabs for Docker, services, cron, users, and firewalls.
- An encrypted credential vault on the local machine.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the project is positioned as an open-source desktop app.
- Agentless is a hard requirement; if anything is installed on the server, the product loses its main claim.
- Distro support has to cover Debian, Ubuntu, Fedora, RHEL, openSUSE, and Arch.
