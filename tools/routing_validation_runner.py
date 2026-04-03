import json
import sys
from pathlib import Path

TOOLS_DIR = Path(__file__).resolve().parent
if str(TOOLS_DIR.parent) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR.parent))

from tools.harness import (
    evaluate_scenario,
    get_root,
    run_command,
    write_json_report,
    write_md_report,
)

ROOT = get_root()
SCENARIOS = ROOT / "routing-scenarios"
REPORTS = ROOT / "reports"


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
    results = run_scenarios()

    write_json_report(REPORTS / "routing-validation-results.json", results)

    lines = ["# Routing Validation Report", ""]
    for item in results:
        lines.append(
            f"- {'PASS' if item['passed'] else 'FAIL'} {item['name']} "
            f"(lines={item['line_count']})"
        )
    write_md_report(REPORTS / "routing-validation-report.md", lines)


if __name__ == "__main__":
    main()
