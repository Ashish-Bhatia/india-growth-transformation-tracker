import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_iip_vintages_and_observations_are_registered_and_validated():
    vintage_registry = json.loads((ROOT / "data/metadata/dataset-vintage-registry.json").read_text())
    first_vintage = next(v for v in vintage_registry["vintages"] if v["vintage_id"] == "VNT-MOSPI-IIP-2022-23")
    assert first_vintage["dataset_id"] == "DS-MOSPI-IIP-001"
    assert first_vintage["version"] == "IIP-2022-23"
    assert first_vintage["release_date"] == "2026-06-01"
    assert first_vintage["snapshot_id"] == "SNP-MOSPI-IIP-20260601-001"
    assert first_vintage["acquisition_status"] == "acquired"
    assert first_vintage["file_hash"] is None

    second_vintage = next(v for v in vintage_registry["vintages"] if v["vintage_id"] == "VNT-MOSPI-IIP-2022-23-20260828")
    assert second_vintage["dataset_id"] == "DS-MOSPI-IIP-001"
    assert second_vintage["version"] == "IIP-2022-23-20260828"
    assert second_vintage["release_date"] == "2026-08-28"
    assert second_vintage["snapshot_id"] == "SNP-MOSPI-IIP-20260828-001"
    assert second_vintage["acquisition_status"] == "acquired"
    assert second_vintage["file_hash"] is None

    first_manifest = json.loads(next((ROOT / "data/metadata/ingestion-manifests").glob("ACQ-MOSPI-IIP-2022-23-20260906.json")).read_text())
    assert first_manifest["acquisition_ref"] == "ACQ-MOSPI-IIP-2022-23-20260906"
    assert first_manifest["acquisition"]["status"] == "retrieved"
    assert first_manifest["lineage"]["vintage"] == "VNT-MOSPI-IIP-2022-23"
    assert first_manifest["validation"]["status"] == "passed_with_flags"
    assert first_manifest["validation"]["anomalies"] == ["methodology_change"]

    second_manifest = json.loads(next((ROOT / "data/metadata/ingestion-manifests").glob("ACQ-MOSPI-IIP-2022-23-20260828.json")).read_text())
    assert second_manifest["acquisition_ref"] == "ACQ-MOSPI-IIP-2022-23-20260828"
    assert second_manifest["acquisition"]["status"] == "retrieved"
    assert second_manifest["lineage"]["vintage"] == "VNT-MOSPI-IIP-2022-23-20260828"
    assert second_manifest["validation"]["status"] == "passed_with_flags"
    assert second_manifest["validation"]["anomalies"] == ["revision_of_prior_observations", "july_2026_quick_estimate"]

    first_validation = json.loads(next((ROOT / "data/metadata/validation-reports").glob("DS-MOSPI-IIP-001-VNT-MOSPI-IIP-2022-23.json")).read_text())
    assert first_validation["checks"]["base_year"]["status"] == "passed"
    assert first_validation["checks"]["unit"]["status"] == "passed"
    assert first_validation["checks"]["frequency"]["status"] == "passed"
    assert first_validation["checks"]["observation_count"]["observed"] == 37
    assert first_validation["checks"]["duplicate_observations"]["observed"] == 0
    assert first_validation["checks"]["missing_months"]["observed"] == 0
    assert first_validation["checks"]["annual_index_reconciliation"]["2025-26"]["status"] == "passed"
    assert first_validation["checks"]["april_2026_growth_reconciliation"]["status"] == "passed"

    second_validation = json.loads(next((ROOT / "data/metadata/validation-reports").glob("DS-MOSPI-IIP-001-VNT-MOSPI-IIP-2022-23-20260828.json")).read_text())
    assert second_validation["status"] == "passed_with_flags"
    assert second_validation["checks"]["observation_count"]["observed"] == 4
    assert second_validation["checks"]["duplicate_observations"]["observed"] == 0
    assert second_validation["checks"]["april_2026_revision"]["current_value"] == 118.7
    assert second_validation["checks"]["june_2026_revision"]["current_final_revision"] == 125.3
    assert second_validation["checks"]["july_2026_quick_estimate"]["value"] == 127.4

    rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-IIP-001.csv").open()))
    assert len(rows) == 41
    assert len({r["observation_id"] for r in rows}) == 41
    assert all(r["indicator_id"] == "IND-MFG-IIP-001" for r in rows)
    assert all(r["dataset_id"] == "DS-MOSPI-IIP-001" for r in rows)
    assert all(r["geography"] == "INDIA" for r in rows)
    assert all(r["unit"] == "index, 2022-23=100" for r in rows)

    first_rows = [r for r in rows if r["vintage_id"] == "VNT-MOSPI-IIP-2022-23"]
    assert len(first_rows) == 37
    assert first_rows[-1]["period_label"] == "2026-04"
    assert first_rows[-1]["value"] == "119.3"
    assert first_rows[-1]["status"] == "provisional"

    second_rows = [r for r in rows if r["vintage_id"] == "VNT-MOSPI-IIP-2022-23-20260828"]
    assert len(second_rows) == 4
    assert [(r["period_label"], r["value"], r["status"]) for r in second_rows] == [
        ("2026-04", "118.7", "revised"),
        ("2026-05", "122.2", "observed"),
        ("2026-06", "125.3", "revised"),
        ("2026-07", "127.4", "provisional"),
    ]
