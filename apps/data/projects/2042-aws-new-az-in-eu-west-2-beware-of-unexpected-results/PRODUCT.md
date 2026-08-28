---
id: "2042"
slug: aws-new-az-in-eu-west-2-beware-of-unexpected-results
title: AWS new AZ in eu-west-2 - beware of unexpected results
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49363466"
category: ask-hn
date: "2026-08-19"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AWS new AZ in eu-west-2 - beware of unexpected results

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ It seems as though AWS have brought a new AZ online in eu-west-2 (London) today with very little fanfare or indeed without telling their support staff. It appears as eu-west-2d. No AWS docs yet reflect this change.Wanted to give anyone who uses this region a heads up just in case - at a client site it has caused a widespread bunch of issues as a result of Terraform failures etc. Depending on your codebase resources might be torn down and recreated unexpectedly. You can argue the case for whether this should cause you issues or not given this is the cloud etc but I just wanted to try and save someone else some hours of head scratching.aws ec2 describe-availability-zones --region eu-west-2 --all-availability-zones --query 'AvailabilityZones[].[ZoneName,ZoneID,ZoneTYpe,State,OptInStatus,Messages]'
[
 [
 "eu-west-2a",
 null,
 null,
 "available",
 "opt-in-not-required",
 []
 ],
 [
 "eu-west-2b",
 null,
 null,
 "available",
 "opt-in-not-required",
 []
 ],
 [
 "eu-west-2c",
 null,
 null,
 "available",
 "opt-in-not-required",
 []
 ],
 [
 "eu-west-2d",
 null,
 null,
 "available",
 "opt-in-not-required",
 []
 ],

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49363466) · **Category:** ask-hn · **Tags:** Ask HN,Problem
