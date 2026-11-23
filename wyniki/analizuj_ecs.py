"""Walidacja CSV i statystyki pomiarów; wyłącznie biblioteka standardowa Pythona."""
import csv
import json
import math
import statistics
from decimal import Decimal
from pathlib import Path

folder = Path(__file__).resolve().parent
with (folder / "ecs_benchmark.csv").open(encoding="utf-8-sig", newline="") as source:
    rows = list(csv.DictReader(source))

assert len(rows) == 90, f"Oczekiwano 90 pomiarów, otrzymano {len(rows)}"
groups = {}
for count_index, count in enumerate((1000, 10000, 100000)):
    for sample in range(15):
        pair = rows[count_index * 30 + sample * 2 : count_index * 30 + sample * 2 + 2]
        expected_order = ["ecs_soa", "vec_aos"] if sample % 2 == 0 else ["vec_aos", "ecs_soa"]
        assert [row["implementation"] for row in pair] == expected_order
        assert Decimal(pair[0]["checksum"]) == Decimal(pair[1]["checksum"])
        for row in pair:
            assert int(row["entities"]) == count
            assert int(row["sample"]) == sample
            assert int(row["iterations"]) == 100
            total = int(row["total_ns"])
            duration = float(row["ns_per_iteration"])
            assert total > 0
            assert math.isclose(duration, total / 100, abs_tol=0.00051)
            assert math.isclose(float(row["ns_per_entity"]), duration / count, abs_tol=0.00000051)
            groups.setdefault((count, row["implementation"]), []).append(duration)

def percentile(values, fraction):
    ordered = sorted(values)
    position = (len(ordered) - 1) * fraction
    low, high = math.floor(position), math.ceil(position)
    return ordered[low] + (ordered[high] - ordered[low]) * (position - low)

results = []
for (count, implementation), values in sorted(groups.items()):
    results.append({
        "entities": count,
        "implementation": implementation,
        "samples": len(values),
        "median_ns_per_iteration": statistics.median(values),
        "p95_ns_per_iteration": percentile(values, 0.95),
        "min_ns_per_iteration": min(values),
        "max_ns_per_iteration": max(values),
        "median_ns_per_entity": statistics.median(values) / count,
    })

summary = {
    "benchmark": "position_velocity_integration",
    "source": "ecs_benchmark.csv",
    "metadata": "ecs_benchmark_metadata.txt",
    "environment": "srodowisko.json",
    "measurement_notes": "ecs_run_notes.json",
    "validated_rows": len(rows),
    "checksums_equal_in_all_45_pairs": True,
    "alternating_execution_order_validated": True,
    "warmup_steps": 100,
    "iterations_per_sample": 100,
    "p95_method": "linear interpolation at sorted index (n-1)*0.95",
    "timing_scope": "single-thread CPU integration; allocation and checksum excluded",
    "results": results,
}
(folder / "ecs_summary.json").write_text(json.dumps(summary, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
print(json.dumps(summary, ensure_ascii=False, indent=2))
