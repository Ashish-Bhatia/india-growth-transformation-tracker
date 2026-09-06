import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_nas_2026_vintage_and_registered_manufacturing_indicators_are_ingested():
    vintage_registry = json.loads((ROOT / "data/metadata/dataset-vintage-registry.json").read_text())
    vintage = next(v for v in vintage_registry["vintages"] if v["vintage_id"] == "VNT-MOSPI-NAS-2026-08-31")
    assert vintage["dataset_id"] == "DS-MOSPI-NAS-001"
    assert vintage["version"] == "NAS-2026"
    assert vintage["release_date"] == "2026-08-31"
    assert vintage["snapshot_id"] == "SNP-MOSPI-NAS-20260831-001"
    assert vintage["acquisition_status"] == "acquired"
    assert vintage["file_hash"] is None

    manifest = json.loads((ROOT / "data/metadata/ingestion-manifests/ACQ-MOSPI-NAS-2026.json").read_text())
    assert manifest["acquisition_ref"] == "ACQ-MOSPI-NAS-2026"
    assert manifest["acquisition"]["status"] == "retrieved"
    assert manifest["lineage"]["vintage"] == "VNT-MOSPI-NAS-2026-08-31"
    assert manifest["validation"]["status"] == "passed_with_flags"
    assert manifest["validation"]["anomalies"] == ["methodology_change"]

    validation = json.loads((ROOT / "data/metadata/validation-reports/DS-MOSPI-NAS-001-VNT-MOSPI-NAS-2026-08-31.json").read_text())
    assert validation["validation_status"] == "passed_with_flags"
    assert validation["release_validation"]["base_year"] == "2022-23"
    assert validation["indicator_validation"]["IND-MFG-GVA-GROWTH-001"]["values_checked"] == [12.7, 9.3, 10.7]
    assert validation["indicator_validation"]["IND-MFG-GVA-SHARE-001"]["values_checked"] == [14.7, 14.7, 14.5, 14.8]

    growth_rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-GVA-GROWTH-001.csv").open()))
    share_rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-GVA-SHARE-001.csv").open()))
    assert len(growth_rows) == 3
    assert len(share_rows) == 4
    assert [r["value"] for r in growth_rows] == ["12.7", "9.3", "10.7"]
    assert [r["value"] for r in share_rows] == ["14.7", "14.7", "14.5", "14.8"]
    assert growth_rows[-1]["status"] == "provisional"
    assert share_rows[-1]["status"] == "provisional"
    assert all(r["vintage_id"] == "VNT-MOSPI-NAS-2026-08-31" for r in growth_rows + share_rows)
    assert all(r["dataset_id"] == "DS-MOSPI-NAS-001" for r in growth_rows + share_rows)
    assert all(r["geography"] == "INDIA" for r in growth_rows + share_rows)
