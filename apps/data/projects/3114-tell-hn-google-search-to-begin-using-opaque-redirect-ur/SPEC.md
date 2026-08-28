---
id: "3114"
slug: tell-hn-google-search-to-begin-using-opaque-redirect-ur
title: "Tell HN: Google Search to begin using opaque redirect URLs on search results"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447708"
category: ask-hn
date: "2026-08-26"
tags: [Ask HN, Problem]
---
# Tell HN: Google Search to begin using opaque redirect URLs on search results

## Problem

The poster has noticed that, in the last couple of months, Google Search has been A/B-testing a new search-result URL format (`/goto?url=`) on their logged-out private-browsing sessions. The previous format (`/url?q=`) is either still served immediately after page load, swapped in after the mouse is held down on a link, or not swapped at all. The new format embeds an opaque base64 payload that the poster cannot decode without visiting the link. Existing extensions like URLCheck or ClearURLs handle the old format but not the new one. The poster suspects this is for user tracking or to defeat scrapers, and asks the community what they think.

## Objective

There is no product idea in the post. The post is an open-thread complaint directed at Google.

## Target Users

Privacy-conscious Google Search users, especially those who already use URL-deobfuscator extensions.

## MVP Scope

No MVP. An extension like ClearURLs could in principle be updated to handle the new format, but the post does not request that.

## Constraints

The link format is owned by Google and can change without notice.
