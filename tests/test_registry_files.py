import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCHEMAS = ROOT / "schemas"
REGISTRY = ROOT / "data" / "metadata"


def load_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def test_source_registry_is_seeded_only_with_verified_authoritative_records():
    registry = load_json(REGISTRY / "source-registry.json")
    assert registry["registry_version"] == "1.2.0"
    assert registry["schema_version"] == "1.0"
    assert registry["authority"] == "Source & Data Acquisition Architecture"
    assert registry["seed_status"] == "authoritative_seeded"
    assert len(registry["sources"]) == 12
    source_ids = {item["source_id"] for item in registry["sources"]}
    assert source_ids == {
        "SRC-MOSPI-NAS", "SRC-MOSPI-PLFS", "SRC-MOSPI-CPI", "SRC-MOSPI-IIP",
        "SRC-RBI-DBIE", "SRC-MOF-UNION-BUDGET", "SRC-COMMERCE-TRADE",
        "SRC-CEA-ELECTRICITY", "SRC-TRAI-TELECOM", "SRC-DPIIT-FDI",
        "SRC-MOSPI-ASI", "SRC-UNIDO-STATISTICS"
    }
    assert sum(item["source_tier"] == 1 for item in registry["sources"]) == 11
    assert all(item["provenance"]["verification_status"] == "verified" for item in registry["sources"])
    assert all(item["status"] == "active" for item in registry["sources"])


def test_dataset_registry_contains_only_verified_authoritative_records():
    registry = load_json(REGISTRY / "dataset-registry.json")
    assert registry["registry_version"] == "1.0.0"
    assert registry["schema_version"] == "1.0"
    assert registry["authority"] == "Data Governance & Versioning Framework"
    assert registry["seed_status"] == "authoritative_seeded"
    assert len(registry["datasets"]) == 9
    dataset_ids = {item["dataset_id"] for item in registry["datasets"]}
    assert len(dataset_ids) == 9
    assert all(item["provenance"]["verification_status"] == "verified" for item in registry["datasets"])
    assert all(item["status"] == "active" for item in registry["datasets"])
    source_ids = {item["source_id"] for item in registry["datasets"]}
    assert "SRC-MOSPI-ASI" in source_ids
    assert "SRC-UNIDO-STATISTICS" in source_ids


def test_indicator_registry_contains_only_authoritatively_verified_records():
    registry = load_json(REGISTRY / "indicator-registry.json")
    assert registry["registry_version"] == "1.1.1"
    assert registry["schema_version"] == "1.0"
    assert registry["authority"] == "Master Indicator Registry v1.0"
    assert registry["seed_status"] == "authoritative_seeded"
    assert len(registry["indicators"]) == 7
    indicator_ids = {item["indicator_id"] for item in registry["indicators"]}
    assert len(indicator_ids) == 7
    assert all(item["sector"] == "MFG" for item in registry["indicators"])
    assert all(item["source_mapping"] for item in registry["indicators"])
    assert all(item["version_history"] for item in registry["indicators"])
    assert all(mapping["dataset_id"].startswith("DS-") for item in registry["indicators"] for mapping in item["source_mapping"])


def test_registry_schemas_define_required_source_dataset_and_indicator_contracts():
    source_schema = load_json(SCHEMAS / "source-registry.schema.json")
    dataset_schema = load_json(SCHEMAS / "dataset-registry.schema.json")
    indicator_schema = load_json(SCHEMAS / "indicator-registry.schema.json")

    assert set(source_schema["required"]) == {
        "registry_version", "schema_version", "authority", "seed_status", "sources"
    }
    assert set(source_schema["$defs"]["source"]["required"]) == {
        "source_id", "source_name", "institution", "source_tier", "source_type",
        "url_reference", "dataset_relationship", "retrieval_method", "frequency",
        "publication_release_pattern", "archive_snapshot", "provenance",
        "licensing_access", "reliability_metadata", "status"
    }
    assert set(dataset_schema["required"]) == {
        "registry_version", "schema_version", "authority", "seed_status", "datasets"
    }
    assert set(dataset_schema["$defs"]["dataset"]["required"]) == {
        "dataset_id", "dataset_name", "publisher", "source_id", "coverage", "frequency",
        "unit", "methodology", "revision_policy", "latest_observation", "ingestion_status",
        "validation_status", "current_version", "access_location", "licence", "status", "provenance"
    }
    assert set(indicator_schema["$defs"]["indicator"]["required"]) == {
        "indicator_id", "name", "definition", "unit", "frequency", "directionality",
        "indicator_type", "measurement_type", "sector", "sub_sector", "domain",
        "geography", "baseline", "benchmark", "target", "calculation_method",
        "methodology_version", "update_class", "health_status", "source_mapping",
        "version_history"
    }


def test_registry_ids_are_unique_when_records_are_present():
    source_registry = load_json(REGISTRY / "source-registry.json")
    dataset_registry = load_json(REGISTRY / "dataset-registry.json")
    indicator_registry = load_json(REGISTRY / "indicator-registry.json")
    source_ids = [item["source_id"] for item in source_registry["sources"]]
    dataset_ids = [item["dataset_id"] for item in dataset_registry["datasets"]]
    indicator_ids = [item["indicator_id"] for item in indicator_registry["indicators"]]
    assert len(source_ids) == len(set(source_ids))
    assert len(dataset_ids) == len(set(dataset_ids))
    assert len(indicator_ids) == len(set(indicator_ids))
