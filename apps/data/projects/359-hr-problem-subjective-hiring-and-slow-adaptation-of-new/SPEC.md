---
id: "359"
slug: hr-problem-subjective-hiring-and-slow-adaptation-of-new
title: "HR problem: subjective hiring and slow adaptation of new employees"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/hr/tp6dgyysf1-hr-problem-subjective-assessment-of-candidates-and-slow"
category: hr
date: "2025-10-10"
tags: [HR]
country: Russia
---
# HR problem: subjective hiring and slow adaptation of new employees

## Problem

Mid-sized Russian companies that hire regularly say the same two things: the hiring signal is subjective (gut, "feel", a few interviews), and the new hire takes months to be productive. The source post on ProblemHunt names the dual problem as "subjective hiring and slow adaptation of new employees." The first half is a classic selection problem: interviews are noisy, the criteria are not written, and the same candidate can be called "strong" by one panel and "not a fit" by another. The second half is a classic onboarding problem: the new hire gets a laptop, a manager, and a list of tasks, but no structured path from "week 1" to "fully productive on the work the team actually does." The post does not name the company size, the role, the industry, or the cost of the slow ramp — it identifies the recurring pain and the cost of getting it wrong.

## Objective

Provide an HR pipeline that turns the subjective hiring and the slow onboarding into a structured, repeatable process: a structured interview kit per role, a structured scorecard for the panel, a written 30/60/90 plan for the new hire, and a tracking dashboard that shows where each new hire is on the plan. The MVP should produce one full hire → onboard → first deliverable cycle: a panel conducts interviews using the structured scorecard, the new hire is selected with a written reason, the 30/60/90 plan is published on day one, and the manager signs off on the first deliverable at day 30. The objective is to make the hiring decision auditable and the ramp visible.

## Target Users

- **HR managers in Russian mid-sized companies (50–500 employees)** who run 5–20 hires per quarter and cannot defend their decisions beyond "the panel felt this way."
- **Hiring managers** who want a structured scorecard and a clear 30/60/90 plan rather than relying on memory.
- **New hires** who want to know what is expected of them in week 1 and how they will be measured.
- **Founders who still do their own hiring** but want a defensible process once the company grows past 10 people.

## MVP Scope

- A role library with a starter set of structured interview kits (e.g., backend engineer, sales manager, customer support) and a custom-role builder.
- A scorecard per interview round that collects notes from each interviewer, averages them, and requires a written reason for the hire / no-hire decision.
- A 30/60/90 plan template that the hiring manager fills in before day one, with explicit deliverables and a "definition of done" for each phase.
- A tracking dashboard for the new hire, with a checklist of week-by-week tasks and a manager sign-off at the end of each phase.
- A retrospective at the end of the 30/60/90 plan that captures what was actually delivered vs. what was planned, so the next hire's plan starts from real data.

## Constraints

- **Bias risk**: a structured process is a defence against the bias of an unstructured one, but the bias does not disappear; the platform must keep the scorecard visible to the panel and require a written reason for each decision.
- **Manager time**: the hiring manager must fill in the 30/60/90 plan before the new hire starts; if the manager does not, the platform must refuse to let the hire start, not invent a plan.
- **Privacy**: the scorecard contains interview notes about real candidates; the data must be retained for the period the company requires and deleted thereafter (Russian labour law applies).
- **Multi-cultural**: a Russian-hiring tool must respect Russian employment law (labour code, severance, the trial period). The MVP must not produce a US/EU-style offer letter by default.
- **No AI scoring**: the platform must not produce a "fit score" or rank candidates; the panel's written judgement must remain the decision.
