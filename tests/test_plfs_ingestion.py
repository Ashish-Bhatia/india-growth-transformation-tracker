import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_plfs_2025_vintage_and_manufacturing_worker_share_are_ingested():
    vintage_registry = json.loads((ROOT / "data/metadata/dataset-vintage-registry.json").read_text())
    vintage = next(v for v in vintage_registry["vintages"] if v["vintage_id"] == "VNT-MOSPI-PLFS-2025")
    assert vintage["dataset_id"] == "DS-MOSPI-PLFS-001"
    assert vintage["version"] == "PLFS-2025"
    assert vintage["release_date"] == "2026-03-27"
    assert vintage["snapshot_id"] == "SNP-MOSPI-PLFS-20260327-001"
    assert vintage["acquisition_status"] == "acquired"
    assert vintage["file_hash"] is None

    manifest = json.loads((ROOT / "data/metadata/ingestion-manifests/ACQ-MOSPI-PLFS-2025.json").read_text())
    assert manifest["acquisition_ref"] == "ACQ-MOSPI-PLFS-2025"
    assert manifest["acquisition"]["status"] == "retrieved"
    assert manifest["lineage"]["vintage"] == "VNT-MOSPI-PLFS-2025"
    assert manifest["validation"]["status"] == "passed_with_flags"
    assert manifest["validation"]["anomalies"] == ["methodology_change"]

    validation = json.loads((ROOT / "data/metadata/validation-reports/DS-MOSPI-PLFS-001-VNT-MOSPI-PLFS-2025.json").read_text())
    assert validation["validation_status"] == "passed_with_flags"
    assert validation["indicator_validation"]["IND-MFG-PLFS-SHARE-001"]["values_checked"] == [11.2, 11.7, 11.6, 12.1]

    rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-PLFS-SHARE-001.csv").open()))
    assert len(rows) == 4
    assert [r["value"] for r in rows] == ["11.2", "11.7", "11.6", "12.1"]
    assert all(r["vintage_id"] == "VNT-MOSPI-PLFS-2025" for r in rows)
    assert all(r["dataset_id"] == "DS-MOSPI-PLFS-001" for r in rows)
    assert all(r["geography"] == "INDIA" for r in rows)
    assert all(r["quality_grade"] == "A" for r in rows)
