import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_first_iip_vintage_and_observations_are_registered_and_validated():
    vintage_registry = json.loads((ROOT / "data/metadata/dataset-vintage-registry.json").read_text())
    vintage = next(v for v in vintage_registry["vintages"] if v["vintage_id"] == "VNT-MOSPI-IIP-2022-23")
    assert vintage["dataset_id"] == "DS-MOSPI-IIP-001"
    assert vintage["version"] == "IIP-2022-23"
    assert vintage["release_date"] == "2026-06-01"
    assert vintage["snapshot_id"] == "SNP-MOSPI-IIP-20260601-001"
    assert vintage["acquisition_status"] == "acquired"
    assert vintage["file_hash"] is None

    manifest = json.loads(next((ROOT / "data/metadata/ingestion-manifests").glob("ACQ-MOSPI-IIP-2022-23-20260906.json")).read_text())
    assert manifest["acquisition_ref"] == "ACQ-MOSPI-IIP-2022-23-20260906"
    assert manifest["acquisition"]["status"] == "retrieved"
    assert manifest["lineage"]["vintage"] == "VNT-MOSPI-IIP-2022-23"
    assert manifest["validation"]["status"] == "passed_with_flags"
    assert manifest["validation"]["anomalies"] == ["methodology_change"]

    validation = json.loads(next((ROOT / "data/metadata/validation-reports").glob("DS-MOSPI-IIP-001-VNT-MOSPI-IIP-2022-23.json")).read_text())
    assert validation["checks"]["base_year"]["status"] == "passed"
    assert validation["checks"]["unit"]["status"] == "passed"
    assert validation["checks"]["frequency"]["status"] == "passed"
    assert validation["checks"]["observation_count"]["observed"] == 37
    assert validation["checks"]["duplicate_observations"]["observed"] == 0
    assert validation["checks"]["missing_months"]["observed"] == 0
    assert validation["checks"]["annual_index_reconciliation"]["2025-26"]["status"] == "passed"
    assert validation["checks"]["april_2026_growth_reconciliation"]["status"] == "passed"

    rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-IIP-001.csv").open()))
    assert len(rows) == 37
    assert len({r["observation_id"] for r in rows}) == 37
    assert all(r["indicator_id"] == "IND-MFG-IIP-001" for r in rows)
    assert all(r["dataset_id"] == "DS-MOSPI-IIP-001" for r in rows)
    assert all(r["vintage_id"] == "VNT-MOSPI-IIP-2022-23" for r in rows)
    assert all(r["geography"] == "INDIA" for r in rows)
    assert all(r["unit"] == "index, 2022-23=100" for r in rows)
    assert rows[-1]["status"] == "provisional"
    assert rows[-1]["period_label"] == "2026-04"
    assert rows[-1]["value"] == "119.3"
