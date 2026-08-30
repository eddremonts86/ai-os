# Local replica: keeping this Mac's Coolify level with `dev`

The middle step of the delivery pipeline (see the `dev-to-prod-pipeline` skill):

```
  work branch → dev → LOCAL REPLICA → PR → main → production
                       (you are here)
```

The replica is **confidence, not a gate**. It is each app running in a
production-shaped container on this machine, built from `dev`, so you can open
it and click through before anything goes near `main`. What blocks a merge is
CI — the guardian — which runs in GitHub Actions where a machine can enforce it.

## Why a poller

A GitHub-hosted runner cannot reach this Mac. No workflow will ever trigger the
local Coolify, and a webhook would mean exposing it to the internet to receive
one. A self-hosted runner would work but these repos are public, and a
self-hosted runner on a public repo lets a pull request from anyone execute code
on this machine.

So: a `launchd` job every two minutes, comparing `git ls-remote origin dev`
against the SHA it last deployed, and poking the local Coolify when they differ.
Nothing is exposed, nothing is registered with GitHub, and a Mac that was asleep
deploys on waking rather than losing the event.

## Install

```bash
bash setup/deploy/local-replica/launchd/install-poller.sh
```

Then create a token in the **local** Coolify (http://localhost:8000 → Keys &
Tokens → API tokens) and add to `dev-env/env-config/.env`:

```
COOLIFY_LOCAL_API_URL=http://localhost:8000
COOLIFY_LOCAL_API_TOKEN=<the token>
```

Two names of their own, not the existing `COOLIFY_API_*` — those point at the
Hetzner box, and reusing them here would redeploy **production** every time
`dev` moved.

## Day to day

```bash
bash setup/deploy/local-replica/poll.sh --status      # what it knows
bash setup/deploy/local-replica/poll.sh --dry-run     # decide, print, send nothing
bash setup/deploy/local-replica/poll.sh --deploy-all  # force a catch-up
bash setup/deploy/local-replica/launchd/install-poller.sh --status
```

`apps.conf` maps a Coolify app name to a repo and branch. UUIDs are resolved at
run time from `GET /api/v1/applications`, never stored: one Coolify hosts many
apps, and a stale UUID deploys to the wrong one successfully and silently.

Most apps are commented out because their Coolify resources still track their
production branch. Move a resource to `dev` in the dashboard **first**, then
uncomment it here — a mismatch means this poller watches one branch while
Coolify builds another, which looks exactly like the deploy doing nothing.

## Behaviour worth knowing

- **First sight of an app adopts its current SHA without deploying.** Installing
  this should not fire eleven builds at once; the next real push is what
  deploys. `--deploy-all` forces an initial catch-up.
- **A failed trigger does not record the SHA**, so the next pass retries. The
  opposite — recording first — would mean one bad minute costs you the deploy
  entirely.
- **No token means exit 1, loudly.** A poller that quietly does nothing is the
  failure this whole pipeline exists to end.

## Verified

Against a stubbed Coolify, before any of it ran for real:

| | |
|---|---|
| first run | adopts, deploys nothing |
| no change | silent |
| `dev` moved | deploys, records the SHA |
| Coolify answers 500 | does **not** record, so the next pass retries |
| `--dry-run` | decides and sends nothing |

One real bug came out of running it: the script used to `source` the whole
`.env`, which failed on a line that is not a shell assignment — and would have
pulled the production token into scope, the one thing it must never hold. It
now reads the two keys it needs by name.
