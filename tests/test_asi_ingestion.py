import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_asi_2023_24_vintage_and_registered_indicators_are_ingested():
    vintage_registry = json.loads((ROOT / "data/metadata/dataset-vintage-registry.json").read_text())
    vintage = next(v for v in vintage_registry["vintages"] if v["vintage_id"] == "VNT-MOSPI-ASI-2023-24")
    assert vintage["dataset_id"] == "DS-MOSPI-ASI-001"
    assert vintage["version"] == "ASI-2023-24"
    assert vintage["release_date"] == "2025-08-27"
    assert vintage["snapshot_id"] == "SNP-MOSPI-ASI-20250827-001"
    assert vintage["acquisition_status"] == "acquired"
    assert vintage["file_hash"] is None

    manifest = json.loads((ROOT / "data/metadata/ingestion-manifests/ACQ-MOSPI-ASI-2023-24.json").read_text())
    assert manifest["acquisition_ref"] == "ACQ-MOSPI-ASI-2023-24"
    assert manifest["acquisition"]["status"] == "retrieved"
    assert manifest["lineage"]["vintage"] == "VNT-MOSPI-ASI-2023-24"
    assert manifest["validation"]["status"] == "passed_with_flags"
    assert manifest["validation"]["anomalies"] == ["registered_manufacturing_coverage_limit"]

    validation = json.loads((ROOT / "data/metadata/validation-reports/DS-MOSPI-ASI-001-VNT-MOSPI-ASI-2023-24.json").read_text())
    assert validation["validation_status"] == "passed_with_flags"
    assert validation["release_validation"]["reference_period"] == "2023-24"
    assert validation["indicator_validation"]["IND-MFG-ASI-GVA-001"]["source_value"] == 245833605
    assert validation["indicator_validation"]["IND-MFG-ASI-EMP-001"]["source_value"] == 19589131
    assert "registered_manufacturing_coverage_limit" in validation["flags"]

    gva_rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-ASI-GVA-001.csv").open()))
    emp_rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-ASI-EMP-001.csv").open()))
    assert len(gva_rows) == 1
    assert len(emp_rows) == 1
    assert gva_rows[0]["value"] == "245833605"
    assert gva_rows[0]["unit"] == "₹ lakh, source-defined"
    assert emp_rows[0]["value"] == "19589131"
    assert emp_rows[0]["unit"] == "persons"
    assert all(r["geography"] == "INDIA" for r in gva_rows + emp_rows)
    assert all(r["vintage_id"] == "VNT-MOSPI-ASI-2023-24" for r in gva_rows + emp_rows)
    assert all(r["dataset_id"] == "DS-MOSPI-ASI-001" for r in gva_rows + emp_rows)
    assert all(r["status"] == "observed" for r in gva_rows + emp_rows)

    iip_rows = list(csv.DictReader((ROOT / "data/canonical/observations/IND-MFG-IIP-001.csv").open()))
    assert len(iip_rows) == 41
    assert "VNT-MOSPI-IIP-2022-23" in {r["vintage_id"] for r in iip_rows}
    assert "VNT-MOSPI-IIP-2022-23-20260828" in {r["vintage_id"] for r in iip_rows}
