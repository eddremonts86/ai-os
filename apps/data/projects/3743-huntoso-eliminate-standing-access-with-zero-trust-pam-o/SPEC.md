---
id: "3743"
slug: huntoso-eliminate-standing-access-with-zero-trust-pam-o
title: Huntoso – Eliminate standing access with zero-trust PAM on Entra ID
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/huntoso?utm_campaign=startup-181548&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [TypeScript (Next.js for console + Entra app), Go (PAM-Pro policy engine), Microsoft Entra ID (PIM/SCIM integration), PostgreSQL (audit ledger), OpenTelemetry (audit export)]
---
# Huntoso – Eliminate standing access with zero-trust PAM on Entra ID

## Problem

Enterprise identity governance today runs on standing access: engineers, DBAs, and operators keep long-lived privileged roles in Microsoft Entra ID because the work they do demands them, and revoking the role means opening a ticket every time. That standing access is the very thing auditors flag — it is the largest single source of credential exposure in HIPAA, SOC 2, and NIST SP 800-53 audits, and the response is a paper trail of "approved access requests" that does not prove the access was scoped to the work that was actually done. Legacy PAM vendors (CyberArk, BeyondTrust, HashiCorp Boundary) solve this with a separate vault, a separate broker, and an agent on every target host. That stack solves the security half of the problem but creates an operations half: a deployment that is months long, a seat licence per user, and a separate audit log the auditor has to learn alongside Entra ID. Huntoso's BetaList pitch states the problem as: "eliminate standing access, enforce just-in-time elevation, and provide audit-ready evidence for HIPAA, SOC2, and NIST," all inside Entra ID, in a multi-tenant deployment that is "minutes without infrastructure, add-ons, or services." The implicit problem statement is therefore: enterprise teams have standing privileged access they can no longer justify to an auditor, and the only available solutions require either their existing Entra admin to do nothing different or a parallel vault stack the auditor has to reconcile against Entra ID. The capture does not name a specific industry, company size, or regulator the product targets first; the three named frameworks (HIPAA, SOC 2, NIST) define the entry wedge more than any single buyer persona.

## Objective

Ship a multi-tenant zero-trust PAM console that runs natively on top of an existing Microsoft Entra ID tenant, that removes every standing privileged role by replacing it with just-in-time elevation requests, and that produces an audit ledger that satisfies HIPAA, SOC 2, and NIST SP 800-53 evidence requirements without deploying a separate vault, a separate broker, or host agents. The MVP should be reachable from the customer's existing Entra admin in minutes, with the deployment shape stated in the source ("without infrastructure, add-ons, or services"), and the cost shape stated in the source ("reduce total cost compared to legacy PAM vendors"). The MVP measure of done is a customer who can point an auditor at a single Entra-resident activity log and answer "who was privileged, for which role, for what justification, for how long" without a parallel console to reconcile.

## Target Users

- **Primary:** enterprise IAM administrators whose Entra ID tenant is the system of record for identity and who are accountable for the privileged-access evidence trail when their company is audited for HIPAA, SOC 2, or NIST SP 800-53.
- **Secondary:** infrastructure and platform owners (SRE / Platform teams) whose operators currently hold standing Entra roles like "User Administrator," "Application Administrator," or custom PIM-eligible roles, and who are blocked from revoking those roles because the work depends on the elevation being there at the moment the operator needs it.
- **Tertiary:** compliance owners (GRC leads, internal audit) who currently reconcile two or more audit streams — Entra sign-in logs, separate PAM logs, ticket evidence — and who want a single Entra-resident activity ledger to give to an external auditor.

## MVP Scope

- A multi-tenant SaaS console that connects to a customer's Entra ID tenant via app registration with PIM and audit-log Graph API scopes.
- A just-in-time elevation workflow: a user requests a privileged role, the request routes to an approver defined in Entra (or to an automated policy if approved in advance), and on approval the elevation is granted for a time-bound window via Entra PIM, with the start, approver, justification, and end timestamps written to the ledger.
- An admin policy surface for defining which Entra roles require elevation, who is the approver for each, the maximum elevation window, and the justification-tagging rules.
- An evidence export (CSV / JSON) that names the auditor's framework (HIPAA / SOC 2 / NIST) and produces an evidence package per elevation event: who, what role, who approved, on what justification, for how long.
- A self-serve onboarding path: a customer can hand the product their tenant ID and reach a working first elevation in "minutes" as the source states, without deploying VMs, containers, brokers, or agents.
- Multi-tenant data isolation between customers (their privilege events must not appear in another customer's evidence package).

## Design Direction

See `DESIGN.md` for this project's design tokens (a Clerk-derived dark palette — appropriate for an identity/security product, where the visual register signals "trustworthy" before any page copy is read).

## Constraints

- **Hosted on Entra ID.** The product runs *natively* on Entra ID; it does not replace Entra as the source of truth and does not deploy brokers or agents. The constraint is policy-level: every elevation must terminate in an Entra PIM API call, not in a parallel role store.
- **Three named frameworks.** HIPAA, SOC 2, and NIST SP 800-53 are the evidence contracts the MVP must satisfy. Adding a fourth framework (ISO 27001, PCI DSS) is MVP-out-of-scope, even if asked early.
- **No separate infra.** The deployment shape promised in the source is "minutes without infrastructure, add-ons, or services"; everything (console, policy engine, audit ledger) lives in the Huntoso tenant, not in the customer's.
- **Pricing must undercut legacy PAM.** The source states "reduce total cost compared to legacy PAM vendors"; the MVP pricing shape must prove that on a per-elevated-event basis, not just on the headline seat licence.
- **Single-tenant data isolation.** Customer evidence must not be cross-leakable at row level; the audit ledger is per-tenant before any aggregate view.
