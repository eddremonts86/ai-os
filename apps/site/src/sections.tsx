/**
 * AI-OS landing: every section after the hero, built from proven pieces only:
 * shadcn (Card, Tabs, Badge, Button, Separator) and Magic UI (AnimatedBeam, BentoGrid,
 * NumberTicker). Every number comes from stats.json (ai-os stats --write).
 */
import {
  Activity,
  ArrowUpRight,
  Boxes,
  FileCode2,
  GitBranch,
  HardDriveDownload,
  KeyRound,
  Layers,
  RefreshCcw,
  Route,
  ShieldCheck,
  Sparkles,
} from 'lucide-react'
import { useRef } from 'react'
import { AnimatedBeam } from '@/components/ui/animated-beam'
import { BentoCard, BentoGrid } from '@/components/ui/bento-grid'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { NumberTicker } from '@/components/ui/number-ticker'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import stats from './stats.json'

const REPO = 'https://github.com/eddremonts86/ai-os'

function Section({ id, title, lead, children }: { id?: string; title: string; lead?: string; children: React.ReactNode }) {
  return (
    <section id={id} className="mx-auto max-w-6xl scroll-mt-16 border-t border-border px-5 py-20 md:px-8 md:py-28">
      <h2 className="max-w-[24ch] text-balance text-3xl font-semibold tracking-tight md:text-5xl">{title}</h2>
      {lead && <p className="mt-5 max-w-[60ch] text-lg leading-relaxed text-muted-foreground">{lead}</p>}
      <div className="mt-12">{children}</div>
    </section>
  )
}

/* ---------- one repo, every CLI (Magic UI AnimatedBeam), with the old system map's detail ---------- */

const REPO_DIRS = ['context/', 'rules/', 'workflows/', 'verifiers/', 'ai-config/', 'dev-env/']
const CLIS = ['Claude Code', 'Codex', 'Gemini', 'Antigravity', 'MiniMax', 'Hermes']
const RUNTIME = [`${stats.mcp_enabled} MCP servers`, 'FalkorDB', 'Ollama', 'Code indexers']

function Node({ title, accent = false }: { title: string; accent?: boolean }) {
  return (
    <div className={`flex min-h-12 flex-col justify-center rounded-lg border px-3 py-2 text-center ${accent ? 'border-primary bg-primary/10' : 'border-border bg-card'}`}>
      <div className={`text-sm font-semibold ${accent ? 'text-primary' : ''}`}>{title}</div>
    </div>
  )
}

/** A dot on a panel edge: beams start and end here, so they never cross a panel's content. */
function Port({ ref, side }: { ref: React.Ref<HTMLDivElement>; side: 'top' | 'bottom' }) {
  return (
    <div
      ref={ref}
      aria-hidden="true"
      className={`absolute left-1/2 z-20 size-2.5 -translate-x-1/2 rounded-full border-2 border-primary bg-background ${side === 'top' ? '-top-[5px]' : '-bottom-[5px]'}`}
    />
  )
}

function Group({ label, note, children, className = '' }: { label: string; note: string; children: React.ReactNode; className?: string }) {
  return (
    <div className={`relative rounded-xl border border-border bg-background p-4 ${className}`}>
      <div className="mb-3 flex flex-wrap items-baseline justify-between gap-x-3 gap-y-1 font-mono text-[11px]">
        <span className="uppercase tracking-wider text-foreground">{label}</span>
        <span className="text-muted-foreground">{note}</span>
      </div>
      {children}
    </div>
  )
}

/** Three requests per link, so it reads as two-way traffic: acid down, cyan up, ink down. */
const traffic = (offset: number) => [
  { color: '#b3ee55', delay: offset, duration: 2.2 },
  { color: '#3bdfef', reverse: true, delay: offset + 1.1, duration: 2.6 },
  { color: '#f4f5f9', delay: offset + 2, duration: 3 },
]

