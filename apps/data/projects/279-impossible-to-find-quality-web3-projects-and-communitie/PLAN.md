---
id: "279"
slug: impossible-to-find-quality-web3-projects-and-communitie
title: Impossible to find quality Web3 projects and communities due to information noise and fraud
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/1yr4ejpc51-impossible-to-find-quality-web3-projects"
category: finance
date: "2025-12-01"
tags: [Web3, Other]
country: Netherlands
tech: [Next.js 14, TypeScript, PostgreSQL, Etherscan / Solana RPC APIs, GitHub API, OpenAI GPT-4o, Stripe]
---
# Impossible to find quality Web3 projects and communities due to information noise and fraud

## Tech Stack

Next.js 14 (TypeScript) for the web app. PostgreSQL for projects, scoring, communities. Etherscan and Solana RPC APIs for on-chain evidence. GitHub API for code-activity evidence. OpenAI GPT-4o for project-description and team-transparency analysis. Stripe for premium verification.

## Architecture

Three services: a Next.js app for project directory and detail views, a Python scoring worker that pulls per-chain and GitHub evidence and computes the score, and a community-side submission flow that allows projects to dispute scores.

## Milestones

M1: Project submission and verification pipeline. M2: Evidence collection across Etherscan, Solana RPC, GitHub. M3: Multi-dimensional scoring. M4: Ranked directory by category and chain. M5: Premium verification tier and score-dispute flow.

## Risks

Scoring methodology must be defensible against gaming. Per-chain RPC rate limits require careful queue design. On-chain evidence quality varies by chain maturity.
