---
id: "2126"
slug: kanna-go-generators-for-di-queries-internationalization
title: "Kanna – Go generators for DI, queries, internationalization and more"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49372615"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Kanna – Go generators for DI, queries, internationalization and more

## Problem

I kept writing constructor wiring up, domain types and API types conversions, test fixtures, DB row scans, bra-bra-brah by my hands.
I know that libraries those use reflections may help, but they fails on runtime and we cannot see what is happening without reading code. So I decided to create a project in oposite hand. Generate code and put it in our repository. The code is ordinary Go code, so that we can review, watch diffs and also debug it.For instance, when we have the following code,func NewDB() DB { return &DB{} }func NewUser(db DB) User { return User{db: db} }type Container struct {
 User User `di:""`
}it generates...func NewContainer() *Container {
 db := NewDB()
 user := NewUser(db)
 return &Container{User: user}
}No providers, just scan packages and find them.There are 5 generators.1. DI2. Struct to struct mapping (for protubf and so on)3. Test fixtures (from model to them)4. SQL queries (like an sqlc but without SQL and more like GORM)5. Type safe i18nAll we need is just a struct and tags.Project is just started and just hit v0.0.1.
Any feedbacks are very welcome.

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
