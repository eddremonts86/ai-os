---
id: "842"
slug: problem-of-product-selection-and-production-capacity-pl
title: Problem of product selection and production capacity planning
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: business
date: "2025-11-14"
tags: [Business, Other]
country: India
tech: [React (Vite), TypeScript, javascript-lp-solver (browser), Static hosting]
---
# Problem of product selection and production capacity planning

## Problem

An Indian operator describes difficulty choosing what to sell and how much of it to make. The poster names no specific industry. The decision problem is: given a factory or kitchen with a fixed capacity, which products should be on the line, and in what quantities, to maximize margin or fill rate.

---

## Objective

Help a small Indian manufacturer or food producer pick the right product mix and production volumes for the coming period.

## Target Users

Indian small-to-mid manufacturers and cloud-kitchen operators with a fixed production capacity and a portfolio of candidate SKUs.

## MVP Scope

A planning worksheet that takes capacity (hours, units), a list of candidate SKUs with margin and run-time, and a demand forecast, then returns a recommended production plan. Single-user, single-tenant. No ERP integration.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

All inputs are entered by the user; no external data is asserted. Optimization is straightforward linear programming, not ML.
