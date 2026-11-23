"""Analiza rozszerzonego benchmarku integracji położenia (cztery warianty).
Skrypt przygotowano z pomocą narzędzia Claude (Anthropic).

Użycie:
    python analizuj_warianty.py ETYKIETA=plik.csv [ETYKIETA=plik.csv ...]

Pliki CSV powstają z programu benchmark_warianty (narzedzia/pomiar_wariantow.ps1).

Przykład:
    python analizuj_warianty.py domyslny=ecs_warianty_domyslny.csv native=ecs_warianty_native.csv

Dla każdego pliku sprawdza kompletność serii i zgodność sum kontrolnych,
a następnie wypisuje medianę, p95 (interpolacja liniowa w pozycji (n-1)*0,95),
medianę w ns na encję i stosunek median do wariantu vec_aos. Na końcu drukuje
wiersze tabeli LaTeX. Wymaga wyłącznie biblioteki standardowej Pythona.
"""

import csv
import statistics
import sys
from collections import defaultdict

VARIANTS = ["ecs_soa", "soa_vec", "soa_flat", "vec_aos"]
NAMES = {
    "ecs_soa": "ECS",
    "soa_vec": "SoA bez ECS",
    "soa_flat": "SoA jako f32",
    "vec_aos": "Vec AoS",
}


def read_text(path):
    raw = open(path, "rb").read()
    for bom, encoding in ((b"\xff\xfe", "utf-16-le"), (b"\xfe\xff", "utf-16-be"), (b"\xef\xbb\xbf", "utf-8-sig")):
        if raw.startswith(bom):
            return raw[len(bom):].decode(encoding.replace("-sig", ""))
    return raw.decode("utf-8")


def p95(values):
    values = sorted(values)
    position = (len(values) - 1) * 0.95
    lower = int(position)
    upper = min(lower + 1, len(values) - 1)
    return values[lower] + (values[upper] - values[lower]) * (position - lower)


def analyse(label, path):
    rows = list(csv.DictReader(read_text(path).splitlines()))
    by_sample = defaultdict(dict)
    for row in rows:
        by_sample[(int(row["entities"]), int(row["sample"]))][row["implementation"]] = row
    for key, variants in by_sample.items():
        missing = set(VARIANTS) - set(variants)
        if missing:
            sys.exit(f"{label}: brak wariantów {sorted(missing)} dla {key}")
        reference = float(variants["vec_aos"]["checksum"])
        for name in VARIANTS:
            value = float(variants[name]["checksum"])
            if abs(value - reference) > 1e-6 * max(abs(reference), 1.0):
                sys.exit(f"{label}: niezgodna suma kontrolna {name} dla {key}")
    print(f"\n[{label}] {path}: {len(rows)} wierszy, {len(by_sample)} serii, sumy kontrolne zgodne")
    results = []
    for entities in sorted({k[0] for k in by_sample}):
        medians = {}
        for name in VARIANTS:
            samples = [float(by_sample[(entities, s)][name]["ns_per_iteration"])
                       for (n, s) in by_sample if n == entities]
            medians[name] = statistics.median(samples)
            results.append((label, entities, name, medians[name] / 1000, p95(samples) / 1000,
                            medians[name] / entities))
        print(f"  {entities:>7} encji: " + "  ".join(
            f"{NAMES[n]} {medians[n] / entities:.3f} ns ({medians[n] / medians['vec_aos']:.2f}x AoS)"
            for n in VARIANTS))
    return results


def latex_number(value, digits):
    return f"{value:.{digits}f}".replace(".", ",")


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    all_results = []
    for argument in sys.argv[1:]:
        label, _, path = argument.partition("=")
        if not path:
            label, path = path or "wyniki", label
        all_results += analyse(label, path)
    print("\n% Wiersze tabeli LaTeX: kompilacja & encje & wariant & mediana [us] & p95 [us] & ns/encję")
    for label, entities, name, median_us, p95_us, ns_entity in all_results:
        digits = 2 if median_us < 10 else 1
        print(f"{label} & {entities:,}".replace(",", "\\,") +
              f" & {NAMES[name]} & {latex_number(median_us, digits)} & "
              f"{latex_number(p95_us, digits)} & {latex_number(ns_entity, 2)} \\\\")


if __name__ == "__main__":
    main()
