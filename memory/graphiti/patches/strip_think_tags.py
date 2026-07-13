"""AI-OS build-time patch (2026-07-13) for graphiti-core's OpenAIGenericClient.

Reasoning models served through MiniMax's OpenAI-compatible endpoint (e.g.
MiniMax-M2, MiniMax-M3) always prepend a `<think>...</think>` block to
`message.content`, even when a JSON response_format is requested (confirmed
via raw curl: `usage.reasoning_tokens` is present and the block appears
regardless of response_format type). graphiti-core's
`OpenAIGenericClient._strip_code_fences` only strips ```json fences, so
`json.loads()` fails with `Expecting value: line 1 column 1 (char 0)` because
the payload starts with `<think>` rather than `{`.

A second, related issue: with `structured_output_mode='json_object'` (forced
for non-OpenAI providers by mcp_server's factories.py — see config.yaml's
STATUS note), MiniMax is not always disciplined about emitting *only* the
JSON object. It reliably reproduced `json.JSONDecodeError: Extra data` at a
near-identical byte offset across repeated calls — i.e. a complete, valid
JSON object followed by trailing content the schema-in-prompt approach
doesn't fully suppress. `json.loads` rejects any trailing data, so this
script also switches parsing to `json.JSONDecoder().raw_decode`, which parses
only the first complete JSON value and ignores anything after it (a no-op
when there is no trailing data — safe for OpenAI/Ollama/other providers too).

This script patches the installed graphiti_core package (pulled from PyPI by
mcp_server's own pyproject.toml — it is NOT part of this monorepo checkout,
see Dockerfile.standalone.minimal comments). Idempotent: raises if the
expected source snippet is missing (e.g. after a graphiti-core version bump),
so a broken patch fails the build loudly instead of silently no-op'ing.
"""

import pathlib
import re
import sys

TARGET = pathlib.Path(
    '.venv/lib/python3.11/site-packages/graphiti_core/llm_client/openai_generic_client.py'
)

THINK_OLD = """        stripped = text.strip()
        if stripped.startswith('```'):"""

THINK_NEW = """        stripped = text.strip()
        # AI-OS patch: strip a leading <think>...</think> reasoning block (MiniMax-M2/M3
        # and other reasoning models emit this even when JSON output is requested).
        stripped = re.sub(r'<think>.*?</think>', '', stripped, flags=re.DOTALL).strip()
        if stripped.startswith('```'):"""

EXTRA_DATA_OLD = """            # Many OpenAI-compatible/local models wrap JSON in a ```json fence even under a
            # structured response_format; strip it before parsing.
            return json.loads(self._strip_code_fences(result))"""

EXTRA_DATA_NEW = """            # Many OpenAI-compatible/local models wrap JSON in a ```json fence even under a
            # structured response_format; strip it before parsing.
            # AI-OS patch: use raw_decode instead of loads — MiniMax in json_object mode
            # reliably appends trailing content after an otherwise-complete JSON object,
            # which loads() rejects as "Extra data". raw_decode parses only the first
            # complete value and ignores the rest (a no-op when there is no trailing data).
            cleaned = self._strip_code_fences(result)
            return json.JSONDecoder().raw_decode(cleaned)[0]"""


def _apply(src: str, old: str, new: str, label: str) -> str:
    if old not in src:
        idx = src.find('_strip_code_fences')
        context = src[idx : idx + 500] if idx != -1 else '(method not found at all)'
        print(
            f'AI-OS patch FAILED ({label}): expected snippet not found in {TARGET} '
            '(graphiti-core version likely changed the method body — update this patch)\n'
            f'--- actual context around _strip_code_fences ---\n{context!r}',
            file=sys.stderr,
        )
        raise SystemExit(1)
    return src.replace(old, new, 1)


def main() -> int:
    src = TARGET.read_text()
    src = _apply(src, THINK_OLD, THINK_NEW, 'think-tag stripping')
    src = _apply(src, EXTRA_DATA_OLD, EXTRA_DATA_NEW, 'raw_decode for trailing data')
    TARGET.write_text(src)
    print(f'AI-OS patch applied: think-tag stripping + raw_decode parsing in {TARGET}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
