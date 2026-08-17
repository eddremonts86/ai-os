---
id: "2449"
slug: mysql-operator-helm-chart-breaks-deployments-by-only-ke
title: MySQL-operator helm chart breaks deployments by only keeping latest version
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49265715"
category: ask-hn
date: "2026-08-11"
tags: [Ask HN, Problem]
---
# MySQL-operator helm chart breaks deployments by only keeping latest version

## Problem

mysql-operator helm charts new release will keep only the latest version. Old chart version tags get removed,which breaks compatibility.# helm repo add mysql-operator https://mysql.github.io/mysql-operator/
"mysql-operator" has been added to your repositories# helm search repo mysql-operator --versionsNAME CHART VERSION APP VERSION DESCRIPTION
mysql-operator/mysql-operator 2.3.0 26.7.0-2.3.0 MySQL Operator Helm Chart for deploying MySQL I...
mysql-operator/mysql-innodbcluster 2.3.0 26.7.0 MySQL InnoDB Cluster Helm Chart for deploying M...

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
