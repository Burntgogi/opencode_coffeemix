import json
import sys
from pathlib import Path

TOOLS_DIR = Path(__file__).resolve().parent
if str(TOOLS_DIR.parent) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR.parent))

from tools.harness import (
    check_files,
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
    return {"agents": agents, "skills": skills}


def run_scenarios() -> list[dict]:
    results = []
    selected = {"gb-review", "gb-share", "gb-statusline"}
    for path in sorted(SCENARIOS.glob("*.json")):
        scenario = json.loads(path.read_text(encoding="utf-8"))
        if scenario["name"] not in selected:
            continue
        result = run_command(
            ["opencode", "run", scenario["prompt"], "--model", "openai/gpt-5.4"],
            ROOT,
        )
        output = (result["stdout"] + "\n" + result["stderr"]).lower()
        passed = result["returncode"] == 0 and all(
            needle.lower() in output for needle in scenario["must_include"]
        )
        results.append(
            {
                "name": scenario["name"],
                "passed": passed,
                "must_include": scenario["must_include"],
                "returncode": result["returncode"],
                "stdout": result["stdout"],
                "stderr": result["stderr"],
            }
        )
    return results


def main() -> None:
    files = check_files([
        ROOT / "opencode.json",
        ROOT / "oh-my-opencode.json",
        ROOT / "AGENTS.md",
        ROOT / ".opencode" / "package.json",
        ROOT / ".opencode" / "agents",
        ROOT / ".opencode" / "skills",
    ])
    inventory = run_inventory_checks()
    scenarios = run_scenarios()
    payload = {
        "workspace": str(ROOT),
        "files": files,
        "inventory": inventory,
        "scenarios": scenarios,
    }

    write_json_report(REPORTS / "sandbox-smoke-results.json", payload)

    lines = ["# Sandbox Smoke Report", "", f"Workspace: `{ROOT}`", ""]
    lines.extend(format_file_check_report(files))
    lines.extend(format_scenario_report(scenarios))
    write_md_report(REPORTS / "sandbox-smoke-report.md", lines)


if __name__ == "__main__":
    main()
