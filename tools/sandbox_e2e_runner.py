import json
import sys
from pathlib import Path

TOOLS_DIR = Path(__file__).resolve().parent
if str(TOOLS_DIR.parent) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR.parent))

from tools.harness import (
    check_files,
    evaluate_scenario,
    format_file_check_report,
    format_scenario_report,
    get_root,
    run_command,
    write_json_report,
    write_md_report,
)

ROOT = get_root()
REPORTS = ROOT / "reports"
SCENARIOS = ROOT / "scenarios"


def run_inventory_checks() -> dict:
    agents = run_command(["opencode", "run", "List agent names only."], ROOT)
    skills = run_command(["opencode", "run", "List skill names only."], ROOT)
    agent_ok = (
        agents["returncode"] == 0
        and "gb-commit" in agents["stdout"]
        and "gb-debug" in agents["stdout"]
        and "sisyphus" in agents["stdout"]
    )
    skill_ok = (
        skills["returncode"] == 0
        and "enter-plan-mode" in skills["stdout"]
        and "tool-search" in skills["stdout"]
    )
    return {"agents": agents, "skills": skills, "agent_ok": agent_ok, "skill_ok": skill_ok}


def run_scenarios() -> list[dict]:
    results = []
    for path in sorted(SCENARIOS.glob("*.json")):
        scenario = json.loads(path.read_text(encoding="utf-8"))
        result = run_command(
            ["opencode", "run", scenario["prompt"], "--model", "openai/gpt-5.4"],
            ROOT,
        )
        results.append(evaluate_scenario(scenario, result))
    return results


def main() -> None:
    payload = {
        "workspace": str(ROOT),
        "files": check_files([
            ROOT / "opencode.json",
            ROOT / "oh-my-opencode.json",
            ROOT / "AGENTS.md",
            ROOT / ".opencode" / "package.json",
            ROOT / ".opencode" / "agents",
            ROOT / ".opencode" / "skills",
            ROOT / "docs",
        ]),
        "inventory": run_inventory_checks(),
        "scenarios": run_scenarios(),
    }

    write_json_report(REPORTS / "sandbox-e2e-results.json", payload)

    lines = ["# Sandbox E2E Report", "", f"Workspace: `{ROOT}`", ""]
    lines.extend(format_file_check_report(payload["files"]))
    lines.append("## Inventory")
    lines.append(f"- {'PASS' if payload['inventory']['agent_ok'] else 'FAIL'} agents visible")
    lines.append(f"- {'PASS' if payload['inventory']['skill_ok'] else 'FAIL'} skills visible")
    lines.append("")
    lines.extend(format_scenario_report(payload["scenarios"], detailed=True))
    write_md_report(REPORTS / "sandbox-e2e-report.md", lines)


if __name__ == "__main__":
    main()
