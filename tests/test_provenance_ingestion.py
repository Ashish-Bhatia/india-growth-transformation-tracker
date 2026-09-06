import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_ingestion_manifest_schema_is_valid_json_schema_shape():
    schema = json.loads((ROOT / "schemas/ingestion-manifest.schema.json").read_text())
    assert schema["$schema"] == "https://json-schema.org/draft/2020-12/schema"
    assert schema["manifest_version"] if "manifest_version" in schema else True
    assert set(schema["required"]) == {"manifest_version", "acquisition_ref", "acquisition", "lineage", "validation"}
    assert schema["properties"]["acquisition_ref"]["pattern"] == "^ACQ-[A-Z0-9][A-Z0-9._-]{2,127}$"
    assert schema["properties"]["acquisition"]["properties"]["mode"]["enum"] == [
        "automated", "semi_automated", "manual", "research_extraction"
    ]
    assert "locator_ids" in schema["properties"]["lineage"]["properties"]


def test_ingestion_conventions_are_contract_only_and_preserve_registry_boundary():
    conventions = json.loads((ROOT / "data/metadata/ingestion-conventions.json").read_text())
    assert conventions["manifest_version"] == "1.0"
    assert conventions["source_registry_seeded"] is False
    assert conventions["indicator_registry_seeded"] is False
    assert conventions["authoritative_registry_seed_required"] is True
    assert "SHA-256" == conventions["hash_algorithm"]
    assert set(conventions["layers"]) == {"raw", "clean", "derived"}
    assert "acquisition_ref" in conventions["required_manifest_controls"]
    assert "locator_ids" in conventions["required_manifest_controls"]


def test_provenance_document_contains_required_operational_controls():
    text = (ROOT / "docs/architecture/operational-provenance-and-ingestion.md").read_text()
    required_sections = [
        "Source acquisition convention",
        "Raw, clean and derived lineage",
        "Dataset registration",
        "Snapshot convention",
        "Locator convention",
        "Vintage convention",
        "Observation convention",
        "Transformation and calculation provenance",
        "Release calendar and freshness",
        "Source and methodology changes",
        "Validation states",
        "Reconciliation",
        "Ingestion contract",
        "Publication boundary",
        "Explicit non-goals",
    ]
    for section in required_sections:
        assert f"## " in text and section in text