export function OneRepo() {
  const container = useRef<HTMLDivElement>(null)
  const cliOut = useRef<HTMLDivElement>(null)
  const osIn = useRef<HTMLDivElement>(null)
  const osOut = useRef<HTMLDivElement>(null)
  const repoIn = useRef<HTMLDivElement>(null)
  const repoOut = useRef<HTMLDivElement>(null)
  const rtIn = useRef<HTMLDivElement>(null)
  const beam = { containerRef: container, pathOpacity: 0.3 }
  return (
    <Section
      id="how"
      title="One repo. Every CLI reads the same skills."
      lead="Every AI CLI talks to AI-OS. AI-OS reads one git-versioned repo for skills, rules and context, and runs the local runtime: MCP servers and memory. Every CLI then behaves alike."
    >
      <div ref={container} className="relative grid gap-20 rounded-xl border border-border bg-card/40 p-4 md:gap-28 md:p-8">
        <Group label="Your AI CLIs" note="same skills everywhere">
          <div className="grid grid-cols-2 gap-2 md:grid-cols-3 lg:grid-cols-6">
            {CLIS.map((title) => <Node key={title} title={title} />)}
          </div>
          <Port ref={cliOut} side="bottom" />
        </Group>

        <div className="relative mx-auto w-full max-w-xs">
          <Port ref={osIn} side="top" />
          <Node title="AI-OS" accent />
          <Port ref={osOut} side="bottom" />
        </div>

        <Group label="ai-os repo" note="the source of truth, git-versioned">
          <Port ref={repoIn} side="top" />
          <div className="grid grid-cols-2 gap-2 md:grid-cols-3 lg:grid-cols-6">
            {REPO_DIRS.map((title) => <Node key={title} title={title} />)}
          </div>
          <Port ref={repoOut} side="bottom" />
        </Group>

        <Group label="Runtime" note="MCP servers + memory">
          <Port ref={rtIn} side="top" />
          <div className="grid grid-cols-2 gap-2 lg:grid-cols-4">
            {RUNTIME.map((title) => <Node key={title} title={title} />)}
          </div>
        </Group>

        <AnimatedBeam {...beam} fromRef={cliOut} toRef={osIn} packets={traffic(0)} />
        <AnimatedBeam {...beam} fromRef={osOut} toRef={repoIn} packets={traffic(0.6)} />
        <AnimatedBeam {...beam} fromRef={repoOut} toRef={rtIn} packets={traffic(1.1)} />
      </div>
      <p className="mt-4 text-sm text-muted-foreground">Hermes reads the skills in place (external_dirs); every other CLI gets symlinks, never copies.</p>
    </Section>
  )
}

/* ---------- what it is (Magic UI BentoGrid) ---------- */

function Trace({ children }: { children: string }) {
  return (
    <div className="absolute left-20 right-4 top-4 truncate text-right font-mono text-xs text-muted-foreground/70" aria-hidden="true">
      {children}
    </div>
  )
}

