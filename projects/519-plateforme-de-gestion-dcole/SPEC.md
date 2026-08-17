---
id: "519"
slug: plateforme-de-gestion-dcole
title: Plateforme de gestion d’école
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3utd/plateforme_de_gestion_décole/"
category: saas
date: "2026-08-14"
---
# Plateforme de gestion d’école

## Problem

Je travaille depuis quelque temps sur SmartSchool, une plateforme de gestion destinée aux écoles privées africaines. https://www.smartschool.sn Le problème que j’essaie de résoudre est assez simple : dans beaucoup d’écoles, une partie de la gestion quotidienne repose encore sur un mélange de cahiers, Excel, WhatsApp et beaucoup de travail manuel. SmartSchool centralise notamment : - la gestion des élèves et des classes - le suivi des frais de scolarité et des paiements - les notes, moyennes et classements - la génération automatique des bulletins PDF - les notifications aux parents par SMS / WhatsApp - un tableau de bord pour suivre l'activité de l'école Le but n'est pas de faire un énième logiciel compliqué que personne n'utilise. On veut quelque chose de simple,accessible depuis un navigateur et réellement adapté aux réalités des écoles africaines. Le produit est déjà en production et nous proposons actuellement un mois d'essai gratuit, avec installation et formation de l'équipe incluses. Et si vous êtes directeur/directrice d'école ou responsable administratif, je serais vraiment intéressé de savoir quel est le processus qui vous fait perdre le plus de temps aujourd'hui. Pas besoin de me dire que SmartSchool est génial 😅 Si vous pensez qu'il manque quelque chose d'essentiel, dites-le-moi aussi. Je cherche surtout à parler à mes premiers vrais utilisateurs et à comprendre leurs problèmes, pas simplement à accumuler des visiteurs sur le site. contact@smartschool.sn submitted by /u/Lamassasx [link] [comments]

---

## Objective

Ship a French-language school management platform that handles enrollment, attendance, parent communication, and grade reporting for a single K-12 school or a small network (1-3 campuses), with a parent-facing portal that doesn't require training to use.

## Target Users

- Primary: a single K-12 school (private or public-charter equivalent) with 200-1,500 students, where the director and 5-15 teachers need to share one operational view.
- Secondary: small networks (1-3 campuses) where the director manages cross-campus reporting.

## MVP Scope

- Student records: enrollment, class assignment, parent contacts, medical/allergy flags.
- Attendance: daily check-in by teacher (mobile-friendly), absence alerts to parents.
- Grade book: per-class, per-period, with a parent-visible report card view.
- Parent portal: read-only view of attendance, grades, school announcements.
- Single-school tenancy in v1; multi-campus reporting is a stretch.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- French-language copy throughout, with French school-year conventions (trimestres/semestres).
- RGPD (GDPR-FR) compliant: data residency in France, parent consent flow, data export.
- Must work on the parents' phones without an app install (mobile web).
