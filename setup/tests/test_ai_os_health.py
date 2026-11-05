"""Tests for setup/ai-os-health.py that need no running services."""

import importlib.util
import json
import subprocess
import sys
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-health.py"
spec = importlib.util.spec_from_file_location("ai_os_health", SCRIPT)
health = importlib.util.module_from_spec(spec)
spec.loader.exec_module(health)


def test_sse_json_reads_plain_and_event_stream_bodies():
    assert health.sse_json('{"id": 1}') == {"id": 1}
    assert health.sse_json('event: message\ndata: {"id": 2}\n\n') == {"id": 2}


def test_check_ids_are_unique():
    ids = [c[0] for c in health.CHECKS]
    assert len(ids) == len(set(ids))


def test_tokens_check_never_prints_secret(monkeypatch):
    secret = "sk-test-do-not-print-0123456789"
    monkeypatch.setattr(health, "load_env", lambda: {"COOLIFY_API_URL": "http://127.0.0.1:9", "COOLIFY_API_TOKEN": secret})
    monkeypatch.setattr(health, "run", lambda *a, **k: (0, ""))
    status, detail = health.check_tokens()
    assert status == health.FAIL
    assert secret not in detail


def test_crashing_check_is_reported_as_fail(monkeypatch):
    monkeypatch.setattr(health, "CHECKS", [("boom", "Boom", lambda: 1 / 0)])
    monkeypatch.setattr(sys, "argv", ["ai-os-health", "--json"])
    assert health.main() == 1


def test_json_output_for_local_only_check():
    out = subprocess.run([sys.executable, str(SCRIPT), "--json", "--only", "disk"], capture_output=True, text=True, timeout=60)
    data = json.loads(out.stdout)
    assert [c["id"] for c in data["checks"]] == ["disk"]
    assert data["checks"][0]["status"] in ("ok", "warn", "fail")
