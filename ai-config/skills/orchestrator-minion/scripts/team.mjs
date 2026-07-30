#!/usr/bin/env node
/**
 * team.mjs — orchestrator-minion run-plan generator
 *
 * Usage:
 *   node team.mjs <plan.json> [--out <path|->] [--include-verify] [--include-synth]
 *
 * Reads a validated plan JSON and emits a run plan: the exact sequence of
 * `mavis({ command, args })` tool calls the orchestrator must execute to
 * run the plan, plus a polling loop and the synthesize step. The orchestrator
 * iterates through the run plan; it does not have to reason about which
 * primitive to call when.
 *
 * The output is JSON. Stdout for piping, --out - for the same, --out <path>
 * to write to disk. The output file is the input to the orchestrator's loop.
 *
 * What the run plan contains
 * -------------------------
 * For each worker w in plan.workers:
 *   1. (optional) mavis({ command: "agent create", ... }) if the worker role
 *      needs a one-off agent template.
 *   2. mavis({ command: "cron once", args: { agent_name, prompt, ... } }) to
 *      dispatch the worker as a one-shot scheduled task.
 *   3. (after all dispatches) mavis({ command: "cron list", ... }) polls
 *      to see when the workers finish.
 *   4. (per finished worker) mavis({ command: "session messages", ... }) to
 *      read the worker's reply (which contains the {"status", "artifact",
 *      "summary"} block per the worker contract).
 *   5. (per worker) the verifier dispatch (if verification is enabled).
 *
 * Plus, for the orchestrator's own synthesis, the run plan emits:
 *   - a Read tool call for each accepted artifact
 *   - a Bash tool call to append the run summary to .mavis/plans/index.jsonl
 *
 * This script is portable (no deps, no mavis runtime access). The actual
 * `mavis({...})` tool calls happen inside the orchestrator's model session,
 * where the mavis tool surface is available.
 *
 * Exit codes: 0 ok, 1 input error, 2 usage error.
 */

import { readFileSync, writeFileSync, existsSync } from 'node:fs';
import { resolve } from 'node:path';

// ─── tiny argv parser ───────────────────────────────────────────────────────

function parseArgs(argv) {
  const args = { _: [] };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a.startsWith('--')) {
      const key = a.slice(2);
      const next = argv[i + 1];
      if (next && !next.startsWith('--')) {
        args[key] = next;
        i++;
      } else {
        args[key] = true;
      }
    } else {
      args._.push(a);
    }
  }
  return args;
}

const HELP = `team.mjs — orchestrator-minion run-plan generator

Usage:
  node team.mjs <plan.json> [--out <path|->] [--include-verify] [--include-synth]
  node team.mjs --help

Reads a validated plan JSON and emits a run plan: the exact sequence of
mavis({ command, args }) tool calls the orchestrator must execute to run
the plan, plus a polling loop and the synthesize step.

The output is JSON. The orchestrator iterates through tool_calls; it does
not have to reason about which primitive to call when.`;

// ─── run plan generation ───────────────────────────────────────────────────

