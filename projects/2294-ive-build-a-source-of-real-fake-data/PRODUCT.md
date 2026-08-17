---
id: "2294"
slug: ive-build-a-source-of-real-fake-data
title: "I've build a source of real fake data"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49321676"
category: ask-hn
date: "2026-08-16"
tags: [Ask HN, Problem]
country: Karol Nowakowski
---
# I've build a source of real fake data

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello guys.I want to interest You guys in a tool I've been working on for a last few months - real-fake-data generator.
https://real-fake-data.comThe basic need it covers is to deliver test data that is (1) identical to the real data but not real, (2) make sure Your pipelines will catch real life problems - not only those which developer will remember to cover when developing.First of all - reality changes. You can have a submission form with vehicle registration number and You have a problem (different countries, different rules). You will either spend month on digging various scenarios or You will just let it go and put a "max length 7" and go away. Your tool is up and working - BUT someday some country or state decides to have lenght-8 for vehicle plates and .... your system fails (users cant input new vehicle plates) while your test pipelines work and are sending You fake-green smile.Second of all - You really cant predict everythin. You are open for users from around the world? Nice but they use different alphabets. Your beautiful UX/UI will crash with user initials becoming 4 or 5 letters. Or the field for surname will be just too short. Or will it accept non-latin characters used even in Europe?When You create new software You also need a seed starting data - so You can see (while developing) Your tool with some mock users, mock posts, mock products, mock transactions etc. Again - You either spend a lot of time writing it - even with help of AI - either You just leave user1, user2, user3 and You loose ability to look at Your tool in a way real life user will be looking.My tool - real-fake-data.com - fixes all of it.
 - you want to accept german ID document, USA vehicle number, spanish person over 18 y.o., real existing address from Poland - we have over 300 generators of real data (really existing, checksum guaranteed, following all the rules)
 - you want to create a seed database of 30 users, each with few orders, each with payment details, and logs - with REAL timestamps that make sense - just define data schema - and You are covered - data is generated
 - you want to run Your tests in a hostile environment - we got this - You can switch for every generator from normal mode into: EDGE (correct data but on edge of correctness - eg. born date yesterday, longest possible surname, shortest vehicle number from Poland), EXTREME (correct data but deliberately made problematic with spaces untrimmed, new lines, hidden UTF characters, etc.) and INVALID (incorrect data that is useful to check if Your form with reject it or behave correctly)
 - you want to rerun the test with THE SAME data - it's there with a SEED number You will always receive the same random data - so You choose whenever You want random things and whenever You want repeated security
 - you want Your Claude to deliver You data on low cost? Great to hear - MCP server is ready for You to use
 - you want to write playwright tests easily nice `const person = await fakeData.plPerson({ sex: 'f' });` and You are covered
 - you want to use VSCode Addon to have test data directly on the browser without leaving it? Cool - Ctrl+Shift+P "generate fake UUID" - and You have it ready without leaving the VS code screen
 - you want to be sure that none data will ever put Your software at risk - great - make sure seeds are random, turn on edge mode and You will be sure as soon as some new formats of data will be there in real world Your pipeline will be tested against them.How much does it cost? For simple using it costs Nothing. No hidden fees, no credit card required, no monthly subscription of any kind. 2000 free tokens/month.I would really love to receive more insight and hear Your opinion on the tool.It also have MCP addon, Playwright addon on VS Code extension that allows You to grab any data without ever leaving the IDE.with regards,
Karol Nowakowski

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

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49321676) · **Category:** ask-hn · **Tags:** Ask HN,Problem
