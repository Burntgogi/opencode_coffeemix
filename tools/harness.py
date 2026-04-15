"""
Shared harness module for coffeemix_all workspace validation runners.

Provides common subprocess execution, scenario evaluation,
and report writing utilities used by smoke, e2e, and routing runners.
"""

from __future__ import annotations

import json
import os
import shutil
import subprocess
from pathlib import Path
from typing import Any

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

# Cross-platform fallback: try common OpenCode install locations
_DEFAULT_OPENCODE_PATHS = [
    os.path.expandvars(r"C:\Users\%USERNAME%\AppData\Roaming\npm\opencode.cmd"),
    r"C:\Program Files\nodejs\opencode.cmd",
    "/usr/local/bin/opencode",
    "/usr/bin/opencode",
]


def get_opencode_bin() -> str:
    """Return the OpenCode binary path from env, PATH, or fallback search.

    Raises FileNotFoundError when no usable binary is found.
    """
    env_path = os.environ.get("OPENCODE_BIN")
    if env_path and Path(env_path).exists():
        return env_path
    # Try system PATH via shutil.which
    which_path = shutil.which("opencode")
    if which_path:
        return which_path
    # Fallback: first existing default path
    for candidate in _DEFAULT_OPENCODE_PATHS:
        if Path(candidate).exists():
            return candidate
    raise FileNotFoundError(
        "OpenCode binary not found. Set OPENCODE_BIN, add opencode to PATH, "
        "or install via 'npm install -g opencode-ai'."
    )


try:
    OPENCODE_BIN = get_opencode_bin()
except FileNotFoundError:
    OPENCODE_BIN = None


def get_root() -> Path:
    """Return the workspace root (parent of tools/)."""
    return Path(__file__).resolve().parent.parent


# ---------------------------------------------------------------------------
# Subprocess execution
# ---------------------------------------------------------------------------


def run_command(
    command: list[str],
    cwd: Path | str,
    timeout: int = 300,
) -> dict[str, Any]:
    """
    Run a subprocess with OPENCODE_CONFIG_DIR set to the workspace root.

    Returns dict with returncode, stdout, stderr.
    Handles TimeoutExpired gracefully.
    """
    env = os.environ.copy()
    env["OPENCODE_CONFIG_DIR"] = str(Path(cwd).resolve())

    # Resolve opencode binary
    resolved_cmd = OPENCODE_BIN
    if command and command[0] == "opencode":
        if resolved_cmd is None:
            return {
                "returncode": 127,
                "stdout": "",
                "stderr": (
                    "OpenCode binary not found. Set OPENCODE_BIN, add opencode to PATH, "
                    "or install via 'npm install -g opencode-ai'."
                ),
            }
        command = [resolved_cmd] + command[1:]
    elif command and Path(command[0]).name == "opencode":
        if resolved_cmd is None:
            return {
                "returncode": 127,
                "stdout": "",
                "stderr": (
                    "OpenCode binary not found. Set OPENCODE_BIN, add opencode to PATH, "
                    "or install via 'npm install -g opencode-ai'."
                ),
            }
        command = [resolved_cmd] + command[1:]

    try:
        result = subprocess.run(
            command,
            cwd=cwd,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="ignore",
            timeout=timeout,
            env=env,
            shell=False,
        )
        return {
            "returncode": result.returncode,
            "stdout": result.stdout.strip(),
            "stderr": result.stderr.strip(),
        }
    except subprocess.TimeoutExpired:
        return {
            "returncode": 124,
            "stdout": "",
            "stderr": f"Command timed out after {timeout} seconds",
        }
    except FileNotFoundError as exc:
        return {
            "returncode": 127,
            "stdout": "",
            "stderr": f"Executable not found: {exc.filename or command[0]}",
        }


# ---------------------------------------------------------------------------
# Scenario evaluation
# ---------------------------------------------------------------------------


def evaluate_scenario(
    scenario: dict[str, Any],
    result: dict[str, Any],
) -> dict[str, Any]:
    """
    Evaluate a scenario result against must_include / must_exclude / max_lines.

    Returns enriched result dict with pass/fail breakdown.
    """
    output = (result.get("stdout", "") + "\n" + result.get("stderr", "")).lower()
    lines = [line for line in result.get("stdout", "").splitlines() if line.strip()]

    include_ok = all(
        needle.lower() in output for needle in scenario.get("must_include", [])
    )
    exclude_ok = all(
        needle.lower() not in output for needle in scenario.get("must_exclude", [])
    )
    line_ok = len(lines) <= scenario.get("max_lines", 999)
    passed = result["returncode"] == 0 and include_ok and exclude_ok and line_ok

    return {
        "name": scenario["name"],
        "passed": passed,
        "returncode": result["returncode"],
        "include_ok": include_ok,
        "exclude_ok": exclude_ok,
        "line_ok": line_ok,
        "line_count": len(lines),
        "must_include": scenario.get("must_include", []),
        "must_exclude": scenario.get("must_exclude", []),
        "stdout": result.get("stdout", ""),
        "stderr": result.get("stderr", ""),
    }


# ---------------------------------------------------------------------------
# File checks
# ---------------------------------------------------------------------------


def check_files(paths: list[Path]) -> list[dict[str, Any]]:
    """Check existence of required files/directories."""
    return [{"path": str(p), "exists": p.exists()} for p in paths]


# ---------------------------------------------------------------------------
# Report writing
# ---------------------------------------------------------------------------


def write_json_report(path: Path, payload: dict[str, Any]) -> None:
    """Write a JSON report file."""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(payload, indent=2, ensure_ascii=False),
        encoding="utf-8",
    )


def write_md_report(path: Path, lines: list[str]) -> None:
    """Write a Markdown report file."""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines), encoding="utf-8")


def format_file_check_report(items: list[dict[str, Any]]) -> list[str]:
    """Format file check results as Markdown lines."""
    lines = ["## Required files", ""]
    for item in items:
        status = "OK" if item["exists"] else "FAIL"
        lines.append(f"- {status} {item['path']}")
    lines.append("")
    return lines


def format_scenario_report(
    results: list[dict[str, Any]],
    *,
    detailed: bool = False,
) -> list[str]:
    """Format scenario results as Markdown lines."""
    lines = ["## Scenario results", ""]
    for item in results:
        if detailed:
            lines.append(
                f"- {'PASS' if item['passed'] else 'FAIL'} {item['name']} "
                f"(include={item['include_ok']}, exclude={item['exclude_ok']}, lines={item['line_count']})"
            )
        else:
            lines.append(f"- {'PASS' if item['passed'] else 'FAIL'} {item['name']}")
    lines.append("")
    return lines
