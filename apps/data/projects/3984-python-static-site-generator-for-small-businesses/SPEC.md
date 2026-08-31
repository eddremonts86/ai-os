---
id: "3984"
slug: python-static-site-generator-for-small-businesses
title: Python Static Site Generator for Small Businesses
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49504284"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Python Static Site Generator for Small Businesses

## Problem

A static site generator for small web based store front for a brick and mortar store. It uses a local data store: FOSSThis software is intended to fill the gap between a "full" frontend/backend solution and a simple static front end site in that it employs local data stores to create a static website that can be easily updated by the store owner.Features:
- A python script run by the user that accesses a local CSV data store and builds a static html page. This greatly reduces complexity while still giving the user the ability to modify the data.
- It is run by executing a python script from the command line.
- After the initial html file is built, the user will use the hosting provider's website to upload the html file to the hosting server.
- The script is simple enough that an beginning/intermediate python/html dev can update the script, data store and resulting index.html file without additional research or support. Using this software should be within ability range of a superuser.
- This software and its output is written as simply as possible to allow for customization as needed.
+ It uses no additional frameworks, just native html/CSS.
+ It uses no libraries not included in standard python.
+ No JavaScript is used. The output is simple html/CSS. All the CSS is embedded in the html file to make it easier to manage the files. Only the resulting index.html file needs to be uploaded to the hosting server.
+ It uses common spreadsheet software to manage the data for both the Store Information and the products to be listed.
- This software is Free and Open Source Software(FOSS) and can be edited by the user or their agent.Suitability:
This software is suitable to the small store owner that is looking to move into online sales/marketing, but doesn't want to commit to a large development project or ongoing costs. It can be advertised using a QR code linking to the hosting provider. This eliminates the need for a domain name.Possible Uses:
- Small brick and mortar stores
- SwapMeet vendors
- Yard sales

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
