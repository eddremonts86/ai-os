---
id: "2392"
slug: what-a-fullstack-dev-should-know-about-security
title: What a fullstack dev should know about security?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49408476"
category: ask-hn
date: "2026-08-23"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# What a fullstack dev should know about security?

## Problem

Hi all,I am asked to help a fullstack dev team (Spring+Angular) to skill up in term of security.I am skeptical about fullstack profiles, how many fullstack devs knows in depth display:flex and in the same time transaction isolation level ?So as fullstack devs they are not supposed to become cyber-security experts in their company but since they don't have a cyber-security expert they must level up so they don't put their company at risk. Even if they hire one they must know all the basics that are related to development so they will be able to follow their cyber-security expert recommendations. They are not newbies, for instance they know about sql injection.Here is my checklist (I'll help them to learn all of that), what to you think ? There will be half theory and half practice.Introduction * Cryptography and security: two distinct domains.
 * Wording: hashing, encryption, key, certificate, signature, foward secrecy, CVC, zero thrust.
 * OWASP Top Ten 2025 and CWC Top 25 2025.
 * Security at the network level, security at the application level;
 * Tools to detect vulnerabilities: SAST, DAST et IAST ;
 * A few algorithms: SHA, AES, RSA, Elliptic curve encryption. Use cases and performances;
 * « Think like a hacker », case study: Spring4Shell (CVE-2022-22965).

Secure a REST API: * embedded webserver configuration:
 ◦ TLS activation (key generation, certificate, server configuration, handshake steps)
 ◦ limits on HTTP requests (headers size, parameters, body size, parts)
 ◦ unfair use mitigation (rate limiting, timeouts, virtual threads usage);
 ◦ log management
 * Authentication :
 ◦ password protection: hashing, salt, cost, algorithms (Bcrypt, Scrypt, Argon, Pbkdf2)
 ◦ cookie authentication
 ◦ token authentication (generation, signature, validation, revocations);
 ◦ hybrid authentication (Cookie + JWT) with token relay;
 * Attacks (XSS, CRSF, log injection, sql injection, authorization bypass...) and how to mitigate them;
 * Definition of a CORS policy;
 * Introduction to mutual TLS for internal calls between API (est-west traffic).

Encrypt data: * Keywords of encryption: confidentiality, authenticity, integrity, non-repudiation;
 * Description of a public key infrastructure, with or without KMS, with or without HSM.
 * Chicken and egg problem, key exchange with Diffie Hellman ;
 * Exchange of encrypted data with CMS (Cryptographic Message Syntax) ;
 * database encryption: file encryption or row level encryption.

Apply CI/CD best practices: * SBOM generation and upload on DependencyTrack;
 * scan as a step in the CI pipeline;
 * secrets management in production
 ◦ vault (Hashicorp vault) and/or Spring Cloud Config server ;
 ◦ decryption on application startup with Jasypt ;
 ◦ introduction to secret management with Kubernetes.

Secure an Angular SPA * hash SRI and content security policy (CSP) for script inclusion;
 * strict template checking;
 * data sanitization;
 * CSRF mitigation (involves the API and the Angular client);
 * guards configuration;
 * protection, usage and renewal of JWT.
 * ensure integrity of the HTTP Client.

I also think about subtle attacks that don't put a system down but can add load on the backend. Example: if sql pagination is done with offset and limit (rather than key based pagination) a HTTP request GET /items?offset=100000000&limit=10 (which is valid) will bring unexpected load on the database server if repeated often. Plus all the time lost in understanding the cause of this higher load. What is important in this example is: 1) use key based pagination, 2) detect suspicious activity (multiple http requests with very high offset is suspicious).Do you think I forget something ? Thanks for your feedback !

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
