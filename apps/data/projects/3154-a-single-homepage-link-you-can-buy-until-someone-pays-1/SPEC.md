---
id: "3154"
slug: a-single-homepage-link-you-can-buy-until-someone-pays-1
title: A single homepage link you can buy until someone pays $1 more
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447588"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# A single homepage link you can buy until someone pays $1 more

## Problem

The poster shipped a site at mostexpensivelink.com where a single homepage link is sold to the highest bidder, and any new buyer can outbid the current owner by $1. The HN post body contains no further detail.

## Objective

Run a continuous auction for a single homepage link on one website, where the next buyer outbids by one dollar.

## Target Users

Curious HN readers and link-buyers who want to play a one-link ad auction for fun or promotion.

## MVP Scope

Single-page site that shows the current holder, current price, and a buy button that instantly transfers the link on payment of current+1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Settlement of the 'current' link if the buyer wins but the holder's link was already cached.
