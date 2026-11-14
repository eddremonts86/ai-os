// Facts about the rest of the repo that the landing page states, so tests can check them against reality.
import { existsSync, readFileSync } from 'node:fs'
import path from 'node:path'

// Walk up to the CLAUDE.md marker (the repo convention) instead of counting `..` hops.
function findRoot(from: string): string {
  let dir = from
  while (!existsSync(path.join(dir, 'CLAUDE.md'))) {
    const parent = path.dirname(dir)
    if (parent === dir) throw new Error(`no CLAUDE.md found above ${from}`)
    dir = parent
  }
  return dir
}

const ROOT = findRoot(import.meta.dirname)

export const repoFileExists = (...segments: string[]) => existsSync(path.join(ROOT, ...segments))
export const readRepoFile = (...segments: string[]) => readFileSync(path.join(ROOT, ...segments), 'utf8')
export const sitePublicFileExists = (...segments: string[]) => existsSync(path.resolve(import.meta.dirname, '../../public', ...segments))

/** The published bootstrap package the page tells visitors to run. */
export const createAiOsPackage: { name: string; version: string } = JSON.parse(readRepoFile('apps', 'create-ai-os', 'package.json'))
