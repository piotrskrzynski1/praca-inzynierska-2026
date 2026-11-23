"""Walidacja próby obciążenia gry i statystyki; biblioteka standardowa Pythona.

Uruchomienie: python analizuj_load_probe.py
Pliki wejściowy i wynikowy znajdują się w tym samym folderze co skrypt.
"""
import csv
import json
import math
import statistics
from pathlib import Path

WARMUP = 60
SAMPLES = 300
COUNTS = (100, 1000, 5000)
WORKERS = (1, 4)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def percentile(values, fraction):
    ordered = sorted(values)
    position = (len(ordered) - 1) * fraction
    low, high = math.floor(position), math.ceil(position)
    return ordered[low] + (ordered[high] - ordered[low]) * (position - low)


def main():
    folder = Path(__file__).resolve().parent
    with (folder / "load_probe.csv").open(encoding="utf-8-sig", newline="") as source:
        reader = csv.DictReader(source)
        columns = reader.fieldnames
        rows = list(reader)

    expected_columns = {
        "initial_enemies", "workers", "controls_invulnerable", "sample", "step",
        "simulation_seconds", "enemies_before", "enemies_after", "entities_before",
        "entities_after", "score", "level", "health_after", "step_time_ns",
    }
    require(set(columns or []) == expected_columns, "Nieoczekiwane kolumny CSV")
    require(len(rows) == len(COUNTS) * len(WORKERS) * SAMPLES,
            f"Oczekiwano 1800 pomiarów, otrzymano {len(rows)}")

    groups = {}
    for row in rows:
        key = (int(row["initial_enemies"]), int(row["workers"]))
        groups.setdefault(key, []).append(row)
    require(set(groups) == {(count, workers) for count in COUNTS for workers in WORKERS},
            "Nieoczekiwane scenariusze pomiarowe")

    results = []
    for (count, workers), group in sorted(groups.items()):
        require(len(group) == SAMPLES, f"Scenariusz {count}/{workers} nie ma 300 próbek")
        previous_time = WARMUP / 60.0
        for sample, row in enumerate(group):
            require(int(row["sample"]) == sample, "Nieciągłe numery próbek")
            require(int(row["step"]) == WARMUP + sample, "Nieciągłe numery kroków")
            require(row["controls_invulnerable"] == "true", "Brak kontroli zdrowia gracza")
            time = float(row["simulation_seconds"])
            require(math.isfinite(time) and time > previous_time,
                    "Czas symulacji nie wzrasta w każdym kroku")
            require(math.isclose(time - previous_time, 1 / 60, abs_tol=0.00001),
                    "Krok symulacji nie odpowiada FIXED_DT")
            require(int(row["step_time_ns"]) > 0, "Niedodatni czas pomiaru")
            require(0 <= float(row["health_after"]) <= 100, "Niepoprawne zdrowie gracza")
            for suffix in ("before", "after"):
                require(0 <= int(row[f"enemies_{suffix}"]) < int(row[f"entities_{suffix}"]),
                        "Niepoprawne liczby przeciwników lub encji")
            if sample:
                previous = group[sample - 1]
                require(row["enemies_before"] == previous["enemies_after"],
                        "Liczba przeciwników zmienia się pomiędzy krokami")
                require(row["entities_before"] == previous["entities_after"],
                        "Liczba encji zmienia się pomiędzy krokami")
                require(int(row["score"]) >= int(previous["score"]), "Wynik gry maleje")
                require(int(row["level"]) >= int(previous["level"]), "Poziom gracza maleje")
            previous_time = time

        times = [int(row["step_time_ns"]) / 1_000_000 for row in group]
        enemy_counts = [int(row[f"enemies_{suffix}"])
                        for row in group for suffix in ("before", "after")]
        entity_counts = [int(row[f"entities_{suffix}"])
                         for row in group for suffix in ("before", "after")]
        results.append({
            "initial_enemies": count,
            "workers": workers,
            "samples": len(group),
            "median_ms_per_step": statistics.median(times),
            "p95_ms_per_step": percentile(times, 0.95),
            "min_ms_per_step": min(times),
            "max_ms_per_step": max(times),
            "actual_enemies_min": min(enemy_counts),
            "actual_enemies_max": max(enemy_counts),
            "actual_entities_min": min(entity_counts),
            "actual_entities_max": max(entity_counts),
            "final_score": int(group[-1]["score"]),
            "final_level": int(group[-1]["level"]),
            "final_simulation_seconds": float(group[-1]["simulation_seconds"]),
        })

    simulation_columns = expected_columns - {"workers", "step_time_ns"}
    for count in COUNTS:
        for sequential, parallel in zip(groups[(count, 1)], groups[(count, 4)]):
            require(all(sequential[column] == parallel[column] for column in simulation_columns),
                    f"Różne wyniki symulacji dla 1 i 4 pracowników przy {count} przeciwnikach")

    summary = {
        "probe": "full_game_step_cpu",
        "source": "load_probe.csv",
        "metadata": "load_probe_metadata.txt",
        "validated_rows": len(rows),
        "warmup_steps": WARMUP,
        "measured_steps_per_scenario": SAMPLES,
        "p95_method": "linear interpolation at sorted index (n-1)*0.95",
        "all_simulation_steps_advanced": True,
        "worker_variants_match_in_all_simulation_columns": True,
        "timing_scope": "Game::step CPU wall-clock time; input, health reset, counts and CSV excluded",
        "measurement_conditions": {
            "controls_invulnerable": True,
            "health_reset_to_100_before_each_step": True,
            "contact_damage_spawning_and_kills_active": True,
            "initial_level": 13,
            "initial_projectiles_per_volley": 5,
            "scenario_order": [[count, workers] for count in COUNTS for workers in WORKERS],
        },
        "limitations": [
            "CPU simulation only; rendering and GPU excluded; not full frame time or FPS",
            "Diagnostic invulnerable fixture; does not measure ordinary survival time",
            "Single short ordered run, six simulated seconds per scenario including warmup",
            "Enemy and entity populations vary during each run; before/after counts are recorded",
            "No alternative architecture measured; not comparative evidence of ECS advantage",
            "Timing values are affected by the machine and operating-system scheduling",
        ],
        "results": results,
    }
    destination = folder / "load_probe_summary.json"
    destination.write_text(json.dumps(summary, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