export function WhatItIs() {
  const cards = [
    {
      name: 'Spec → Verifier → Environment',
      description: "Karpathy's framework as recurring workflows, hard rules and verifier gates. One active Spec at a time; nothing ships without a runtime check.",
      Icon: Route, href: `${REPO}/blob/main/CLAUDE.md`, cta: 'Read the method', className: 'md:col-span-2',
      background: <Trace>spec → plan → execute → verify</Trace>,
    },
    {
      name: 'One source of truth, every CLI',
      description: `${stats.superpowers} required superpowers plus curated and vendored skills, symlinked into six CLIs. Project skills stay in their own repos.`,
      Icon: Layers, href: `${REPO}/tree/main/ai-config/skills`, cta: 'Browse the skills', className: 'md:col-span-1',
      background: <Trace>ai-config/skills</Trace>,
    },
    {
      name: 'MCP and dotfiles as code',
      description: `${stats.mcp_enabled} MCP servers as declarative YAML, generated at install, including a local graph memory and semantic code search. zsh, Warp, Brewfile and git config in the same repo.`,
      Icon: FileCode2, href: `${REPO}/tree/main/ai-config/mcp`, cta: 'See the config', className: 'md:col-span-1',
      background: <Trace>ai-config/mcp/*.yaml</Trace>,
    },
    {
      name: 'Framework above, products below',
      description: 'Everything above apps/ is the operating system. What it builds lives under apps/ until it needs its own release cadence, then it splits out.',
      Icon: Boxes, href: `${REPO}/blob/main/docs/repo-layout.md`, cta: 'Repo layout', className: 'md:col-span-2',
      background: <Trace>apps/ ← products</Trace>,
    },
  ]
  return (
    <Section title="Everything AI in your workflow, in one git repo.">
      <BentoGrid className="auto-rows-auto grid-cols-1 md:grid-cols-3 lg:auto-rows-[15rem]">
        {cards.map((c) => (
          <BentoCard key={c.name} {...c} />
        ))}
      </BentoGrid>
    </Section>
  )
}

/* ---------- the method (real sequence, so numbered) ---------- */

const STEPS = [
  { k: 'Spec', t: 'Define the objective', d: 'For work over about 2 hours or across repos: one active spec with objective, acceptance criteria, non-goals and risks.' },
  { k: 'Plan', t: 'Break into steps', d: 'Small, checkable steps, dispatched in parallel when independent.' },
  { k: 'Execute', t: 'Step by step', d: 'Verify after each step. Sub-agents self-report; you check the handles.' },
  { k: 'Verify', t: 'Gates per task', d: 'A fresh reviewer, the runtime gate, evidence before "done".' },
]

export function Method() {
  return (
    <Section title="Every substantial task runs the same loop." lead="Spec quality first, verifier passes second, runtime evidence third.">
      <ol className="grid gap-px overflow-hidden rounded-xl border border-border bg-border md:grid-cols-4">
        {STEPS.map((s, i) => (
          <li key={s.k} className="bg-background p-6">
            <div className="font-mono text-sm text-primary">
              {i + 1}. {s.k}
            </div>
            <h3 className="mt-3 text-lg font-semibold">{s.t}</h3>
            <p className="mt-2 text-sm leading-relaxed text-muted-foreground">{s.d}</p>
          </li>
        ))}
      </ol>
    </Section>
  )
}

/* ---------- built with it (shadcn Card + the real screenshot) ---------- */

export function Plansmith() {
  const timeline = [
    ['before', 'One repo, 2 deployed products, a corpus growing daily under apps/data/.'],
    ['split', 'A same-day extraction: fresh history, same internal paths, verified green before a single file moved.'],
    ['now', 'A separate repo, its own deploy pipeline and 3 live services. AI-OS is one product lighter.'],
  ]
  return (
    <Section title="The proof isn't a demo. It's a product that outgrew the framework.">
      <Card className="grid overflow-hidden p-0 lg:grid-cols-2">
        <img
          src="/img/plansmith-og.png"
          alt="Plansmith: search and filters over 900+ product-idea plans, each scored for money, learning and fun."
          width={1200}
          height={630}
          loading="lazy"
          className="h-full w-full object-cover"
        />
        <div className="p-6 md:p-8">
          <CardHeader className="p-0">
            <CardTitle className="text-2xl">Plansmith</CardTitle>
            <CardDescription className="text-base">
              Started as one more directory under apps/ and ran the same loop, one 30-minute block at a time, until it
              needed its own release cadence.
            </CardDescription>
          </CardHeader>
          <CardContent className="mt-6 grid gap-4 p-0">
            {timeline.map(([k, v]) => (
              <div key={k} className="grid grid-cols-[4.5rem_1fr] gap-3 text-sm">
                <span className="font-mono text-muted-foreground">{k}</span>
                <span>{v}</span>
              </div>
            ))}
            <Button variant="outline" className="mt-2 w-fit" nativeButton={false} render={<a href="https://plans.eduardoinerarte.dk" target="_blank" rel="noopener" />}>
              Visit Plansmith <ArrowUpRight className="size-4" aria-hidden="true" />
            </Button>
          </CardContent>
        </div>
      </Card>
    </Section>
  )
}

/* ---------- runs itself ---------- */

const OPS = [
  { Icon: Activity, t: 'Health, twice a day', d: '15 functional checks at 09:30 and 15:30, with a desktop notification if one fails.', cmd: 'ai-os health' },
  { Icon: HardDriveDownload, t: 'Encrypted backups', d: 'Memory graph, secrets and Claude memory, daily and restore-checked, to iCloud and your own private repo.', cmd: 'ai-os backup' },
  { Icon: KeyRound, t: 'Secrets never pushed', d: 'The pre-push hook refuses any commit that contains a value from your .env.', cmd: 'ai-os secrets' },
  { Icon: ShieldCheck, t: 'A gate on every push', d: 'Syntax, skill frontmatter, unit tests and install dry-runs on the exact commit being pushed.', cmd: 'setup/hooks/pre-push' },
  { Icon: RefreshCcw, t: 'Updates that roll back', d: 'Nothing upgrades on its own; bump one component and it reverts if its checks fail.', cmd: 'ai-os update' },
  { Icon: Sparkles, t: 'A skill budget', d: 'Lint keeps the always-loaded skill text near 12K tokens and checks requests still reach the right skill.', cmd: 'ai-os skills' },
]

export function RunsItself() {
  return (
    <Section title="It looks after itself." lead="Each of these runs on a schedule or on every push, and is one command you can also run by hand.">
      <div className="grid gap-x-10 gap-y-10 sm:grid-cols-2 lg:grid-cols-3">
        {OPS.map(({ Icon, t, d, cmd }) => (
          <div key={t}>
            <Icon className="size-5 text-primary" aria-hidden="true" />
            <h3 className="mt-4 font-semibold">{t}</h3>
            <p className="mt-2 text-sm leading-relaxed text-muted-foreground">{d}</p>
            <code className="mt-3 inline-block font-mono text-xs text-muted-foreground">{cmd}</code>
          </div>
        ))}
      </div>
    </Section>
  )
}

/* ---------- install (shadcn Tabs + Magic UI NumberTicker) ---------- */

const INSTALL = {
  mac: ['# bootstrap: clones and runs the Mac installer', 'npx @edd_remonts/create-ai-os', 'cd ai-os', '', '# verify', 'bash setup/verify.sh', 'ai-os health'],
  windows: ['# PowerShell as Admin', 'npx @edd_remonts/create-ai-os', 'cd ai-os', '', 'powershell -ExecutionPolicy Bypass -File .\\setup\\verify-windows.ps1'],
  linux: ['# Debian / Ubuntu, same bootstrap', 'npx @edd_remonts/create-ai-os', 'cd ai-os', '', 'bash setup/verify.sh'],
}
const MANIFEST = [
  { n: stats.brew_total, l: 'CLI tools and runtimes', s: 'Homebrew' },
  { n: stats.npm_globals, l: 'Global Node packages', s: 'pnpm' },
  { n: stats.pip_packages, l: 'Python packages', s: 'isolated uv venv' },
  { n: stats.skills_linked, l: 'AI skills', s: 'symlinked into every CLI' },
  { n: stats.commands, l: 'Global commands', s: 'in every CLI with slash commands' },
]

export function Install() {
  return (
    <Section id="install" title="One command. Then verify." lead="Most of the 30 to 60 minutes of a first install is downloading packages. The installer lists everything and asks before touching anything.">
      <Tabs defaultValue="mac">
        <TabsList>
          <TabsTrigger value="mac">macOS</TabsTrigger>
          <TabsTrigger value="windows">Windows</TabsTrigger>
          <TabsTrigger value="linux">Linux</TabsTrigger>
        </TabsList>
        {Object.entries(INSTALL).map(([os, lines]) => (
          <TabsContent key={os} value={os}>
            <pre className="mt-4 overflow-x-auto rounded-xl border border-border bg-card p-5 font-mono text-[13px] leading-relaxed" tabIndex={0}>
              {lines.map((l, i) => (
                <div key={i} className={l.startsWith('#') ? 'whitespace-pre-wrap text-muted-foreground' : l.startsWith('npx') ? 'text-primary' : ''}>
                  {l || ' '}
                </div>
              ))}
            </pre>
          </TabsContent>
        ))}
      </Tabs>
      <ul className="mt-14 grid grid-cols-2 gap-x-8 gap-y-10 md:grid-cols-5">
        {MANIFEST.map((m) => (
          <li key={m.l}>
            <div className="text-4xl font-semibold tracking-tight">
              <NumberTicker value={m.n} className="text-foreground" />
            </div>
            <div className="mt-2 text-sm">{m.l}</div>
            <div className="text-xs text-muted-foreground">{m.s}</div>
          </li>
        ))}
      </ul>
    </Section>
  )
}

/* ---------- close ---------- */

export function Closing() {
  return (
      <section className="mx-auto max-w-6xl border-t border-border px-5 py-24 text-center md:px-8 md:py-32">
        <h2 className="text-balance text-4xl font-semibold tracking-tight md:text-6xl">Reboot your workflow.</h2>
        <p className="mx-auto mt-5 max-w-[52ch] text-lg text-muted-foreground">
          Stop reconfiguring six CLIs by hand. Put the method, the skills and the environment in one repo.
        </p>
        <Button size="lg" className="mt-9 h-12 px-6" nativeButton={false} render={<a href={REPO} />}>
          <GitBranch className="size-4" aria-hidden="true" /> github.com/eddremonts86/ai-os
        </Button>
      </section>
  )
}

export function Footer() {
  return (
    <footer className="mx-auto max-w-6xl border-t border-border px-5 py-8 text-sm text-muted-foreground md:px-8">
      AI-OS. MIT licence.
    </footer>
  )
}
