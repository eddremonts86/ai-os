import { act, fireEvent, render, screen, within } from '@testing-library/react'
import { describe, expect, it } from 'vitest'
import { showAllInView } from '@/test/browser-mocks'
import { createAiOsPackage, readRepoFile, repoFileExists, sitePublicFileExists } from '@/test/repo'
import { Closing, Footer, Install, Method, OneRepo, Plansmith, RunsItself, WhatItIs } from '../sections'
import stats from '../stats.json'

const REPO = 'https://github.com/eddremonts86/ai-os'
const BOOTSTRAP = `npx ${createAiOsPackage.name}`

describe('OneRepo', () => {
  it('names the six CLIs, the six repo folders and the runtime pieces', () => {
    render(<OneRepo />)
    for (const name of ['Claude Code', 'Codex', 'Gemini', 'Antigravity', 'MiniMax', 'Hermes']) {
      expect(screen.getByText(name)).toBeTruthy()
    }
    for (const dir of ['context/', 'rules/', 'workflows/', 'verifiers/', 'ai-config/', 'dev-env/']) {
      expect(screen.getByText(dir)).toBeTruthy()
    }
    expect(screen.getByText(`${stats.mcp_enabled} MCP servers`)).toBeTruthy()
    expect(screen.getByText('FalkorDB')).toBeTruthy()
  })

  it('is the section the page calls "how" and has an h2 heading', () => {
    const { container } = render(<OneRepo />)
    expect(container.querySelector('section#how')).toBeTruthy()
    expect(screen.getByRole('heading', { level: 2 }).textContent).toMatch(/One repo/)
  })

  it('draws one beam per link: CLIs to AI-OS, AI-OS to repo, repo to runtime', () => {
    const { container } = render(<OneRepo />)
    expect(container.querySelectorAll('svg.pointer-events-none')).toHaveLength(3)
  })

  it('hides the decorative beam ports from assistive technology', () => {
    const { container } = render(<OneRepo />)
    const ports = container.querySelectorAll('.rounded-full.border-primary')
    expect(ports).toHaveLength(6)
    ports.forEach((port) => expect(port.getAttribute('aria-hidden')).toBe('true'))
  })

  it('marks only the AI-OS node as the accent', () => {
    render(<OneRepo />)
    const nodeOf = (name: string) => screen.getByText(name).parentElement!
    expect(nodeOf('AI-OS').className).toContain('border-primary')
    expect(nodeOf('Claude Code').className).not.toContain('border-primary')
    expect(nodeOf('Claude Code').className).toContain('border-border')
  })

  it('anchors each beam on the panel edge it leaves from or arrives at', () => {
    const { container } = render(<OneRepo />)
    const sides = [...container.querySelectorAll('.rounded-full.border-primary')].map((port) =>
      port.className.includes('-top-[5px]') ? 'top' : port.className.includes('-bottom-[5px]') ? 'bottom' : 'none',
    )
    // CLIs out, AI-OS in/out, repo in/out, runtime in
    expect(sides).toEqual(['bottom', 'top', 'bottom', 'top', 'bottom', 'top'])
  })

  it('sends three packets along each beam, the second one travelling the other way', () => {
    const { container } = render(<OneRepo />)
    const beams = [...container.querySelectorAll('svg.pointer-events-none')]
    expect(beams).toHaveLength(3)
    for (const beam of beams) {
      const packets = [...beam.querySelectorAll('path[stroke-dasharray]')]
      expect(packets.map((path) => path.getAttribute('stroke'))).toEqual(['#b3ee55', '#3bdfef', '#f4f5f9'])
      expect(packets.map((path) => path.getAttribute('stroke-dashoffset'))).toEqual(['0.1', '-1', '0.1'])
    }
  })

  it('says Hermes reads skills in place while the other CLIs get symlinks', () => {
    render(<OneRepo />)
    expect(screen.getByText(/Hermes reads the skills in place.*symlinks, never copies/)).toBeTruthy()
  })
})

