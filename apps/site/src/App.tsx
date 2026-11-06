/**
 * AI-OS landing: header and hero, built from proven pieces (aios-ui-design step 4/5):
 * shadcn Button + Badge, Magic UI Terminal (MIT, magicuidesign/magicui). Copy is the current
 * site's; brand tokens from context/06_brand.md (index.css).
 */
import { Check, Copy } from 'lucide-react'
import { useState } from 'react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { AnimatedSpan, Terminal, TypingAnimation } from '@/components/ui/terminal'
import stats from './stats.json'
import { Closing, Footer, Install, Method, OneRepo, Plansmith, RunsItself, WhatItIs } from './sections'

const COMMAND = 'npx @edd_remonts/create-ai-os'
const INSTALL_LOG = [
  `✓ ${stats.brew_core} brew packages · zsh · p10k`,
  `✓ ${stats.skills_linked} skills → claude · codex · gemini · hermes`,
  `✓ ${stats.mcp_enabled} MCP servers generated`,
  '✓ 19/19 required checks passed, ready.',
]

function CopyCommand() {
  const [copied, setCopied] = useState(false)
  const copy = async () => {
    try {
      await navigator.clipboard.writeText(COMMAND)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      /* no clipboard (insecure context): the command stays visible to copy by hand */
    }
  }
  return (
    <Button size="lg" onClick={copy} className="h-12 max-w-full gap-2.5 px-4 font-mono text-[13px] sm:gap-3 sm:px-5 sm:text-[15px]">
      <span aria-hidden="true" className="hidden opacity-60 sm:inline">$</span>
      {COMMAND}
      {copied ? <Check className="size-4" aria-hidden="true" /> : <Copy className="size-4" aria-hidden="true" />}
      <span className="sr-only" aria-live="polite">{copied ? 'Copied' : ''}</span>
    </Button>
  )
}

export default function App() {
  return (
    <div className="min-h-dvh bg-background text-foreground">
      <header className="mx-auto flex h-16 max-w-6xl items-center justify-between px-5 md:px-8">
        <a href="#top" className="font-semibold tracking-tight">
          <span className="text-primary" aria-hidden="true">◆</span> AI-OS
        </a>
        <Button variant="outline" size="sm" nativeButton={false} render={<a href="https://github.com/eddremonts86/ai-os" />}>
          GitHub
        </Button>
      </header>

      <main>
      <section id="top" className="mx-auto flex max-w-6xl flex-col justify-center px-5 pb-20 pt-10 md:px-8 lg:min-h-[calc(100dvh-4rem)] lg:pt-0">
        <div className="flex flex-wrap gap-2">
            <Badge variant="outline">Karpathy method</Badge>
            <Badge variant="outline">6 AI CLIs</Badge>
            <Badge variant="outline">Mac · Win · Linux</Badge>
        </div>
        <h1 className="mt-6 max-w-[18ch] text-balance text-4xl font-semibold leading-[1.02] tracking-tight md:text-6xl lg:max-w-none lg:text-7xl">
          Your AI setup, booted like an <span className="text-primary">operating system</span>.
        </h1>
        <div className="mt-10 grid items-start gap-12 lg:grid-cols-[1fr_1.1fr] lg:gap-16 [&>*]:min-w-0">
        <div>
          <p className="max-w-[46ch] text-lg leading-relaxed text-muted-foreground">
            One command restores your context, {stats.skills_linked} skills and {stats.mcp_enabled} MCP servers across six AI CLIs, on a brand-new Mac.
          </p>
          <div className="mt-9 flex flex-wrap items-center gap-4">
            <CopyCommand />
            <a href="#install" className="inline-flex min-h-11 items-center text-sm font-medium text-muted-foreground underline-offset-4 hover:text-foreground hover:underline">
              See what it installs
            </a>
          </div>
        </div>

        <Terminal className="w-full max-w-none border-border bg-card font-mono text-[13px] [&_code]:whitespace-pre-wrap [&_pre]:overflow-visible [&_pre]:whitespace-pre-wrap">
          <TypingAnimation>{`$ ${COMMAND}`}</TypingAnimation>
          {INSTALL_LOG.map((line) => (
            <AnimatedSpan key={line} className={line.includes('ready') ? 'text-primary' : 'text-muted-foreground'}>
              {line}
            </AnimatedSpan>
          ))}
        </Terminal>
        </div>
      </section>
      <OneRepo />
      <WhatItIs />
      <Method />
      <Plansmith />
      <RunsItself />
      <Install />
      <Closing />
      </main>
      <Footer />
    </div>
  )
}
