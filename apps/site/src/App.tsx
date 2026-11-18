/**
 * AI-OS landing: header and hero, built from proven pieces (aios-ui-design step 4/5):
 * shadcn Button + Badge, and a Stageshow install demo (src/stageshow, MIT kit). Copy is the current
 * site's; brand tokens from context/global/06_brand.md (index.css).
 */
import { ArrowDown, Check, Copy } from 'lucide-react'
import { lazy, Suspense, useState } from 'react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import stats from './stats.json'
import { Closing, Footer, Install, Method, OneRepo, Plansmith, RunsItself, WhatItIs } from './sections'

// Loaded after first paint: the kit would push first-load JS+CSS past the e2e gzip budget
const InstallDemo = lazy(() => import('./stageshow/InstallDemo'))

const COMMAND = 'npx @edd_remonts/create-ai-os'

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
    <Button size="lg" onClick={copy} className="h-12 w-full max-w-full justify-center gap-2.5 px-4 sm:w-auto font-mono text-[13px] sm:gap-3 sm:px-5 sm:text-[15px]">
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
      <header className="mx-auto flex h-16 max-w-7xl items-center justify-between px-5 md:px-8">
        <a href="#top" className="font-semibold tracking-tight">
          <span className="text-primary" aria-hidden="true">◆</span> AI-OS
        </a>
        <Button variant="outline" size="sm" nativeButton={false} render={<a href="https://github.com/eddremonts86/ai-os" />}>
          GitHub
        </Button>
      </header>

      <main>
      <section id="top" className="relative mx-auto flex max-w-7xl flex-col px-5 py-12 md:px-8 lg:min-h-[calc(100dvh-4rem)]">
        <div className="grid flex-1 items-center gap-12 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.15fr)] lg:gap-14 [&>*]:min-w-0">
          <div>
            <h1 className="max-w-[18ch] text-balance text-4xl font-semibold leading-[1.02] tracking-tight md:text-6xl lg:max-w-none">
              Your AI setup, booted like an <span className="text-primary">operating system</span>.
            </h1>
            <p className="mt-6 max-w-[46ch] text-lg leading-relaxed text-muted-foreground md:text-xl">
              One command restores your context, {stats.skills_linked} skills and {stats.mcp_enabled} MCP servers across six AI CLIs, on a brand-new Mac.
            </p>
            <div className="mt-9 flex flex-wrap items-center gap-x-6 gap-y-2">
              <CopyCommand />
              <a href="#install" className="inline-flex min-h-11 items-center text-sm font-medium text-muted-foreground underline-offset-4 hover:text-foreground hover:underline">
                See what it installs
              </a>
            </div>
            <div className="mt-8 flex flex-wrap gap-2">
              <Badge variant="outline">Karpathy method</Badge>
              <Badge variant="outline">6 AI CLIs</Badge>
              <Badge variant="outline">Mac, Win, Linux</Badge>
            </div>
          </div>

          {/* data-ss-fill: the stage grows to the column instead of stopping at its 600px design size */}
          <figure data-ss-fill className="m-0 overflow-hidden rounded-xl border border-border bg-card" aria-label={`Installing AI-OS: ${stats.skills_linked} skills linked into Claude Code, Codex, Gemini and Hermes, then Ready.`}>
            {/* The fallback holds the demo's 600x380 box, so nothing below moves when it arrives */}
            <Suspense fallback={<div className="mx-auto aspect-[600/380] w-full max-w-[600px] bg-background" />}>
              <InstallDemo />
            </Suspense>
          </figure>
        </div>
        {/* The hero fills the screen: say there is more below */}
        <a href="#how" className="mt-10 flex flex-col items-center gap-1 self-center text-xs font-medium text-muted-foreground transition-colors hover:text-foreground">
          How it works
          <ArrowDown className="size-4 motion-safe:animate-bounce" aria-hidden="true" />
        </a>
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