describe('WhatItIs', () => {
  it('renders the four cards as h3 headings', () => {
    render(<WhatItIs />)
    expect(screen.getAllByRole('heading', { level: 3 }).map((h) => h.textContent)).toEqual([
      'Spec → Verifier → Environment',
      'Skills and agents, every CLI',
      'MCP and dotfiles as code',
      'Framework above, products below',
    ])
  })

  it('takes its numbers from the published stats', () => {
    render(<WhatItIs />)
    expect(screen.getByText(new RegExp(`^${stats.superpowers} required superpowers`))).toBeTruthy()
    expect(screen.getByText(new RegExp(`^${stats.mcp_enabled} MCP servers as declarative YAML`))).toBeTruthy()
  })

  it('captions each card with a decorative trace', () => {
    const { container } = render(<WhatItIs />)
    const traces = [...container.querySelectorAll('[aria-hidden="true"].font-mono')]
    expect(traces.map((el) => el.textContent)).toEqual([
      'spec → plan → execute → verify',
      'ai-config/skills',
      'ai-config/mcp/*.yaml',
      'apps/ ← products',
    ])
  })

  it('has no lead paragraph under a title that has none', () => {
    const { container } = render(<WhatItIs />)
    expect(container.querySelector('section > p')).toBeNull()
  })

  it('links every card to a path inside the repo, twice (small screens and hover)', () => {
    const { container } = render(<WhatItIs />)
    const hrefs = [...container.querySelectorAll('a')].map((a) => a.getAttribute('href')!)
    expect(hrefs).toHaveLength(8)
    hrefs.forEach((href) => expect(href.startsWith(`${REPO}/`)).toBe(true))
  })

  it('links only to repo paths that exist', () => {
    const { container } = render(<WhatItIs />)
    const paths = new Set([...container.querySelectorAll('a')].map((a) => a.getAttribute('href')!.replace(/^.*\/(blob|tree)\/main\//, '')))
    expect(paths.size).toBe(4)
    paths.forEach((p) => expect(repoFileExists(p), p).toBe(true))
  })
})

describe('Section lead', () => {
  it('is rendered under the title when given', () => {
    const { container } = render(<Method />)
    expect(container.querySelector('section > p')!.textContent).toBe('Spec quality first, verifier passes second, runtime evidence third.')
  })
})

describe('Method', () => {
  it('is a numbered list of the four loop steps in order', () => {
    const { container } = render(<Method />)
    const items = [...container.querySelectorAll('ol > li')]
    expect(items.map((li) => li.querySelector('div')!.textContent)).toEqual(['1. Spec', '2. Plan', '3. Execute', '4. Verify'])
    items.forEach((li) => expect(li.querySelector('h3')!.textContent).not.toBe(''))
  })
})

describe('Plansmith', () => {
  it('shows the screenshot with alt text, intrinsic size and lazy loading', () => {
    render(<Plansmith />)
    const img = screen.getByRole('img')
    expect(img.getAttribute('src')).toBe('/img/plansmith-og.png')
    expect(img.getAttribute('alt')).toMatch(/Plansmith/)
    expect(img.getAttribute('width')).toBe('1200')
    expect(img.getAttribute('height')).toBe('630')
    expect(img.getAttribute('loading')).toBe('lazy')
  })

  it('serves a screenshot that exists in public/', () => {
    expect(sitePublicFileExists('img', 'plansmith-og.png')).toBe(true)
  })

  it('tells the before, split and now timeline in order', () => {
    const { container } = render(<Plansmith />)
    const labels = [...container.querySelectorAll('.font-mono.text-muted-foreground')].map((el) => el.textContent)
    expect(labels).toEqual(['before', 'split', 'now'])
  })

  it('opens Plansmith in a new tab without leaking the opener', () => {
    const { container } = render(<Plansmith />)
    const link = container.querySelector('a[href="https://plans.eduardoinerarte.dk"]')!
    expect(link.getAttribute('target')).toBe('_blank')
    expect(link.getAttribute('rel')).toContain('noopener')
  })
})

describe('RunsItself', () => {
  const COMMANDS = ['ai-os health', 'ai-os backup', 'ai-os secrets', 'setup/hooks/pre-push', 'ai-os update', 'ai-os skills']

  it('lists the six self-maintenance duties, each with its command', () => {
    const { container } = render(<RunsItself />)
    expect([...container.querySelectorAll('code')].map((c) => c.textContent)).toEqual(COMMANDS)
    expect(screen.getAllByRole('heading', { level: 3 })).toHaveLength(6)
  })

  it.each(COMMANDS.filter((c) => c.startsWith('ai-os ')))('"%s" is a real subcommand of the ai-os launcher', (command) => {
    const sub = command.split(' ')[1]
    expect(readRepoFile('ai-os')).toMatch(new RegExp(`^\\s+${sub}\\)`, 'm'))
  })

  it('names a pre-push hook that exists', () => {
    expect(repoFileExists('setup', 'hooks', 'pre-push')).toBe(true)
  })
})

describe('Install', () => {
  const tabs = () => screen.getAllByRole('tab')

  it('offers macOS, Windows and Linux tabs, with macOS selected first', () => {
    render(<Install />)
    expect(tabs().map((t) => t.textContent)).toEqual(['macOS', 'Windows', 'Linux'])
    expect(tabs()[0].getAttribute('aria-selected')).toBe('true')
    expect(tabs()[1].getAttribute('aria-selected')).toBe('false')
  })

  it('shows the macOS commands and not the Windows ones by default', () => {
    render(<Install />)
    expect(screen.getByText('bash setup/verify.sh')).toBeTruthy()
    expect(screen.queryByText(/powershell -ExecutionPolicy/)).toBeNull()
  })

  it('switches to the Windows commands when the Windows tab is chosen', () => {
    render(<Install />)
    fireEvent.click(tabs()[1])
    expect(tabs()[1].getAttribute('aria-selected')).toBe('true')
    expect(screen.getByText(/powershell -ExecutionPolicy Bypass/)).toBeTruthy()
    expect(screen.queryByText('bash setup/verify.sh')).toBeNull()
  })

  it.each([0, 1, 2])('tab %i bootstraps with the published package name', (index) => {
    render(<Install />)
    fireEvent.click(tabs()[index])
    expect(screen.getByText(BOOTSTRAP)).toBeTruthy()
  })

  it('styles comments as muted, the bootstrap line as primary and other lines plainly', () => {
    const { container } = render(<Install />)
    const line = (text: string) => screen.getByText(text, { selector: 'pre div' }) as HTMLElement
    expect(line('# bootstrap: clones and runs the Mac installer').className).toContain('text-muted-foreground')
    expect(line(BOOTSTRAP).className).toContain('text-primary')
    expect(line('cd ai-os').className).toBe('')
    expect(container.querySelectorAll('pre div')).toHaveLength(7)
  })

  it('verifies with scripts that exist', () => {
    expect(repoFileExists('setup', 'verify.sh')).toBe(true)
    expect(repoFileExists('setup', 'verify-windows.ps1')).toBe(true)
  })

  it('lists the five manifest counts straight from the stats', () => {
    const { container } = render(<Install />)
    const items = [...container.querySelectorAll('ul > li')]
    const shown = items.map((li) => [li.querySelector('.sr-only')!.textContent, li.querySelectorAll('div')[1].textContent])
    const fmt = (n: number) => n.toLocaleString('en-US')
    expect(shown).toEqual([
      [fmt(stats.brew_total), 'CLI tools and runtimes'],
      [fmt(stats.npm_globals), 'Global Node packages'],
      [fmt(stats.pip_packages), 'Python packages'],
      [fmt(stats.skills_linked), 'AI skills'],
      [fmt(stats.commands), 'Global commands'],
    ])
  })

  it('is the target of the hero "See what it installs" anchor', () => {
    const { container } = render(<Install />)
    expect(container.querySelector('section#install')).toBeTruthy()
  })

  it('counts the numbers up when scrolled into view and ends on the real values', async () => {
    const { container } = render(<Install />)
    act(() => showAllInView())
    const visible = [...container.querySelectorAll('ul > li [aria-hidden="true"]')]
    expect(visible.map((el) => el.textContent)).toEqual(visible.map(() => '0'))
  })
})

describe('Closing and Footer', () => {
  it('invites the visitor to the repository with a link that goes there', () => {
    const { container } = render(<Closing />)
    expect(screen.getByRole('heading', { level: 2 }).textContent).toBe('Reboot your workflow.')
    expect(container.querySelector('a')!.getAttribute('href')).toBe(REPO)
  })

  it('states the MIT licence, which the repository actually carries', () => {
    render(<Footer />)
    expect(within(screen.getByRole('contentinfo')).getByText(/MIT licence/)).toBeTruthy()
    expect(readRepoFile('LICENSE')).toMatch(/^MIT License/)
  })
})
