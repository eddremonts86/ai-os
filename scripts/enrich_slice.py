#!/usr/bin/env python3
"""Enrichment worker for agent-5 (ids 445-552). Reads source, writes per-plan
SPEC/PRODUCT/PLAN/TASKS docs, runs gate, writes report, appends PROGRESS.5.md line."""
import os, re, json, subprocess, sys
from datetime import datetime, timezone

REPO = '/Users/edd/Projects/ai-os'
CLI = f'{REPO}/ai-os'
PLANS = f'{REPO}/projects'
OUTPUTS = f'{REPO}/outputs/enrich'
PROGRESS = f'{REPO}/PROGRESS.5.md'

os.makedirs(OUTPUTS, exist_ok=True)

# Collect all plans in slice
plan_dirs = []
for entry in sorted(os.listdir(PLANS)):
    m = re.match(r'^(\d{3})-(.+)$', entry)
    if not m:
        continue
    pid = int(m.group(1))
    if pid < 445 or pid > 552:
        continue
    plan_dirs.append((pid, m.group(2), f'{PLANS}/{entry}'))
plan_dirs.sort()

print(f'Loaded {len(plan_dirs)} plans in slice.')

# Helper: run gate
def check(id_):
    r = subprocess.run([CLI, 'plans', 'check', '--id', str(id_), '--verbose'],
                       capture_output=True, text=True, cwd=REPO)
    return r.stdout, r.stderr

# Read each plan's source content
sources = {}
for pid, slug, pdir in plan_dirs:
    with open(f'{pdir}/SPEC.md') as f:
        spec = f.read()
    with open(f'{pdir}/PRODUCT.md') as f:
        prod = f.read()
    with open(f'{pdir}/PLAN.md') as f:
        plan_md = f.read()
    with open(f'{pdir}/TASKS.md') as f:
        tasks = f.read()
    sources[pid] = {
        'slug': slug,
        'dir': pdir,
        'spec': spec,
        'prod': prod,
        'plan_md': plan_md,
        'tasks': tasks,
    }

# Extract Problem and Value Proposition text for each plan
def extract_section(md, name):
    pattern = rf'## {re.escape(name)}\n(.*?)(?=\n## |\Z)'
    m = re.search(pattern, md, re.DOTALL)
    return m.group(1).strip() if m else ''

# Build per-plan problem/value/short summaries
summary = {}
for pid in [p[0] for p in plan_dirs]:
    s = sources[pid]
    p = extract_section(s['spec'], 'Problem')
    v = extract_section(s['prod'], 'Value Proposition')
    summary[pid] = {'problem': p, 'value': v}

# Persist sources/summary for downstream
with open('/tmp/agent5_sources.json', 'w') as f:
    json.dump(summary, f, indent=2)

print('Sources cached. Continuing to enrichment generation in next script.')