function escapeForCronPrompt(s) {
  // cron once passes the prompt as a CLI arg. Strip newlines, escape quotes.
  // In practice the orchestrator passes the prompt via the tool, not via
  // a shell, so this is a last-resort string sanitizer for the recipe.
  return String(s).replace(/[\r\n]+/g, ' ').replace(/"/g, '\\"');
}

function buildWorkerPrompt(plan, worker, wtag) {
  // The cron once prompt is the FULL worker prompt: contract + scope +
  // artifact format + acceptance. The orchestrator wraps this in the
  // worker contract (reference/worker-contract.md) verbatim.
  const contractPath = 'reference/worker-contract.md'; // relative to skill
  return [
    `You are a minion in an orchestrator-minion run for plan "${plan.id}".`,
    `Your worker id: ${worker.id}. Your role: ${worker.role}.`,
    ``,
    `WORKER CONTRACT (verbatim from ${contractPath}):`,
    `<paste the worker contract from the skill here, or load it via your Read tool>`,
    ``,
    `YOUR SCOPE: ${worker.scope}`,
    ``,
    `YOUR ARTIFACT:`,
    `- Format: ${worker.artifact?.format || 'CHANGE_ME'}`,
    `- Path: ${worker.artifact?.path || 'CHANGE_ME'}`,
    worker.artifact?.schema ? `- Schema: ${worker.artifact.schema}` : null,
    ``,
    `YOUR ACCEPTANCE CRITERIA:`,
    ...(worker.acceptance || []).map((a, i) => {
      if (a.type === 'verifier-subagent' && Array.isArray(a.rejects_if)) {
        return `  ${i + 1}. verifier-subagent rejects if: ${a.rejects_if.join('; ')}`;
      }
      return `  ${i + 1}. ${JSON.stringify(a)}`;
    }),
    ``,
    `WHEN DONE, REPLY with exactly:`,
    `{"status": "ok"|"failed"|"blocked"|"ambiguous", ...details}`,
  ].filter(Boolean).join('\n');
}

function buildRunPlan(plan, opts) {
  const includeVerify = !!opts.includeVerify;
  const includeSynth = !!opts.includeSynth;

  const toolCalls = [];
  let step = 1;

  // Phase 1: plan is already validated (caller ran plan.mjs validate).
  // We just record a no-op step so the orchestrator has a clear "plan locked" anchor.
  toolCalls.push({
    step: step++,
    phase: 'plan',
    tool: 'note',
    description: `Plan "${plan.id}" loaded. ${plan.workers.length} workers, fan_out=${plan.fan_out}, budget max_workers=${plan.budget?.max_workers}.`,
  });

  // Phase 2: dispatch each worker.
  const workerCronIds = [];
  for (const w of plan.workers) {
    const wtag = `w-${w.id}`;
    const prompt = buildWorkerPrompt(plan, w, wtag);

    // Optional: create a one-off agent if the worker role is not a known
    // template. We always emit this step; the orchestrator can skip if the
    // agent already exists (idempotent via mavis agent get).
    toolCalls.push({
      step: step++,
      phase: 'spawn',
      tool: 'mavis',
      description: `Ensure worker agent "${w.role || w.id}" exists.`,
      args: {
        command: 'agent get',
        args: { agent_name: w.role || w.id },
      },
      // If agent get returns "not found", the orchestrator should follow
      // up with an agent create call (not emitted here to keep the plan
      // static; the agent config is per-worker and might need tuning).
    });

    // Dispatch via cron once.
    toolCalls.push({
      step: step++,
      phase: 'spawn',
      tool: 'mavis',
      description: `Dispatch worker ${wtag} (${w.role}) as a one-shot scheduled task.`,
      args: {
        command: 'cron once',
        args: {
          agent_name: w.role || w.id,
          after: '0s',
          prompt,
          session: { mode: 'new' },
          delete_after_run: true,
        },
      },
    });
    workerCronIds.push({ worker_id: w.id, role: w.role, cron_step: step - 1 });
  }

  // Phase 3: poll until all workers finish.
  // The orchestrator must:
  //   1. call `cron list` to see which cron-once tasks are done
  //   2. when a task is done, find the session id it produced
  //   3. call `session messages` to read the worker's final reply
  //   4. parse the {"status", "artifact", "summary"} block
  //   5. read the artifact file (via Read tool)
  //   6. run the acceptance criteria (mechanical checks via Bash,
  //      verifier-subagent via another mavis cron once)
  //
  // We don't enumerate every poll step (the loop is dynamic). Instead we
  // emit the FIRST poll + a meta-step that says "keep polling until all
  // workers are done".
  toolCalls.push({
    step: step++,
    phase: 'poll',
    tool: 'mavis',
    description: `List recent cron tasks to see which workers are done.`,
    args: {
      command: 'cron list',
      args: { limit: 50, include_disabled: false },
    },
  });
  toolCalls.push({
    step: step++,
    phase: 'poll',
    tool: 'loop',
    description:
      'LOOP: for each pending worker, call `cron get` to see status. ' +
      'When a worker is done, call `session list` to find the new session, ' +
      'then `session messages` to read the worker reply. Repeat until all workers ' +
      'are in a terminal state (ok / failed / blocked / ambiguous).',
    worker_cron_id_steps: workerCronIds.map(c => c.cron_step),
  });

  // Phase 4 (optional): dispatch verifier sub-agents.
  if (includeVerify) {
    for (const w of plan.workers) {
      const verifierAccepts = (w.acceptance || []).filter(a => a.type === 'verifier-subagent');
      for (let i = 0; i < verifierAccepts.length; i++) {
        const va = verifierAccepts[i];
        toolCalls.push({
          step: step++,
          phase: 'verify',
          tool: 'mavis',
          description:
            `Dispatch a verifier sub-agent for worker ${w.id} ` +
            `(verifier #${i + 1}: reject if ${(va.rejects_if || []).join('; ') || 'CHANGE_ME'}).`,
          args: {
            command: 'cron once',
            args: {
              agent_name: 'verifier',
              after: '0s',
              prompt:
                `You are a verifier sub-agent. Read the artifact at ` +
                `${w.artifact?.path || 'CHANGE_ME'}. ` +
                `Reject (return {"verdict": "no", ...}) if: ${(va.rejects_if || []).join('; ') || 'CHANGE_ME'}. ` +
                `Otherwise return {"verdict": "yes", ...}.`,
              session: { mode: 'new' },
              delete_after_run: true,
            },
          },
        });
      }
    }
  }

  // Phase 5: synthesis. The orchestrator is the synthesizer. The run plan
  // emits a meta-step describing what to do.
  if (includeSynth) {
    toolCalls.push({
      step: step++,
      phase: 'synthesize',
      tool: 'note',
      description:
        'SYNTHESIZE: read all accepted artifacts. Lead the final answer with ' +
        'the user-facing response. Quote or attach evidence. If any worker failed, ' +
        'name the gap. If the plan was revised mid-flight, record the revision in the run log.',
    });
    toolCalls.push({
      step: step++,
      phase: 'log',
      tool: 'Bash',
      description: 'Append the run summary to .mavis/plans/index.jsonl.',
      args: {
        command: `echo '${JSON.stringify({
          plan_id: plan.id,
          goal: plan.goal,
          worker_count: plan.workers.length,
          started_at: new Date().toISOString(),
        })}' >> .mavis/plans/index.jsonl`,
      },
    });
  }

  return {
    run_id: `run-${plan.id}-${new Date().toISOString().replace(/[:.]/g, '-')}`,
    plan_id: plan.id,
    goal: plan.goal,
    generated_at: new Date().toISOString(),
    phases: ['plan', 'spawn', 'poll', includeVerify ? 'verify' : null, includeSynth ? 'synthesize' : null, includeSynth ? 'log' : null].filter(Boolean),
    worker_count: plan.workers.length,
    tool_calls: toolCalls,
    worker_cron_ids: workerCronIds,
    notes: [
      'The orchestrator iterates through tool_calls in step order.',
      'Phases 1-2 (plan, spawn) are static: every step is a literal tool call.',
      'Phase 3 (poll) is dynamic: a loop that exits when all workers are terminal.',
      'Phases 4-5 (verify, synth) are emitted only with --include-verify / --include-synth.',
      'Worker agent create is a recommended follow-up to agent get if the agent does not exist; not enumerated to keep the plan static.',
    ],
  };
}

// ─── main ───────────────────────────────────────────────────────────────────

function main() {
  const argv = process.argv.slice(2);
  const args = parseArgs(argv);

  if (args.help || args._[0] === '--help' || args._[0] === '-h') {
    console.log(HELP);
    process.exit(0);
  }

  const planPath = args._[0];
  if (!planPath) {
    console.error('error: <plan.json> is required (positional)');
    process.error(HELP);
    process.exit(2);
  }
  const abs = resolve(planPath);
  if (!existsSync(abs)) {
    console.error(`error: plan file not found: ${abs}`);
    process.exit(2);
  }

  let plan;
  try {
    plan = JSON.parse(readFileSync(abs, 'utf-8'));
  } catch (e) {
    console.error(`error: failed to parse JSON: ${e.message}`);
    process.exit(1);
  }

  const opts = {
    includeVerify: !!args['include-verify'],
    includeSynth: !!args['include-synth'],
  };

  const runPlan = buildRunPlan(plan, opts);
  const out = args.out || '-';
  const json = JSON.stringify(runPlan, null, 2) + '\n';
  if (out === '-') {
    process.stdout.write(json);
  } else {
    const outAbs = resolve(out);
    writeFileSync(outAbs, json, 'utf-8');
    console.error(`run plan written: ${outAbs}`);
    console.error(`  ${runPlan.tool_calls.length} tool calls across ${runPlan.phases.length} phases`);
  }
  process.exit(0);
}

main();
