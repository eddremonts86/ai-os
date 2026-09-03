# SPEC.md — Is anyone else preparing for the EU Cyber Resilience Act?

## Problem

I run a one-person GmbH in Germany. I am thinking about selling firmware for an off-the-shelf handheld - offline, no WiFi, no network stack compiled in at all, updates by reflashing over USB. I don&#x27;t sell hardware, just software.<p>Turns out that the EU Cyber Resilience Act applies to me. The EU starts to handle software products similar to hardware products and the CRA regulates that (and from a customer&#x27;s standpoint - rightfully so!).<p>Reporting duties start this September; everything else in December 2027. So I spent some time reading the sources rather than the commentary: the Regulation itself [1], and the Commission&#x27;s guidance of 27 July 2026 [2] (C(2026) 5252, around 80 pages with 67 worked examples, explicitly aimed at SMEs).<p>This is what I found out so far, and this is where I&#x27;d like to be corrected:<p>1. Selling software now works like selling hardware. Same regime - technical file, declaration of conformity, CE marking on a piece of software. I&#x27;d assumed CE was a hardware thing; with the CRA not anymore.<p>2. I can&#x27;t escape it by giving the software away. The exemption is for open source supplied outside commercial activity - free isn&#x27;t the same as non-commercial. Firmware I publish to support a product I sell is plainly commercial, whatever I charge for it.<p>3. There&#x27;s no size threshold. A one-person company carries the same obligations as a large one. Article 33 is titled &quot;Support measures for microenterprises and small and medium-sized enterprises&quot; and every provision in it is help, not exemption.<p>4. But the actual work is small. My product isn&#x27;t in Annex III, so it&#x27;s self-assessment: no notified body, no fee, nothing filed, nobody approves anything. The work seems to be a handful of documents I write once. You basically stick the CE label on by yourself.<p>5. But there is Art. 13(9). Every security update you ship has to stay available for 10 years after you issue it, or the rest of the support period, whichever is longer. That&#x27;s a serious amount of time into the 2040s for a product launched in 2027, maybe sold only once.<p>6. Reporting obligations don&#x27;t end when support does. The guidance is explicit (para 210): vulnerability handling stops with the support period, reporting continues afterwards.<p>I&#x27;ll stop here, but there&#x27;s a couple more implications.<p>Ah, and before you ask: it doesn&#x27;t matter where you live, it matters that you sell to the EU.<p>In a nutshell: I didn&#x27;t find any &#x27;indie&#x27; sources dealing with these matters, so my main question is - is anyone else preparing for this scenario? If so, how do you handle it? Especially interested in anyone who has actually been through this at a small scale, or anyone from a market surveillance authority.<p>[1] https:&#x2F;&#x2F;eur-lex.europa.eu&#x2F;eli&#x2F;reg&#x2F;2024&#x2F;2847&#x2F;oj<p>[2] https:&#x2F;&#x2F;digital-strategy.ec.europa.eu&#x2F;en&#x2F;library&#x2F;commission-publishes-new-guidance-support-timely-cyber-resilience-act-implementation

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49520688)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-01T11:49:43Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
